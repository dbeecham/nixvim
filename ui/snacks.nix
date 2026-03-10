{ lib, config, ... }: {

  # <https://github.com/folke/snacks.nvim ⭐️5.8k 💾2.0k>
  # Required for noice & avante
  # Use ':checkhealth snacks' to check if the snacks.nvim plugin is working.
  # Note: It's apparently not possible to hot-reload snacks.nvim.
  plugins.snacks = {
    enable = true; # required for noice & avante
    settings = {

      dim = {
        enabled = true;
        scope = {
          min_size = 10;
          max_size = 24;
        };
        animate = {
          enabled = true;
          easing = "outQuad";
        };
        filter = lib.nixvim.mkRaw ''
          function(buf)
            return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
          end
        '';
      };
      layout.enabled = true;
      scope.enabled = true;
      picker = {
        enabled = true;
        ui_select = true;
        sources = {
          gh_issue = {
            enabled = true;
          };
          gh_pr = {
            enabled = true;
          };
        };
        main = {
          current = true;
        };
        win = {
          input = {
            keys = {
              "<Tab>" = { __unkeyed-1 = "confirm"; mode = [ "n" "i" ]; };
              "<C-u>" = false;
            };
          };
        };
      };
      gh.enabled = true;
      explorer = {
        enabled = true;
        replace_netrw = true;
      };
      quickfile.enabled = true;

      toggle = {
        enabled = true;
      };

      lazygit = {
        enabled = true;
      };

      notifier = {
        enabled = true;
        style = "compact";
      };
      zen.enabled = true;

      dashboard = {
        sections = [
          { section = "header"; }
          #{ icon = " "; title = "Keymaps"; section = "keymaps"; indent = 2; padding = 1; }
          { icon = " "; title = "Recent Files"; section = "recent_files"; indent = 2; padding = 1; }
          { icon = " "; title = "Projects"; section = "projects"; indent = 2; padding = 1; }
          # { section = "startup"; } # Does not work because we don't have lazy.nvim
        ];
      };

    };

    luaConfig.post = ''
      require('snacks').toggle.option('wrap', { name = "Wrap Lines" }):map('<leader>tw')
      require('snacks').toggle.dim():map('<leader>tzd')
      require('snacks').toggle.diagnostics():map('<leader>tD')
      require('snacks').toggle.line_number():map('<leader>tn')
      require('snacks').toggle.inlay_hints():map('<leader>th')
      require('snacks').toggle.zoom():map('<leader>tZ')
      require('snacks').toggle.zen():map('<leader>tzz')
      require('snacks').keymap.set('v', '<cr>', function()
        require('snacks').debug.run()
      end, { ft = 'lua' }) 
      require('snacks').toggle.new({
        id = 'tsvirtual_lines',
        name = 'Virtual Lines',
        get = function() 
          return vim.diagnostic.config().virtual_lines
        end,
        set = function(state) 
          vim.diagnostic.config({ virtual_lines = state })
        end,
      }):map('<leader>td')

    '' + lib.optionalString (config.plugins.treesitter-context.enable) ''
      require('snacks').toggle.new({
        id = 'tscontext',
        name = 'Treesitter Context',
        get = function() 
          return require('treesitter-context').enabled() 
        end,
        set = function(state) 
          if state == true then 
            return require("treesitter-context").enable() 
          else 
            return require("treesitter-context").disable() 
          end
        end,
      }):map('<leader>th')

      require('which-key').add({{'<leader>t', group = "Toggle"}})
    '';

  };

  keymaps = [

    # Zoxide chdir
    {
      mode = "n";
      key = "<leader>z";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.zoxide({
            sort = false,
            -- confirm = { 'cd', 'close' },
            win = {
              input = {
                keys = {
                  ['<C-u>'] = false,
                },
              },
            },
          })
        end
      '';
      options = {
        desc = "Zoxide Picker";
        noremap = true;
        silent = true;
      };
    }

    # Grep picker
    {
      mode = "n";
      key = "<leader>gg";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.grep({
            win = {
              input = {
                keys = {
                  ['<C-u>'] = false,
                },
              },
            },
          })
        end
      '';
      options = {
        desc = "Grep Picker";
        noremap = true;
        silent = true;
      };
    }

    # File picker
    {
      mode = "n";
      key = "<leader>f";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.files({
            win = {
              input = {
                keys = {
                  ['<C-u>'] = false,
                },
              },
            },
          })
        end
      '';
      options = {
        desc = "File Picker";
        noremap = true;
        silent = true;
      };
    }

    # Treesitter picker
    {
      mode = "n";
      key = "<leader>gt";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.treesitter()
        end
      '';
      options = {
        desc = "Treesitter Picker";
        noremap = true;
        silent = true;
      };
    }

    # Buffer picker
    {
      mode = "n";
      key = "<leader>b";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.buffers()
        end
      '';
      options = {
        desc = "Buffer Picker";
        noremap = true;
        silent = true;
      };
    }

    # Recent files
    {
      mode = "n";
      key = "<leader>gr";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.recent()
        end
      '';
      options = {
        desc = "Buffer Picker";
        noremap = true;
        silent = true;
      };
    }

    # Highlight groups
    {
      mode = "n";
      key = "<leader>gh";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.highlights()
        end
      '';
      options = {
        desc = "Highlight Group Picker";
        noremap = true;
        silent = true;
      };
    }

    # Diagnostics
    {
      mode = "n";
      key = "<leader>gD";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.diagnostics()
        end
      '';
      options = {
        desc = "Diagnostics Picker";
        noremap = true;
        silent = true;
      };
    }

    # Projects
    {
      mode = "n";
      key = "<leader>gp";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').picker.projects({
            patterns = { '.git', 'Makefile', 'flake.nix' },
            dev = { "~/projects" },
          })
        end
      '';
      options = {
        desc = "Projects";
        noremap = true;
        silent = true;
      };
    }

    # Lua Scratch Buffer
    {
      mode = "n";
      key = "<leader>.";
      action = lib.nixvim.mkRaw ''
        function()
          require('snacks').scratch({
            win = {
              bo = {
                buftype = "",
                buflisted = false,
                bufhidden = 'hide',
                swapfile = false
              },
            },
            ft = 'lua',
          })
        end
      '';
      options = {
        desc = "Scratch Buffer";
        noremap = true;
        silent = true;
      };
    }


  ];

}
