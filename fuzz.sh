#!/bin/bash

/var/work/stateful/aflnet/afl-fuzz -i in -o out -t 10000 -N tcp://127.0.0.1/5432 -P PGSQL -D 700 -K -E  -- /var/work/stateful/pgbuild/bin/postgres -D /var/work/stateful/pgbuild/cls0
