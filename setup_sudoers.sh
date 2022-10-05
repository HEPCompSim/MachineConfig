#!/bin/bash

USER=$1
SCRIPT=$2

echo "${USER} ALL=(root) NOPASSWD: ${SCRIPT}" >> /etc/sudoers
