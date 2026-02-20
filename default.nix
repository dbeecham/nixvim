{ self, ... }: 
{

  imports = [ 

    {
      nixpkgs.overlays = [
        (final: prev: {
          vimPlugins = prev.vimPlugins // {

            snacks-nvim = prev.vimPlugins.snacks-nvim.overrideAttrs (old: {
              src = self.inputs.snacks-nvim;
              version = self.inputs.snacks-nvim.rev;
            });

            markdown-table-mode = final.vimUtils.buildVimPlugin {
              pname = "markdown-table-mode";
              src = self.inputs.markdown-table-mode;
              version = self.inputs.markdown-table-mode.rev;
            };

          };
        })
      ];
    }

    ./performance.nix
    ./mkview.nix
    ./surround.nix
    ./ts/default.nix
    ./ui/default.nix
    ./cmp/default.nix
    ./slime/default.nix
    ./ai/default.nix
    ./zen/default.nix
    ./nav/default.nix
    ./ft/default.nix
    ./lsp/default.nix
    ./debug/default.nix
    ./build/default.nix
    ./everything.nix

  ];

}
