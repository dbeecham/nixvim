{ pkgs, ... }: {

  colorscheme = "seoulbones";

  plugins.colorizer = {
    enable = true;
  };

  extraPlugins = [

    # Dependency for zenbones.nvim
    pkgs.vimPlugins.lush-nvim

    # <https://github.com/zenbones-theme/zenbones.nvim ⭐️0.9k 💾0.8k>
    pkgs.vimPlugins.zenbones-nvim

  ];

}
