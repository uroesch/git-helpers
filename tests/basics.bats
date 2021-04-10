#!/usr/bin/env bats

load includes

@test "Common options: git autorebase --help" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-autorebase --help
}

@test "Common options: git autorebase -h" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-autorebase -h
}

@test "Common options: git autorebase --version" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-autorebase --version | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "Common options: git autorebase -V" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-autorebase -V | grep -w ${GIT_AUTOREBASE_VERSION}
}

@test "Common options: git fpc --help" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-fpc --help
}

@test "Common options: git fpc -h" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-fpc -h
}

@test "Common options: git fpc --version" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-fpc --version | grep -w ${GIT_FPC_VERSION}
}

@test "Common options: git fpc -V" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-fpc -V | grep -w ${GIT_FPC_VERSION}
}

@test "Common options: git opush --help" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-opush --help
}

@test "Common options: git opush -h" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-opush -h
}

@test "Common options: git opush --version" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-opush --version | grep -w ${GIT_OPUSH_VERSION}
}

@test "Common options: git opush -V" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./git-opush -V | grep -w ${GIT_OPUSH_VERSION}
}

@test "Common options: strip-trailing-whitespace --help" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./strip-trailing-whitespace --help
}

@test "Common options: strip-trailing-whitespace -h" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./strip-trailing-whitespace -h
}

@test "Common options: strip-trailing-whitespace --version" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./strip-trailing-whitespace --version | grep -w ${STRIP_TRAILING_WHITESPACE_VERSION}
}

@test "Common options: strip-trailing-whitespace -V" {
  cd ${BATS_TEST_DIRNAME}/../bin && \
  ./strip-trailing-whitespace -V | grep -w ${STRIP_TRAILING_WHITESPACE_VERSION}
}
