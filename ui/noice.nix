{

  # <https://github.com/MunifTanjim/nui.nvim ⭐️1.9k 💾0.6k>
  # Required for noice & avante.
  plugins.nui = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
  };

  # <https://github.com/folke/noice.nvim ⭐️5.3k 💾1.3k>
  # :checkhealth noice
  plugins.noice = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";

    settings = {

      presets = {
        lsp_doc_border = true;
      };

      lsp = {
        signature = {
          enabled = true;
          auto_open = {
            enabled = true;
          };
        };
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
        hover.enabled = true;
        progress.enabled = false;
      };

      cmdline = {
        enabled = true;
      };

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
          filter.event = "notify";
          filter.title = "snip";
          view = "mini";
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
