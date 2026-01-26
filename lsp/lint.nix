{ pkgs, ... }: {

  extraPackages = with pkgs; [
    # jsonlint
    python313Packages.demjson3
  ];

  # <https://github.com/mfussenegger/nvim-lint/ ⭐️2.4k 💾0.5k>
  plugins.lint.enable = true;

  extraPackagesAfter = with pkgs; [
    shellcheck
  ];

}
