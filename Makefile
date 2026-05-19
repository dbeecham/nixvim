# All sources
SRCS := $(shell fd --type f --extension lua) flake.lock

# Default target
.PHONY: nixvim
nixvim: .stamp-build

# We use stamp file since nix builds have timestamp 1970-01-01 and will always
# trigger rebuilds
.stamp-build: $(SRCS)
	nom build .
	touch $@

.PHONY: init.lua
init.lua: result
	./result/bin/nixvim-print-init
