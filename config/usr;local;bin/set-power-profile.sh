#!/bin/bash

if [ "$1" == "true" ]; then
  sudo x86_energy_perf_policy power
else
  sudo x86_energy_perf_policy performance
fi
