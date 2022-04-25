#!/usr/bin/env bats

load includes
load helpers

@test "git rank: Common option --help" {
  git-stale-branches --help |& grep -- "--help"
  git-stale-branches --help |& grep -- "--version"
}

@test "git rank: Common option -h" {
  git-stale-branches -h |& grep -- "--help"
  git-stale-branches -h |& grep -- "--version"
}

@test "git rank: Common option --version" {
  git-rank --version | \
    grep -w ${GIT_RANK_VERSION}
}

@test "git rank: Common option -V" {
  git-rank -V | \
    grep -w ${GIT_RANK_VERSION}
}

@test "git rank: Default operation" {
  output=$(git-rank) 
  grep "42.*Road Runner"     <<< $(sed -n 1p <<< "${output}") 
  grep "39.*Urs Roesch"      <<< $(sed -n 2p <<< "${output}") 
  grep "33.*Wiley E. Coyote" <<< $(sed -n 3p <<< "${output}") 
  grep "21.*Harry Potter"    <<< $(sed -n 4p <<< "${output}") 
  grep "11.*github-actions"  <<< $(sed -n 5p <<< "${output}") 
}
