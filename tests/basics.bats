#!/usr/bin/env bats

load includes

@test "git autorebase: Common option --help" {
  git-autorebase --help
}

@test "git autorebase: Common option -h" {
  git-autorebase -h
}

@test "git autorebase: Common option --version" {
  git-autorebase --version | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "git autorebase: Common option -V" {
  git-autorebase -V | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "git fpc: Common option --help" {
  git-fpc --help
}

@test "git fpc: Common option -h" {
  git-fpc -h
}

@test "git fpc: Common option --version" {
  git-fpc --version | grep -w ${GIT_FPC_VERSION}
}

@test "git fpc: Common option -V" {
  git-fpc -V | grep -w ${GIT_FPC_VERSION}
}

@test "git opush: Common option --help" {
  git-opush --help
}

@test "git opush: Common option -h" {
  git-opush -h
}

@test "git opush: Common option --version" {
  git-opush --version | grep -w ${GIT_OPUSH_VERSION}
}

@test "git opush: Common option -V" {
  git-opush -V | grep -w ${GIT_OPUSH_VERSION}
}
