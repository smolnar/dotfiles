#!/bin/bash
current="$(readlink -f $(dirname "$0"))"
previous="$(pwd)"
cd "$current"
conky -c ./rings &