.PHONY: init.lua
init.lua:
	nix build .#default.config.build.initFile --out-link init.lua
