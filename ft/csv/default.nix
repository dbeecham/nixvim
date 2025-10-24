{
  plugins.csvview = {
    enable = true;
    settings = {
      view = {
        display_mode = "border";
        header_lnum = 1;
      };
    };
    lazyLoad.settings.enabled = "not vim.g.vscode";
  };
}
