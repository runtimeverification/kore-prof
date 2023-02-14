#! /bin/sh

PATH = $(stack path --local-bin) : $PATH
tar -O -xzf example.eventlog.tgz > test-prof-tsm-eventlog && \
    kore-prof \
        --timing-state-machine Unify \
        -o test-prof-tsm.sh.tmp \
        test-prof-tsm-eventlog  \
            > /dev/null && \
    rm test-prof-tsm-eventlog && \
    cat test-prof-tsm.sh.tmp
