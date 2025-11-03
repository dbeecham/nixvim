{

  # <https://github.com/MunifTanjim/nui.nvim ⭐️1.9k 💾0.6k>
  # Required for noice & avante.
  plugins.nui = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
  };

  plugins.notify = {
    enable = true;
  };

  # <https://github.com/folke/noice.nvim ⭐️5.3k 💾1.3k>
  # :checkhealth noice
  plugins.noice = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode and vim.fn.filereadable(vim.fn.expand('~/.config/nvim/noice.disable'))==0";

    settings = {
      # presets = {
      #   lsp_doc_border = true;
      # };
      lsp = {
        # blink.cmp overrides noice signature help.
        signature.enabled = false;
        # built-in is fine
        hover.enabled = false;
        progress.enabled = false;
      };

      # This is basically all I want from noice
      cmdline.enabled = true;

      # Ignore the 'Agent is not initialized' message; it's a temporary error
      # about copilot not being initialized yet.
      routes = [
        {
          filter.event = "msg_show";
          filter.any = [
            { find = "Agent service not initialized"; }
            { find = "Authenticated as GitHub user"; } 
            { find = "fewer lines"; }
          ];
          opts.skip = true;
        }
        {
          filter = {
            event = "notify";
            warning = true;
            any = [{ find = "Could not parse buffer due to Lua error"; }];
          };
          opts.skip = true;
        }
      ];
    };
  };

}
