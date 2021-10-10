#!/usr/bin/env bats

load includes
load helpers

@test "git autorebase: Common option --help" {
  git-autorebase --help |& grep -- "--help"
  git-autorebase --help |& grep -- "--push"
  git-autorebase --help |& grep -- "--base"
  git-autorebase --help |& grep -- "--version"
}

@test "git autorebase: Common option -h" {
  git-autorebase -h |& grep -- "--help"
  git-autorebase -h |& grep -- "--push"
  git-autorebase -h |& grep -- "--base"
  git-autorebase -h |& grep -- "--version"
}

@test "git autorebase: Common option --version" {
  git-autorebase --version | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "git autorebae: Common option -V" {
  git-autorebase -V | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "git autorebase: Standard operation" {
  git-autorebase | grep 'Updating 45d5290..885f6c7'
  git-autorebase | grep "Switched to branch 'feature'"
  git-autorebase | grep "Switched to branch 'bugfix'"
  (( $(git-autorebase | grep -c "Successfully rebased and updated refs") == 2 )) 
}
