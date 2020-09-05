#!/bin/bash

../afl-fuzz -i in -o out -t 10000 -N tcp://127.0.0.1/15432 -P PGSQL -D 700 -K -E -- ../../pgbuild/bin/postgres -D ../../pgbuild/cls0
