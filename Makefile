default: build

.PHONY: test-speedscope test-tsm test build

build:
	stack install

KORE_PROF := cabal exec kore-prof --
TEST_DIR := test/smoketest

test-speedscope: build
	echo $(KORE_PROF)
	tar -O -xzf $(TEST_DIR)/example.eventlog.tgz > $(TEST_DIR)/test-prof-speedscope-eventlog
	${KORE_PROF} $(TEST_DIR)/test-prof-speedscope-eventlog > $(TEST_DIR)/test-prof-speedscope.sh.out
	diff -s $(TEST_DIR)/test-prof-speedscope.sh.out.golden $(TEST_DIR)/test-prof-speedscope.sh.out
	rm $(TEST_DIR)/test-prof-speedscope-eventlog
	rm $(TEST_DIR)/test-prof-speedscope.sh.out

test-tsm: build
	tar -O -xzf $(TEST_DIR)/example.eventlog.tgz > $(TEST_DIR)/test-prof-tsm-eventlog
	$(KORE_PROF) \
       	 --timing-state-machine Unify \
       	 -o $(TEST_DIR)/test-prof-tsm.sh.out \
       	 $(TEST_DIR)/test-prof-tsm-eventlog 2> /dev/null
	diff -s $(TEST_DIR)/test-prof-tsm.sh.out.golden $(TEST_DIR)/test-prof-tsm.sh.out
	rm $(TEST_DIR)/test-prof-tsm-eventlog
	rm $(TEST_DIR)/test-prof-tsm.sh.out

test: test-speedscope test-tsm
