#!/usr/bin/env bats

load includes

@test "Common options: strip-trailing-whitespace --help" {
  strip-trailing-whitespace --help
}

@test "Common options: strip-trailing-whitespace -h" {
  strip-trailing-whitespace -h
}

@test "Common options: strip-trailing-whitespace --version" {
  strip-trailing-whitespace --version | grep -w ${STRIP_TRAILING_WHITESPACE_VERSION}
}

@test "Common options: strip-trailing-whitespace -V" {
  strip-trailing-whitespace -V | grep -w ${STRIP_TRAILING_WHITESPACE_VERSION}
}

@test "Strip whitespace from file" { 
  test::create-tempdir stw
  cp ${BATS_TEST_DIRNAME}/files/whitespace.txt ${TEMPDIR}/
  strip-trailing-whitespace ${TEMPDIR}/whitespace.txt
  sha256sum ${TEMPDIR}/whitespace.txt | grep -w ${SHA256SUM_WHITESPACE_FILE}
}
