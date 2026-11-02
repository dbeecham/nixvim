{

  # <https://github.com/MunifTanjim/nui.nvim ⭐️1.9k 💾0.6k>
  # Required for noice & avante.
  plugins.nui = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
  };

  plugins.notify = {
    enable = false;
  };

  # <https://github.com/folke/noice.nvim ⭐️5.3k 💾1.3k>
  # :checkhealth noice
  plugins.noice = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode and not package.loaded['noice']";

    settings = {
      presets = {
        # I very often get errors like `Lua: ...ped-0.12.5/share/nvim/runtime/lua/vim/lsp/inlay_hint.lua:362: Invalid 'col': out of range`
        # which is incredibly annoying. This should fix that?
        long_message_to_split = true;
      };
      
      lsp = {
        # blink.cmp overrides noice signature help.
        signature.enabled = true;
        hover.enabled = true;

        # LSP progress is shown with fidget.nvim.
        progress.enabled = false;

        documentation = {
          opts = {
            border.style = "rounded";
            relative = "cursor";
            position = {
              row = 2;
              col = 0;
            };
            size.width = 0.9;
          };
        };
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


      # I tried this first as a way to get rid of the annoying truncated paths on errors, but it doesn't work, and it makes errors very annoying.
      # messages = {
      #   view_error = "split";
      # };

    };
  };

}
