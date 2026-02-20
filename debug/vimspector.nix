{ pkgs, ... }: {

  # <https://github.com/puremourning/vimspector>
  extraPlugins = with pkgs.vimPlugins; [
    vimspector
  ];

}
