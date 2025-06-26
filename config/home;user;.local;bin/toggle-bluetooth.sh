#!/bin/bash

if systemctl is-active --quiet bluetooth; then
  systemctl stop bluetooth obex
else
  systemctl start bluetooth obex
fi
