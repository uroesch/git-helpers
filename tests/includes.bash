# include file for bats tests

# -----------------------------------------------------------------------------
# Globals
# -----------------------------------------------------------------------------
export PATH=${BATS_TEST_DIRNAME}/../bin:${PATH}
export GIT_AUTOREBASE_VERSION="v0.7.1"
export GIT_FPC_VERSION="v0.6.2"
export GIT_RANK_VERSION="v0.1.0"
export GIT_OPUSH_VERSION="v0.6.1"
export GIT_WALKTREE_VERSION="v0.1.3"
export GIT_STALE_BRANCHES_VERSION="v0.4.1"
export STRIP_TRAILING_WHITESPACE_VERSION="v0.6.0"
export SHA256SUM_WHITESPACE_FILE="506dcd8e1fdd674bf75c87191145642a440cd4aa11a95fc37c4197f7a4e5118d"
export SHA256SUM_WALKTREE="3393faccc9e1f6fd999c49e8efa1df5aed19900d3bbf1ca34b17b05ea34519ac"
export TZ=UTC

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
function test::create-tempdir() {
  local prefix=${1:-test};
  local tempdir=${BATS_TMPDIR}/${prefix}-$$
  mkdir -p ${tempdir}
  export TEMPDIR=${tempdir}
}
