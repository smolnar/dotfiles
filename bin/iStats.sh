#!/bin/bash

case $1 in
  cpu)
    iStats cpu | tr -s " " | cut -f3 -d' '
    ;;
  battery)
    iStats battery temp | tr -s " " | cut -f3 -d ' '
    ;;
esac
