#!/usr/bin/env bats

load includes
load helpers

@test "git fpc: Common option --help" {
  git-fpc --help |& grep -- "--help"
  git-fpc --help |& grep -- "--base"
  git-fpc --help |& grep -- "--version"
}

@test "git fpc: Common option -h" {
  git-fpc -h |& grep -- "--help"
  git-fpc -h |& grep -- "--base"
  git-fpc -h |& grep -- "--version"
}

@test "git fpc: Common option --version" {
  git-fpc --version | grep -w ${GIT_FPC_VERSION}
}

@test "git fpc: Common option -V" {
  git-fpc -V | grep -w ${GIT_FPC_VERSION}
}

@test "git fpc: Standard operation" {
  git-fpc | grep 'Updating 45d5290..885f6c7'
  git-fpc | grep 'Deleted branch feature (was 092a7bb).'
}
