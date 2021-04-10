# include file for bats tests

# -----------------------------------------------------------------------------
# Globals
# -----------------------------------------------------------------------------
export PATH=${BATS_TEST_DIRNAME}/../bin:${PATH}
export GIT_AUTOREBASE_VERSION="v0.4.0"
export GIT_FPC_VERSION="v0.5.0"
export GIT_OPUSH_VERSION="v0.4.0"
export STRIP_TRAILING_WHITESPACE_VERSION="v0.4.0"
export SHA256SUM_WHITESPACE_FILE="506dcd8e1fdd674bf75c87191145642a440cd4aa11a95fc37c4197f7a4e5118d"

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
function test::create-tempdir() {
  local prefix=${1:-test};
  local tempdir=${BATS_TMPDIR}/${prefix}-$$
  mkdir -p ${tempdir}
  export TEMPDIR=${tempdir}
}
