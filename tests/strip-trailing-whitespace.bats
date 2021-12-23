#!/usr/bin/env bats

load includes

@test "strip-trailing-whitespace: Common option --help" {
  strip-trailing-whitespace --help |& grep -- "--help"
  strip-trailing-whitespace --help |& grep -- "--quiet"
  strip-trailing-whitespace --help |& grep -- "--version"
}

@test "strip-trailing-whitespace: Common option -h" {
  strip-trailing-whitespace -h |& grep -- "-h"
  strip-trailing-whitespace -h |& grep -- "-q"
  strip-trailing-whitespace -h |& grep -- "-V"
}

@test "strip-trailing-whitespace: Common option --version" {
  strip-trailing-whitespace --version | \
    grep -w ${STRIP_TRAILING_WHITESPACE_VERSION}
}

@test "strip-trailing-whitespace: Common option -V" {
  strip-trailing-whitespace -V | \
    grep -w ${STRIP_TRAILING_WHITESPACE_VERSION}
}

@test "strip-trailing-whitespace: Strip white space from file" {
  test::create-tempdir stw
  cp ${BATS_TEST_DIRNAME}/files/whitespace.txt ${TEMPDIR}/
  strip-trailing-whitespace ${TEMPDIR}/whitespace.txt
  sha256sum ${TEMPDIR}/whitespace.txt | grep -w ${SHA256SUM_WHITESPACE_FILE}
}
