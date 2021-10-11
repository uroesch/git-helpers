#!/usr/bin/env bats

load includes

@test "git opush: Common option --version" {
  git-opush --version | grep -w ${GIT_OPUSH_VERSION}
}

@test "git opush: Common option -V" {
  git-opush -V | grep -w ${GIT_OPUSH_VERSION}
}
