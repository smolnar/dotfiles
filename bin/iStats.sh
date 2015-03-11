#!/bin/bash

case $1 in
  cpu)
    iStats cpu | cut -f3 -d' '
    ;;
  battery)
    iStats battery temp | cut -f3 -d ' '
    ;;
esac
