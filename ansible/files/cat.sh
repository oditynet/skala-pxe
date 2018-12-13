#!/bin/bash
for i in {1..32}; do `nohup cat /dev/zero > /dev/null &`;  done