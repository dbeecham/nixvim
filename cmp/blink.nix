{ lib, ... }: {

  # <https://github.com/saghen/blink.cmp ⭐️5.1k 💾1.5k>
  # Until [!836](https://github.com/Saghen/blink.cmp/issues/836) is fixed, I'm not using blink.cmp for ghost text.
  plugins.blink-cmp = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode and not package.loaded['blink-cmp']";
    settings = {

      # See [keymaps](https://cmp.saghen.dev/configuration/keymap.html) to figure this out.
      keymap.preset = "none";
      snippets.preset = "luasnip";

      # Both blink.cmp and noice has auto signature help. Make sure to only use one.
      signature = {
        enabled = false;
        window.border = "rounded";
      };

      cmdline = {
        enabled = true;
        completion.menu.auto_show = true;
        completion.list.selection.preselect = false;
      };

      completion = {
        trigger = {
          show_in_snippet = true;
          show_on_keyword = true;
          show_on_trigger_character = true;
        };
        menu = {
          auto_show = true;
          border = "rounded";
          draw = {
            columns = lib.nixvim.mkRaw ''{
                { "label", "label_description", gap = 1 },
                { "kind_icon", "kind" }
            }'';
            components = {
              kind_icon = {
                text = lib.nixvim.mkRaw ''
                  function(ctx)
                    local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                    return ' ' .. kind_icon .. ctx.icon_gap .. ' '
                  end
                '';
                highlight = lib.nixvim.mkRaw ''
                  function(ctx)
                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                    return hl
                  end
                '';
              };
              kind.highlight = lib.nixvim.mkRaw ''
                function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end
              '';
            };
          };
        };
        list.selection = {
          preselect = false;
          auto_insert = false;
        };
        ghost_text = {
          enabled = false;
          show_with_menu = false;
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 100;
          window.border = "single";
        };
      };
      sources = {
        # Adding 'buffer' to the default causes every filetype to have the
        # buffer source, even when it's not specified in 'per_filetype'.
        default = [ "lsp" "path" "snippets" ];
        per_filetype = {
          codecompanion = [ "codecompanion" ];
        };

        providers = {
          snippets.score_offset = 1; 
          buffer.score_offset = -5;
        };
      };
    };
  };

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
        debounce = 75;
      };
      panel.enabled = false;
      filetypes = {
        yaml = true;
      };
    };
  };

  plugins.blink-cmp-git = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
  };

  plugins.blink-cmp-copilot = {
    enable = false;
    lazyLoad.settings.enabled = "not vim.g.vscode";
  };

}
