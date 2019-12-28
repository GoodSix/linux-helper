#!/bin/bash
before() {
  return 1
}

setup() {
  echo 'install'
}

start() {
  echo 'start'
}

stop() {
  echo 'stop'
}

# /etc/os-release
# 测试