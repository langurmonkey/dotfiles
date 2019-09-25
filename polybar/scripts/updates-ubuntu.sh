#!/usr/bin/env bash

updates=$(apt-get dist-upgrade -s --quiet=2 | grep ^Inst | wc -l)
echo "$updates"
