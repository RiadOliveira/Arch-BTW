#!/bin/bash
if [ "$1" == "true" ]; then
  cpupower frequency-set -g powersave
  x86_energy_perf_policy power
else
  cpupower frequency-set -g performance
  x86_energy_perf_policy performance
fi
