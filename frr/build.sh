#!/bin/bash
#
docker build -t hnkeyang/frr:latest .
docker build -t hnkeyang/frr:10.6.1 -t hnkeyang/frr:latest .
