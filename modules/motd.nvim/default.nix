{ lib, ... }:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "motd-nvim";
  maintainers = "dbe";
  moduleName = "motd";
  extraConfig = {
    nixpkgs.overlays = [
      (self: super: {
        vimPlugins = super.vimPlugins // {
          motd-nvim = self.vimUtils.buildVimPlugin {
            name = "motd.nvim";
            src = ./.;
          };
        };
      })
    ];
  };
}
