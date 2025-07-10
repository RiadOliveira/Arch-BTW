#!/bin/bash

current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( current * 100 / max ))

low=0
high=100

if [ "$percent" -lt 50 ]; then
  brightnessctl -n1 set ${high}%
else
  brightnessctl -n1 set ${low}%
fi
