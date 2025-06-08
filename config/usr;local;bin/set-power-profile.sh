#!/bin/bash

if [ "$1" == "true" ]; then
  x86_energy_perf_policy power
else
  x86_energy_perf_policy performance
fi
