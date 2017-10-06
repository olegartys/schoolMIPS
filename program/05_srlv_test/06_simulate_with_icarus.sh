#!/bin/bash

rm -rf sim
mkdir sim
cd sim

cp ../*.hex .

# compile
iverilog -g2005 -D SIMULATION -D ICARUS -I ../../../src -I ../../../testbench -s sm_testbench ../../../src/*.v ../../../testbench/*.v

# simulation
vvp -la.lst -n a.out -vcd

# output
if [[ $1 == "-m" ]]; then
	gtkwave dump.vcd
fi

cd ..
