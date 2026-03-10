.PHONY: default
default: result

.PHONY: result
result:
	nom build .

.PHONY: init.lua
init.lua:
	nix build .#default.config.build.initFile --out-link init.lua

.PHONY: init.snacks.lua
init.snacks.lua:
	nix eval --json .#default.config.plugins.snacks.luaConfig | jq -r '[.pre, .content, .post] | join("\n")' > $@

.PHONY: init.which-key.lua
init.which-key.lua:
	nix eval --json .#default.config.plugins.which-key.luaConfig | jq -r '[.pre, .content, .post] | join("\n")' > $@
