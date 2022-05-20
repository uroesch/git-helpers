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

@test "git stale-branches: Default operation" {
  output=$(git-stale-branches) 
  grep "2018-10-29 05:28:33.*RoadRunner.*veryold-branch"           <<< "${output}"
  grep "2021-12-29 15:15:13.*Wiley E. Coyote.*experimental/ocrpdf" <<< "${output}"
  grep "2021-12-29 15:19:50.*Crayon Shinchan.*packaging/debian"    <<< "${output}"
  grep "2022-01-26 22:03:29.*Chibi Marukochan.*main"               <<< "${output}"
  grep "2022-01-26 22:25:07.*Globi.*feature/scan2pdf"              <<< "${output}"
}

@test "git stale-branches: Threshold 2 weeks ago" {
  output=$(git-stale-branches --threshold '2 weeks ago')
  grep "2018-10-29 05:28:33.*RoadRunner.*veryold-branch"           <<< "${output}"
  grep "2021-12-29 15:15:13.*Wiley E. Coyote.*experimental/ocrpdf" <<< "${output}"
  grep "2021-12-29 15:19:50.*Crayon Shinchan.*packaging/debian"    <<< "${output}"
  grep "2022-01-26 22:03:29.*Chibi Marukochan.*main"               <<< "${output}"
  grep "2022-01-26 22:25:07.*Globi.*feature/scan2pdf"              <<< "${output}"
}

@test "git stale-branches: Per week" {
  output=$(git-stale-branches --per-week)
  grep "2018-10-29 05:28:33.*RoadRunner.*veryold-branch"           <<< "${output}"
  grep "2021-12-29 15:15:13.*Wiley E. Coyote.*experimental/ocrpdf" <<< "${output}"
  grep "2021-12-29 15:19:50.*Crayon Shinchan.*packaging/debian"    <<< "${output}"
  grep "2022-01-26 22:03:29.*Chibi Marukochan.*main"               <<< "${output}"
  grep "2022-01-26 22:25:07.*Globi.*feature/scan2pdf"              <<< "${output}"
}

@test "git stale-branches: Per week - no 70s" {
  output=$(git-stale-branches --per-week)
  count=$(grep -c "1970-01-01 00:00:00 " <<< "${output}" || :)
  echo $count
  (( ${count} == 0 ))
}
