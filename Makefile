default: build
build:
	stack install
test: build
	export KORE_PROF=$(stack path --local-bin) && \
		cd kore-prof/test/smoketest && \
			echo $(KORE_PROF)
			#./test-prof-speedscope.sh
			#ls
		#	kore-prof/test/prof-smoketest/test-prof-speedscope.sh

# $(stack path --local-bin)
