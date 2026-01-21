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


  # Use :CodeCompanionChat to open the chat window
  # Use :checkhealth codecompanion to check health
  # In visual mode, use `:CodeCompanion <prompt>` to ask an LLM a question
  plugins.codecompanion = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode and not package.loaded['codecompanion']";
  };

}
