# -----------------------------------------------------------------------------
# Setup
# -----------------------------------------------------------------------------
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -o errexit -o nounset -o pipefail -c
.DELETE_ON_ERROR:
.RECIPEPREFIX = >
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

# -----------------------------------------------------------------------------
# Globals
# -----------------------------------------------------------------------------
USER_BIN   := $(HOME)/bin

# -----------------------------------------------------------------------------
# User install
# -----------------------------------------------------------------------------
user_install:
> @echo "Install git-helpers under $(USER_BIN)"
> mkdir -p $(USER_BIN) || :
> for script in bin/*; do
>   basename=$${script##*/}
>   install $${script} $(USER_BIN)/$${basename} && 
>     echo "-> Installing $${script} to $(USER_BIN)/$${basename}"
> done

user_uninstall:
> @echo "Uninstall git-helpers from $(USER_BIN)"
> for script in bin/*; do
>   basename=$${script##*/}
>   if [[ -f $(USER_BIN)/$${basename} ]]; then
>     rm $(USER_BIN)/$${basename} && 
>       echo "-> Unstalling $(USER_BIN)/$${basename}"
>   fi
> done

# -----------------------------------------------------------------------------
# Run tests
# -----------------------------------------------------------------------------
test:
> bats tests/*.bats
