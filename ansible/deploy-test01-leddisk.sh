#!/bin/bash
eval  ansible $1 -m shell -a  "'ledctl locate=/dev/$2'"