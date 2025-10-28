{
  imports = [
    ./snacks.nix
    ./mini.nix

    # I don't like Noice, but it's the only plugin I know that implements a cmdline.
    ./noice.nix
    ./lualine.nix
    ./which-key.nix
    ./gutter.nix
    ./theme/default.nix
  ];
}
