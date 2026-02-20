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
