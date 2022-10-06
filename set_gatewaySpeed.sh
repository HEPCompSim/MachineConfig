#!/bin/bash

SPEED = $1

ethtool -s enp4s0 speed ${SPEED}  duplex full autoneg off
