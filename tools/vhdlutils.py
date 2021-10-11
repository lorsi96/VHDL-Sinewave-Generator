# Author: lorsi@itba.edu.ar
import argparse
from pathlib import Path
import os
from typing import List


def gather_sources(path) -> List:
    return [str(p) for p in Path(path).rglob("*.[vV][hH][dD]")]


STOP_TIME = 20000000  # Nanoseconds.

def get_command(dut, inc_sim=True, stop_time=STOP_TIME):
    root = os.getcwd()
    sim_path = os.path.join(root, 'sim')
    deps = ' '.join(gather_sources(os.path.join(root, 'src')))

    cmds = [
        f'cd {sim_path}',
        f'ghdl -a {deps}',
        f'ghdl -s {deps}',
        f'ghdl -e {dut}_tb',
        f'ghdl -r {dut}_tb --vcd={dut}_tb.vcd --stop-time={stop_time}ns',
    ]
    if inc_sim:
        cmds.append(f'gtkwave {dut}_tb.vcd') 

    print(cmds)
    return ' && '.join(cmds)


run =  os.system

parser = argparse.ArgumentParser(description='Compile and simulate VHDL sources.')
parser.add_argument('component', type=str, help='Component whose testbench will be simulated')
parser.add_argument('--time', type=int, default=STOP_TIME, help='dimulation stoptime in nanoseconds')
parser.add_argument('--compile-only', default=False, help='does not run any simulation', action='store_true')


if __name__ == '__main__':
    args = parser.parse_args()
    if args.component:
        cmd = get_command(args.component, not args.compile_only, args.time)
    os.system(cmd)

        

