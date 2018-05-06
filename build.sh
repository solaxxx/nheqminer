#!/bin/bash
git pull
cd cpu_xenoncat/asm_linux/
chmod 777 assemble.sh
chmod 777 fasm
sh assemble.sh
cd ../../../
pwd
rm -rf nheqminer-build
mkdir nheqminer-build && cd nheqminer-build
pwd
cmake ../nheqminer
make -j $(nproc)
#rename nheqminer sshl nheqminer
mv nheqminer sshl