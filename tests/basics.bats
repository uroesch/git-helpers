#!/usr/bin/env bats

load includes

@test "Common options: git autorebase --help" {
  git-autorebase --help
}

@test "Common options: git autorebase -h" {
  git-autorebase -h
}

@test "Common options: git autorebase --version" {
  git-autorebase --version | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "Common options: git autorebase -V" {
  git-autorebase -V | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "Common options: git fpc --help" {
  git-fpc --help
}

@test "Common options: git fpc -h" {
  git-fpc -h
}

@test "Common options: git fpc --version" {
  git-fpc --version | grep -w ${GIT_FPC_VERSION}
}

@test "Common options: git fpc -V" {
  git-fpc -V | grep -w ${GIT_FPC_VERSION}
}

@test "Common options: git opush --help" {
  git-opush --help
}

@test "Common options: git opush -h" {
  git-opush -h
}

@test "Common options: git opush --version" {
  git-opush --version | grep -w ${GIT_OPUSH_VERSION}
}

@test "Common options: git opush -V" {
  git-opush -V | grep -w ${GIT_OPUSH_VERSION}
}
