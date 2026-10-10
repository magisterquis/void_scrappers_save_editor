#!/bin/ksh
#
# parse.t
# Make sure we can read a file ok
# By J. Stuart McMurray
# Created 20250428
# Last Modified 20261010

set -euo pipefail

. t/shmore.subr

set -A HAVES t/testdata/parse/*.have
tap_plan $((2 * ${#HAVES[@]}))

for HAVE in "${HAVES[@]}"; do
        GOT=$(./void_scrappers_save_editor "$HAVE")
        tap_ok "$?" "Parsed $HAVE ok" "$0" $LINENO

        WANT=${HAVE%%.have}.want
        DIFF=$(diff -u -L Want -L Got "$WANT" - <<_eof ||:
$GOT
_eof
)
        tap_is "$DIFF" "" "$HAVE -> $WANT" "$0" $LINENO
done

# vim: ft=sh
