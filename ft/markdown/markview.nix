{
  # <https://github.com/OXY2DEV/markview.nvim ⭐️2.8k 💾0.6k>
  # Markdown renderer in neovim. Used by codecompanion.
  plugins.markview = {
    enable = true;
    settings.preview = {
      filetypes = [ "markdown" "codecompanion" ];
      ignore_buftypes = [];
      buf_ignore = [];
    };
  };
}
