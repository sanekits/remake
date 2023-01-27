# shellkit-integration.mk for sanekits/remake

DebianDepends := autotools-dev autoconf autopoint gcc pkg-config gettext libreadline-dev guile-2.2 make lzip

.PHONY: nope
nope:
	exit "Sorry, you need to read GNUmakefile"

.PHONY: noproxy
noproxy:
	@# Fails if proxy is enabled
	@curl -I artprod.dev.bloomberg.com && exit 1 || exit 0

.PHONY: autotools-cfg
autotools-cfg:
	# For debian/ubuntu, -ish
	sudo apt-get update && sudo apt-get install -y $(DebianDepends)

.PHONY: build-setup
build-setup: noproxy
	which autoconf || $(MAKE) autotools-cfg
	./autogen.sh




