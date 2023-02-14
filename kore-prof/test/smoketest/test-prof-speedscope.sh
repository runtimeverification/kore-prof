#! /bin/sh
PATH = $(stack path --local-bin) : $PATH
tar -O -xzf example.eventlog.tgz > test-prof-speedscope-eventlog && \
    kore-prof test-prof-speedscope-eventlog && \
    rm test-prof-speedscope-eventlog
