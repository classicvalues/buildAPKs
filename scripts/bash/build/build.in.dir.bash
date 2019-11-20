#!/bin/env bash 
# Copyright 2019 (c) all rights reserved 
# by SDRausty https://sdrausty.github.io
#####################################################################
set -Eeuo pipefail
shopt -s nullglob globstar
export RDR="$HOME/buildAPKs"
. "$RDR"/scripts/bash/init/ushlibs.bash
. "$RDR"/scripts/bash/shlibs/trap.bash 201 211 221 "${0##*/}" wake.start
export DAY="$(date +%Y%m%d)"
export JAD=""
export JID="in.dir.${PWD##*/}"
export JDR="$PWD"
export NUM="$(date +%s)"
if [[ "$HOME" = "$PWD" ]] 
then
	printf "\\n\\e[1;7;38;5;0mbuildAPKs %s WARNING:  Cannot run in %s!  Signal 224 generated by %s in %s.\\e[0m\\n\\n" "${0##*/}" "$HOME" "${0##*/}" "$PWD"
	exit 224
fi
JDR="$PWD"
. "$RDR"/scripts/bash/shlibs/lock.bash
. "$RDR"/scripts/bash/shlibs/buildAPKs/bnchn.bash bch.st 
. "$RDR"/scripts/bash/shlibs/buildAPKs/fandm.bash 
_ANDB_ "$JDR"
. "$RDR"/scripts/bash/shlibs/buildAPKs/bnchn.bash bch.gt 
# build.in.dir.bash EOF
