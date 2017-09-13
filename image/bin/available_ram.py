#!/usr/bin/env python

import math
import sys

with open('/proc/meminfo', 'r') as f:
    for line in f:
        if 'MemFree' in line:
            memory_in_kilobytes = float(line.split()[1])
            break

one_gigabyte        = 1
memory_in_gigabytes = memory_in_kilobytes / pow(1024, 2)

integer_memory_in_gigabytes = max(one_gigabyte, int(math.floor(memory_in_gigabytes)))

sys.stdout.write(str(integer_memory_in_gigabytes))
sys.stdout.flush()
