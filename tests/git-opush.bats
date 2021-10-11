#!/usr/bin/env bats

load includes
load helpers

@test "git opush: Common option --help" {
  git-opush --help |& grep -- "--help"
  git-opush --help |& grep -- "--force"
  git-opush --help |& grep -- "--remove"
  git-opush --help |& grep -- "--base"
  git-opush --help |& grep -- "--version"
}

@test "git opush: Common option -h" {
  git-opush -h |& grep -- "--help"
  git-opush -h |& grep -- "--force"
  git-opush -h |& grep -- "--remove"
  git-opush -h |& grep -- "--base"
  git-opush -h |& grep -- "--version"
}

@test "git opush: Common option --version" {
  git-opush --version | grep -w ${GIT_OPUSH_VERSION}
}

@test "git opush: Common option -V" {
  git-opush -V | grep -w ${GIT_OPUSH_VERSION}
}

@test "git opush: Standard operation" {
  git-opush | grep -F '* [new branch]      foobar -> foobar'
  git-opush | grep -F '* [new tag]         foo -> foo'
}
