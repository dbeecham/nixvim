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

            # tree-climber-nvim = final.vimUtils.buildVimPlugin {
            #   pname = "tree-climber-nvim";
            #   src = self.inputs.tree-climber-nvim;
            #   version = self.inputs.tree-climber-nvim.rev;
            #   doCheck = false;
            #   postInstall = ''
            #     rm -f $out/Makefile
            #     rm -f $out/README.md
            #     rm -f $out/LICENSE
            #     rm -rf $out/tests
            #   '';
            # };

          };
        })
      ];
    }

    ./performance.nix
    ./mkview.nix
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
