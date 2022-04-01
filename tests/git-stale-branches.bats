#!/usr/bin/env bats

load includes
load helpers

@test "git stale-branches: Common option --help" {
  git-stale-branches --help |& grep -- "--help"
  git-stale-branches --help |& grep -- "--threshold"
  git-stale-branches --help |& grep -- "--per-week"
  git-stale-branches --help |& grep -- "--version"
}

@test "git stale-branches: Common option -h" {
  git-stale-branches -h |& grep -- "--help"
  git-stale-branches -h |& grep -- "--threshold"
  git-stale-branches -h |& grep -- "--per-week"
  git-stale-branches -h |& grep -- "--version"
}

@test "git stale-branches: Common option --version" {
  git-stale-branches --version | \
    grep -w ${GIT_STALE_BRANCHES_VERSION}
}

@test "git stale-branches: Common option -V" {
  git-stale-branches -V | \
    grep -w ${GIT_STALE_BRANCHES_VERSION}
}

