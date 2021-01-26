#!/bin/sh

awk -F':' '{ print $1 ":" $3 ":" $7}' /etc/passwd

# similar to System 20