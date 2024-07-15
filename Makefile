# Copyright (c) 2023 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause

README.md: README.md.sh
	rm -f -- $@
	sh $^ > $@
	chmod -w $@
