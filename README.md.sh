#! /bin/sh -
#
# Copyright (c) 2023-2024 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause
#

tab_character='	'

set -eu

cat <<'EOF'
# 0mp's Homebrew Tap of Essentials

## Available formulae

EOF

{
  printf '%s\t%s\n' "Formula" "Description"
  brew desc --eval-all --formula Formula/* | sed "s/:/${tab_character}/"
} | mlr --itsv --omd cat

echo

cat <<'EOF'
## How do I install these formulae?

`brew install 0mp/essentials/<formula>`

Or `brew tap 0mp/essentials` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
EOF
