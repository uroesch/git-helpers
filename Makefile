# -----------------------------------------------------------------------------
# Setup
# -----------------------------------------------------------------------------
SHELL := bash
.ONESHELL:
.SHELLFLAGS  := -o errexit -o nounset -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS    += --warn-undefined-variables
MAKEFLAGS    += --no-builtin-rules
BASH_VERSION += 4.2

# -----------------------------------------------------------------------------
# Globals
# -----------------------------------------------------------------------------
USER_BIN   := $(HOME)/bin

# -----------------------------------------------------------------------------
# User install
# -----------------------------------------------------------------------------
user_install:
	@echo "Install git-helpers under $(USER_BIN)"
	mkdir -p $(USER_BIN) || :
	for script in bin/*; do
		basename=$${script##*/}
		install $${script} $(USER_BIN)/$${basename} && 
			echo "-> Installing $${script} to $(USER_BIN)/$${basename}"
	done

user_uninstall:
	@echo "Uninstall git-helpers from $(USER_BIN)"
	for script in bin/*; do
		basename=$${script##*/}
		if [[ -f $(USER_BIN)/$${basename} ]]; then
			rm $(USER_BIN)/$${basename} && 
			echo "-> Unstalling $(USER_BIN)/$${basename}"
		fi
	done

# -----------------------------------------------------------------------------
# Run tests
# -----------------------------------------------------------------------------
test:
	bats tests/*.bats

test-bash:
	declare -a VERSIONS=( 4.2 4.3 4.4 5.0 5.1 )
	function  install() {
		apk add \
		  bats \
			coreutils \
			git \
			grep \
			make; \
	}; \
	for version in $${VERSIONS[@]}; do \
		docker run \
			--rm \
			--tty \
			--volume $$(pwd):/git-helpers \
			--workdir /git-helpers \
			bash:$${version} \
			bash -c "$$(declare -f install); install && make test"; \
	done;

# vim: shiftwidth=2 noexpandtab :
