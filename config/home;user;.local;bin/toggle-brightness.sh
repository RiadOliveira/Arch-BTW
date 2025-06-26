#!/bin/bash

current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( current * 100 / max ))

low=1
high=100

if [ "$percent" -lt 50 ]; then
  brightnessctl -e4 -n2 set ${high}%
else
  brightnessctl -e4 -n2 set ${low}%
fi
