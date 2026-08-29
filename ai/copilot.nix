{
  # <https://github.com/zbirenbaum/copilot.lua ⭐️3.6k 💾0.4k>
  # Login using `:Copilot auth`
  # Functions on copilot.suggestion:
  #  accept
  #  accept_line
  #  accept_word
  #  dismiss
  #  is_visible
  #  next
  #  prev
  #  setup
  #  teardown
  #  toggle_auto_trigger
  plugins.copilot-lua = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
    settings = {
      suggestion = {
        enabled = true;
        auto_trigger = true;
        hide_during_completion = true;
        debounce = 15;
      };
      panel = {
        enabled = true;
        auto_refresh = true;
      };
      filetypes = {
        yaml = true;
        rust = true;
        lua = true;
        css = true;
      };
    };
  };
}
