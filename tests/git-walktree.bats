#!/usr/bin/env bats

load includes

@test "git walktree: Common option --help" {
  git-walktree --help
}

@test "git walktree: Common option -h" {
  git-walktree -h
}

@test "git walktree: Common option --version" {
  git-walktree --version | grep -w ${GIT_WALKTREE_VERSION}
}

@test "git walktree: Common option -V" {
  git-walktree -V | grep -w ${GIT_WALKTREE_VERSION}
}

@test "git walktree: Checking commit 25bf9b" {
  git-walktree 25bf9b | \
    sha256sum | \
    grep -w ${SHA256SUM_WALKTREE}
}
