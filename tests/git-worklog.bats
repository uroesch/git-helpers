#!/usr/bin/env bats

load includes
load helpers

@test "git worklog: Common option --help" {
  git-worklog --help |& grep -- "--help"
  git-worklog --help |& grep -- "--day"
  git-worklog --help |& grep -- "--days"
  git-worklog --help |& grep -- "--week"
  git-worklog --help |& grep -- "--weeks"
  git-worklog --help |& grep -- "--author"
  git-worklog --help |& grep -- "--version"
}

@test "git worklog: Common option -h" {
  git-worklog --help |& grep -- "-h"
  git-worklog --help |& grep -- "-d"
  git-worklog --help |& grep -- "-D"
  git-worklog --help |& grep -- "-w"
  git-worklog --help |& grep -- "-W"
  git-worklog --help |& grep -- "-a"
  git-worklog --help |& grep -- "-V"
}

@test "git worklog: Common option --version" {
  git-worklog --version | \
    grep -w ${GIT_WORKLOG_VERSION}
}

@test "git worklog: Common option -V" {
  git-worklog -V | \
    grep -w ${GIT_WORKLOG_VERSION}
}

@test "git worklog: default operation" {
  result=$(git-worklog)
  grep -w 0000000 <<< "${result}"
  grep -w 9999999 <<< "${result}"
  grep -w 8888888 <<< "${result}"
}

@test "git worklog: 52 weeks option" {
  result=$(git-worklog --weeks 52)
  grep -w 0000000 <<< "${result}"
  grep -w 9999999 <<< "${result}"
  grep -w 8888888 <<< "${result}"
  grep -w 6666666 <<< "${result}"
  grep -w 4444444 <<< "${result}"
  grep -w 3333333 <<< "${result}"
}

@test "git worklog: author Wiley E. Coyote" {
  result=$(git-worklog --author "Wiley E. Coyote")
  grep -w 7777777 <<< "${result}"
  grep -w 5555555 <<< "${result}"
}
