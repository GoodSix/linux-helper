#!/bin/bash

if [[ ! `which add-apt-repository` ]]; then
    apt update
    apt-get install software-properties-common -y
    apt-get install python-software-properties -y
fi
