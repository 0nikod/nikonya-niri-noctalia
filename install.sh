#!/bin/bash

sudo -v || exit 1


./01-link-config.sh
./02-resolve-dolphin.sh
