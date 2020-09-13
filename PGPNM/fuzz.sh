#!/bin/bash

../afl-fuzz -i in -o out -t 100000 -N tcp://127.0.0.1/15432 -w 200000 -P PGSQL -D 300000 -K -E -- ../../pgbuild/bin/postgres -D ../../pgbuild/cls0
