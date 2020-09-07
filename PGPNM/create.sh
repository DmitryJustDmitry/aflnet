#!/bin/bash 

#Compile Compiler
cd ../llvm_mode
make && make install
cd ..
CFLAGS="-g -O0" CXXFLAGS="-g -O0" make -j2

#Clone from GIT
cd ../
git clone --single-branch --depth=1 --branch=REL_12_0  https://github.com/postgres/postgres
cd postgres

#Apply Patch
cp ../aflnet/PGPNM/pg.patch pg.patch
patch -p1 < pg.patch

#Compile
CC=`pwd`/../aflnet/afl-clang CXX=`pwd`/../aflnet/afl-clang++ CFLAGS="-g -O0" CXXFLAGS="-g -O0" ./configure --prefix=`pwd`/../pgbuild
make -j20 && make install


#Create DB
cd ../aflnet/PGPNM
../../pgbuild/bin/initdb -D ../../pgbuild/cls0
cp -f postgresql.conf ../../pgbuild/cls0/postgresql.conf

#Tune the OS for fuzzing
su root -c "echo core >/proc/sys/kernel/core_pattern"
