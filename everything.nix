{ pkgs, lib, ... }:
with { inherit (lib.nixvim) mkRaw; };
{

programs.nixvim = {

        enable = true;

        impureRtp = true;

        colorscheme = "lunix";

        # See [neovimcraft](https://neovimcraft.com) for plugin popularity.

        # <https://github.com/folke/snacks.nvim ⭐️5.8k 💾2.0k>
        # Required for noice & avante
        # Use ':checkhealth snacks' to check if the snacks.nvim plugin is working.
        plugins.snacks = {
          enable = true; # required for noice & avante
          settings.input.enabled = true;
          settings.image.enabled = true;
          settings.dim = {
            enabled = false;
            scope = {
              min_size = 8;
              max_size = 24;
            };
          };
        };

        plugins.nui = { # required for noice & avante
          enable = true;
          lazyLoad.settings.enabled = "not vim.g.vscode";
        };

        plugins.notify = { # Extra optional for noice
          enable = true;
          lazyLoad.settings.enabled = "not vim.g.vscode";
          settings = {
            stages = "fade";
            timeout = 1000;
          };
        };

        extraPlugins = [

          # Dependency for zenbones.nvim
          pkgs.vimPlugins.lush-nvim

          # <https://github.com/zenbones-theme/zenbones.nvim ⭐️0.9k 💾0.8k>
          pkgs.vimPlugins.zenbones-nvim

        ];

        # <https://github.com/tpope/vim-fugitive ⭐️21k 💾2.2k>
        # vim-fugitive is a Git wrapper for Vim
        plugins.fugitive.enable = true;

        # <https://github.com/nvim-telescope/telescope.nvim ⭐️18.3k 💾1.4k>
        plugins.telescope = {
          enable = true;
          lazyLoad.settings.enabled = "not vim.g.vscode";
          settings = {
            defaults = {
              mappings = {
                i = {
                  "<C-u>" = false;
                };
              };
            };
          };
        };


        # Required for Telescope
        plugins.web-devicons = {
          enable = true;
        };


        # <https://github.com/neovim/nvim-lspconfig ⭐️15.5k 💾3.7k>
        plugins.lsp = {
          enable = true;
          autoLoad = true;
          servers = {

            # Python
            pyright = {
              enable = true;
              autostart = true;
            };

            # so far, I've not been able to make ruff generate a single diagnostic.
            pylsp = {
              enable = true;
              autostart = true;
              settings = {
                plugins = {
                  #pylsp_mypy.enabled = true;
                  ruff.enabled = true;
                  flake8 = {
                    enabled = true;
                    maxLineLength = 110;
                  };
                };
              };
            };

            # Nix
            nixd.enable = true;
            nil_ls.enable = true;

            # CSS
            tailwindcss.enable = true;
            cssls = {
              enable = true;
              extraOptions.init_options.provideFormatter = false;
            };

            # JSON
            jsonls.enable = true;

            # Lua
            lua_ls = {
              enable = true;
              settings = {
                workspace = {
                  library = [ (mkRaw "vim.env.VIMRUNTIME") ];
                };
              };
            };
          };
        };

        # <https://github.com/nvim-treesitter/nvim-treesitter ⭐️12.4k 💾5.9k>
        plugins.treesitter = {
            enable = true;
            settings = {
                highlight.enable = true;
                indent.enable = false;
            };
        };

        # <https://github.com/echasnovski/mini.nvim ⭐️7.8k 💾1.8k>
        # A collection of small useful lua modules.
        plugins.mini = {
          enable = true;
          modules = {
            diff = {
              # disabled by default?
              source = config.lib.nixvim.mkRaw "require('mini.diff').gen_source.none()";
            };
            icons = {
              style = "glyph";
              lsp.snippet.glyph = ""; 
            };
            colors = {};
          };
        };

        # <https://github.com/nvim-lualine/lualine.nvim ⭐️7.3k 💾0.7k>
        plugins.lualine = {
          enable = true;
          settings = {
            options = {
              section_separators.left = "";
              section_separators.right = "";
              component_separators = "";
              theme = {
                normal = {
                  # Left side of bubble is green for normal mode
                  a = { fg = "#ffffff"; bg = "#96bd9b"; };
                  # Right side of bubble
                  b = { bg = "#fff2e5"; fg = "#2b1e1c"; };
                  # Background behind the bubble
                  c = { fg = "NONE"; bg = "NONE"; };
                };
                insert = {
                  # Left side of bubble is blue for insert mode
                  a = { fg = "#ffffff"; bg = "#8ab8d6"; };
                };
                visual = {
                  a = { fg = "#ffffff"; bg = "#e06c75"; };
                };
                replace = {
                  a = { fg = "#ffffff"; bg = "#c678dd"; };
                };
                inactive = {
                  a = { fg = "#abb2bf"; bg = "#282c34"; };
                  b = { fg = "#abb2bf"; bg = "#282c34"; };
                  c = { fg = "#abb2bf"; };
                };
              };
            };
            sections = {
              lualine_a = config.lib.nixvim.mkRaw "{ { 'mode', separator = { left = '' }, padding = { left = 1, right = 1 } } }";
              lualine_b = config.lib.nixvim.mkRaw "{ 'filename', 'diff' }";
              lualine_c = config.lib.nixvim.mkRaw "{ '%=', }";
              lualine_x = config.lib.nixvim.mkRaw "{}";
              lualine_y = config.lib.nixvim.mkRaw "{}";
              lualine_z = config.lib.nixvim.mkRaw "{}";
            };
            inactive_sections = {
              lualine_a = config.lib.nixvim.mkRaw "{ 'filename' }";
              lualine_b = config.lib.nixvim.mkRaw "{}";
              lualine_c = config.lib.nixvim.mkRaw "{}";
              lualine_x = config.lib.nixvim.mkRaw "{}";
              lualine_y = config.lib.nixvim.mkRaw "{}";
              lualine_z = config.lib.nixvim.mkRaw "{}";
            };
            tabline = config.lib.nixvim.mkRaw "{}";
          };
        };

        # <https://github.com/folke/which-key.nvim ⭐️6.4k 💾0.7k>
        plugins.which-key = {
          enable = true;
          settings = {
            delay = 0;
            win = {
              border = "rounded";
            };
          };
          luaConfig.post = ''
            require('which-key').add({
              { "<leader>v", group = "vim", icon = { icon = require('mini.icons').get('filetype', 'vim'), color = "green" } },
              { "<leader>l", group = "lsp", icon = { icon = require('mini.icons').get('directory', 'lsp'), color = "green" } },
              { "<leader>z", group = "zen", icon = { icon = "🧘", color = "green" } },
              { "<leader>zd", group = "dim", icon = { icon = "💡", color = "green" } },
              { "<leader>c", desc = "context", icon = { icon = "🌳", color = "green" } },
            })
          '';
        };

        # <https://github.com/lewis6991/gitsigns.nvim ⭐️6.1k 💾1.1k>
        # The 'gitsigns.nvim' plugin displays git signs in the gutter.
        plugins.gitsigns = {
            enable = true;
        };

        # <https://github.com/folke/noice.nvim ⭐️5.3k 💾1.3k>
        # :checkhealth noice
        plugins.noice = {
          enable = true;
          lazyLoad.settings.enabled = "not vim.g.vscode";
          settings = {
            lsp.signature.enabled = false;
            lsp.override = {
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
            };

            cmdline = {
              enabled = true;
            };

            # Ignore the 'Agent is not initialized' message; it's a temporary error
            # about copilot not being initialized yet.
            routes = [
              {
                filter.event = "msg_show";
                filter.any = [{ find = "Agent service not initialized"; } { find = "Authenticated as GitHub user"; } ];
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

        # <https://github.com/saghen/blink.cmp ⭐️5.1k 💾1.5k>
        # FUNCTIONS:
        #  accept
        #  add_provider
        #  cancel
        #  get_lsp_capabilities
        #  get_selected_item
        #  hide
        #  hide_documentation
        #  is_visible
        #  reload
        #  scroll_documentation_down
        #  scroll_documentation_up
        #  select_and_accept
        #  select_next
        #  select_prev
        #  setup
        #  show
        #  show_documentation
        #  snippet_active
        #  snippet_backward
        #  snippet_forward
        # Until [!836](https://github.com/Saghen/blink.cmp/issues/836) is fixed, I'm not using blink.cmp for ghost text.
        plugins.blink-cmp = {
          enable = true;
          #lazyLoad.settings.enabled = "not vim.g.vscode";
          settings = {

            # See [keymaps](https://cmp.saghen.dev/configuration/keymap.html) to figure this out.
            keymap.preset = "none";
            snippets.preset = "luasnip";
            signature.enabled = true;
            signature.window.border = "rounded";

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
                  columns = config.lib.nixvim.mkRaw ''{
                      { "label", "label_description", gap = 1 },
                      { "kind_icon", "kind" }
                  }'';
                  components = {
                    kind_icon = {
                      text = config.lib.nixvim.mkRaw ''
                        function(ctx)
                          local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                          return ' ' .. kind_icon .. ctx.icon_gap .. ' '
                        end
                      '';
                      highlight = config.lib.nixvim.mkRaw ''
                        function(ctx)
                          local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                          return hl
                        end
                      '';
                    };
                    kind.highlight = config.lib.nixvim.mkRaw ''
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

        # <https://github.com/sindrets/diffview.nvim ⭐️4.8k 💾0.3k>
        plugins.diffview.enable = true;

        # <https://github.com/L3MON4D3/LuaSnip ⭐️4.0k 💾2.3k>
        plugins.luasnip = {
          enable = true;
          fromVscode = [ { paths = ./vscode-snippets; } { paths = "~/.config/nvim/vscode-snippets"; } ];
          fromSnipmate = [ { paths = ./snipmate-snippets; } { paths = "~/.config/nvim/snipmate-snippets"; } ];
          fromLua = [ { paths = ./luasnip-snippets; } { paths = "~/.config/nvim/luasnip-snippets"; } ];
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

        # <https://github.com/folke/flash.nvim ⭐️3.4k 💾0.5k>
        # flash.nvim: Navigate your code with search labels, enhanced character
        # motions and Treesitter integration
        plugins.flash = {
            enable = true;
            settings.modes.search.enabled = true;
        };

        # <https://github.com/nvim-treesitter/nvim-treesitter-context ⭐️2.9k 💾0.5k>
        # The 'treesitter-context' plugin is a plugin that shows the context of the
        # current line in a floating window at the top of the screen.
        # hl groups:
        # - TreesitterContext
        # - TreesitterContextLineNumber
        # - TreesitterContextSeparator
        # - TreesitterContextBottom
        plugins.treesitter-context = {
            enable = true;
            lazyLoad.settings.enabled = "not vim.g.vscode";
            settings = {
              max_lines = 4;
              max_window_height = 28;
              mode = "topline";
              trim_scope = "outer";
            };
        };

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

        # <https://github.com/nvim-treesitter/nvim-treesitter-textobjects ⭐️2.5k 💾0.6k>
        plugins.treesitter-textobjects = {
          enable = true;
          select = {
            enable = true;
            keymaps = {
              "af" = "@function.outer";
              "if" = "@function.inner";
              "ac" = "@class.outer";
              "ic" = "@class.inner";
              "aC" = "@conditional.outer";
              "iC" = "@conditional.inner";
              "as" = "@local.scope";
            };
          };
        };

        # <https://github.com/mfussenegger/nvim-lint/ ⭐️2.4k 💾0.5k>
        plugins.lint.enable = true;

        # <https://github.com/stevearc/aerial.nvim ⭐️2.1k 💾0.8k>
        # lsp/treesitter/markdown/asciidoc/man based outline
        plugins.aerial.enable = true;

        # <https://github.com/folke/zen-mode.nvim ⭐️2.0k 💾96k>
        plugins.zen-mode = {
            enable = true;
            settings = {
              window = {
                options = {
                  signcolumn = "no";
                  number = false;
                  relativenumber = false;
                  list = false;
                };
              };
              plugins = {
                kitty = {
                  enabled = true;
                  font = "+2";
                };
              };
            };
        };

        # <https://github.com/andymass/vim-matchup ⭐️1.8k 💾0.8k>
        # Extends vim's `%` motion to match more than just parentheses, and
        # provides additional text objects for matching pairs.
        plugins.vim-matchup = {
          enable = true;
          # I use sandwich for surround, so disable it in vim-matchup
          settings.surround_enabled = 0;
        };

        # <https://github.com/michaelb/sniprun ⭐️1.6k 💾1.3k>
        # The 'sniprun' plugin is a REPL plugin that can run code in a variety of
        # languages. It's trigged by hitting <leader>r
        plugins.sniprun = {
          enable = true;
          settings = {
            display_options = {
              terminal_line_number = false;
              terminal_signcolumn = false;
            };
            selected_interpreters = [
              "Python3_fifo"
              "Bash_original"
              "Lua_nvim"
              "SQL_original"
            ];
            repl_enable = [
              "Bash_original"
              "Python3_fifo"
            ];
            display = [
              "Terminal"
              "TempFloatingWindowOk"
              #"VirtualTextOk"
            ];
          };
        };

        # <https://github.com/machakann/vim-sandwich ⭐️1.5k 💾0.5k>
        # We need to edit the key mappings for sandwith; both vim-sandwith and
        # leap.nvim uses the 's' key.
        # sandwich is a plugin that allows you to easily add, change, and delete
        # surrounding characters in your text;
        #  - sa'    - Surround Add single quotes
        #  - sr'"   - Surround Replace single quotes with double quotes
        #  - sd'    - Surround Delete single quotes
        #  - sdb    - Surround Delete auto
        #  - srb    - Surround Replace auto
        #  - saiw[  - Surround Add Inner Word brackets
        #  - sais'  - Surround Add Inner Sentence single quotes
        #  - saib'  - Surround Add Inner Block single quotes
        #  - sait'  - Surround Add Inner Tag single quotes
        #  - Vsa(   - Visual Surround Add parentheses
        #  - ^Vsa{  - Block Visual Surround Add curly braces
        # The 'ib', 'ab', 'is' and 'as' are text objects for automatically
        # selecting a "block" or a "search". They are configured using g:sandwith#recipes.
        plugins.sandwich = {
          enable = true;
          settings = {
            no_default_key_mappings = 0;
          };
        };

        # <https://github.com/folke/twilight.nvim/ ⭐️1.4k 💾56>
        plugins.twilight.enable = true;

        # <https://github.com/chentoast/marks.nvim ⭐️1.1k 💾70>
        # The 'marks.nvim' plugins is a plugin which displays marks in the gutter.
        plugins.marks = {
            enable = true;
            builtinMarks = [ "<" ">" "." ];
            excludedFiletypes = [
              "netrw"
            ];
        };

        # <https://github.com/m4xshen/autoclose.nvim ⭐️0.6k 💾0.1k>
        # So, what I've learned is that I don't want to automatically close
        # brackets and stuff, I want to easily be able to close them.
        # plugins.autoclose.enable = true;

        # <https://github.com/andrewferrier/debugprint.nvim ⭐️0.5k 💾1.0k>
        # The 'debugprint' plugin is a neat way to add debug prints to your code.
        # It's triggered by hitting 'g?p' to add a print statement below, and 'g?P'
        # to add a print statement above. There is also 'g?o' and 'g?O' to add
        # textobj prints (not tested), and 'g?v' and 'g?V' to add variable prints,
        # (also not tested).
        plugins.debugprint.enable = true;

        # <https://github.com/garymjr/nvim-snippets ⭐️0.3k 💾68>
        plugins.nvim-snippets = {
          enable = false;
          settings.create_cmp_source = false;
          lazyLoad.settings.enabled = "not vim.g.vscode";
        };

        # <https://github.com/nvim-neorocks/lz.n ⭐️178 💾0.3k>
        # Enable lazy-loading so we don't load plugins when used in VSCode
        plugins.lz-n.enable = true;


        plugins.colorizer = {
          enable = true;
        };

        plugins.blink-cmp-git = {
          enable = true;
          lazyLoad.settings.enabled = "not vim.g.vscode";
        };

        plugins.blink-cmp-copilot = {
          enable = false;
          lazyLoad.settings.enabled = "not vim.g.vscode";
        };

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

        plugins.toggleterm = {
          enable = true;
          lazyLoad.settings.enabled = "not vim.g.vscode";
        };

        opts = {

          # Number of lines to scroll when using ctrl+u and ctrl+d.
          scroll = 12;

          # Minimum number of lines to keep above/below the cursor when scrolling.
          scrolloff = 8;

          # Ignore case in searches, unless the search pattern contains uppercase
          # characters, in which case it will be case-sensitive.
          ignorecase = true;
          smartcase = true;


          # Always display a single fold column in the gutter.
          foldcolumn = "1";

          # Prefer manual folding using 'zf', 'zd', 'zo', etc.
          foldmethod = "manual";

          number = true;
          relativenumber = true;
          wrap = false;
          conceallevel = 2;
          #winwidth = 100;
          #winminwidth = 35;
          wildmode = "longest:full,full,noselect";

          # If not specified elsewhere, we use a 4-space tabstop.
          tabstop = 4;
          shiftwidth = 4;
          softtabstop = 4;
          expandtab = true;
          scrollback = 1000;

          autochdir = false;

          # Required for nvim-notify
          # https://github.com/rcarriga/nvim-notify/blob/22f29093eae7785773ee9d543f8750348b1a195c/README.md?plain=1#L28
          termguicolors = true;

          # Split to the right, not the left
          splitright = true;

          # When on, all the windows are automatically made the same size after
          # splitting or closing a window. When off, splitting a window will
          # reduce the size of the current window and leave the other windows
          # the same.
          equalalways = true;

          # Make the 'equalalways' direction apply to both vertical and horizontal
          # splits.
          eadirection = "both";

          # Default "update time" is 4000ms, which is astronomical. It controls how
          # often the swap file is written to disk, and how often the cursor
          # position is "idle" (the CursorHold and CursorHoldI events). Set it to
          # something more reasonable.
          updatetime = 1000;

          # 'viewoptions' control what is saved to a view created by 'mkview'. By
          # default, it's set to 'cursor,folds,curdir', which is pretty reasonable.
          # I just want this here so I can keep track of it.
          viewoptions = "cursor,folds,curdir";

          # lualine recommends to set this.
          laststatus = 3;
        };
        globals = {
          netrw_winsize = -30;
          netrw_banner = 0;
          mapleader = " ";
        };
        keymaps = [
          { mode = [ "v" "n" ]; key = "J"; action = "5j"; }
          { mode = [ "v" "n" ]; key = "K"; action = "5k"; }
          { mode = "n"; key = "-"; action = "/"; options.noremap = false; }
          { mode = "i"; key = "<c-a>"; action = "<home>"; }
          { mode = "i"; key = "<c-e>"; action = "<end>"; }
          { mode = "t"; key = "<M-c>"; action = "<C-\\><C-n>"; }
          { mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>"; }
          { mode = "n"; key = "q"; action = ":q<cr>"; }
          { mode = "n"; key = "<M-h>"; action = ":Treewalker Left<cr>"; options.silent = true; }
          { mode = "n"; key = "<M-j>"; action = ":Treewalker Down<cr>"; options.silent = true; }
          { mode = "n"; key = "<M-k>"; action = ":Treewalker Up<cr>"; options.silent = true; }
          { mode = "n"; key = "<M-l>"; action = ":Treewalker Right<cr>"; options.silent = true; }
          { mode = "n"; key = "<leader>f"; action = ":Telescope find_files<cr>"; options.silent = true; options.desc = "Find Files"; }
          { mode = "n"; key = "<leader>zt"; action = ":ZenMode<cr>"; options.silent = true; options.desc = "Toggle zen mode"; }


          { 
            mode = "i";
            key = "<Tab>";
            action = config.lib.nixvim.mkRaw ''
              function()

                if require('luasnip').expand_or_jumpable() then
                  require('luasnip').expand_or_jump()
                  return
                end

                if require('blink-cmp').is_visible() then
                  require('blink-cmp').insert_next()
                  return
                end

                -- Feed the tab character as normal
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', true)
              end
            '';
            options.silent = true;
          }

          { 
            mode = "i";
            key = "<S-Tab>";
            action = config.lib.nixvim.mkRaw ''
              function()
                if require('blink-cmp').is_visible() then
                  require('blink-cmp').insert_prev()
                else
                  -- Feed the tab character as normal
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, false, true), 'n', true)
                end
              end
            '';
            options.silent = true;
          }

          {
            mode = "i";
            key = "";
            action = config.lib.nixvim.mkRaw ''
              function()
                if require('copilot.suggestion').is_visible() then
                  require('copilot.suggestion').accept()
                end
              end
            '';
            options.silent = true;
            options.desc = "Accept Copilot suggestion";
          }

          {
            mode = "i";
            key = "<cr>";
            action = mkRaw ''
              function()
                if require('blink-cmp').is_visible() and require('blink-cmp').get_selected_item() ~= nil then
                  require('blink-cmp').accept()
                  return
                end

                -- Else, just feed the Enter key as normal
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 'n', true)

              end
            '';
          }

          { 
            mode = "n"; 
            key = "<cr>"; 
            action = mkRaw ''
              function()
                -- Dismiss Noice messages, stop highlighting search matches, and
                -- close the preview window.
                require('noice').cmd('dismiss')
                vim.o.hlsearch = false
                vim.cmd.pclose()
              end
            '';
            options.silent = true;
          }

          # execute ~/.config/nvim/test.lua
          { 
            mode = "n"; 
            key = "<leader>vt"; 
            action = mkRaw ''
              function()
                local test_lua = vim.fn.expand("~/.config/nvim/test.lua")
                if vim.fn.filereadable(test_lua) == 1 then
                  dofile(test_lua)
                end
              end
            ''; 
            options.desc = "Execute ~/.config/nvim/test.lua";
          }

          # edit ~/.config/nvim/test.lua
          { 
            mode = "n"; 
            key = "<leader>ve"; 
            action = ":vsplit ~/.config/nvim/test.lua<cr>";
            options.desc = "Edit ~/.config/nvim/test.lua";
          }

          # LSP
          { mode = "n"; key = "gd"; action = ":Telescope lsp_definitions<cr>"; options.silent = true; options.desc = "Go to definition"; }
          { mode = "n"; key = "<leader>ld"; action = ":Telescope lsp_definitions<cr>"; options.silent = true; options.desc = "Go to definition(s)"; }
          { mode = "n"; key = "<leader>li"; action = ":Telescope lsp_implementations<cr>"; options.silent = true; options.desc = "Go to implementation(s)"; }
          { mode = "n"; key = "<leader>lc"; action = ":Telescope lsp_incoming_calls<cr>"; options.silent = true; options.desc = "List Incoming Calls"; }
          { mode = "n"; key = "<leader>lr"; action = ":Telescope lsp_references<cr>"; options.silent = true; options.desc = "List References"; }
          { 
            mode = "n"; 
            key = "<leader>ld"; 
            action = mkRaw ''
              function()
                local new_config = not vim.diagnostic.config().virtual_lines
                vim.diagnostic.config({ virtual_lines = new_config })
              end
            '';
            options.desc = "Toggle diagnostics";
          }


          # dim
          { 
            mode = "n";
            key = "<leader>zdt";
            action = ":Twilight<cr>";
            options.silent = true;
            options.desc = "Toggle dim"; 
          }

          # treesitter context
          { mode = "n"; key = "<leader>ct"; action = config.lib.nixvim.mkRaw "require('treesitter-context').toggle"; options.silent = true; options.desc = "Toggle treesitter context"; }
          # Use gF to "forcefully" edit the file under the cursor, creating it if
          # it doesn't exist.
          {
            mode = "n";
            key = "gF";
            action = config.lib.nixvim.mkRaw ''
              function()
                -- get the directory of the current file
                local dir = vim.fn.expand('%:h')

                -- get the target file name under the cursor
                local file = vim.fn.expand('<cfile>')

                -- normalize path
                local path = vim.fn.fnamemodify(dir .. '/' .. file, ':p')

                -- escape whitespaces
                vim.fn.fnameescape(path)

                -- open the file, create it if it doesn't exist
                vim.cmd.edit(path)
              end
            '';
            options.desc = "Edit file under cursor, create it if necessary";
          }


          # Make the Esc key close the popup menu if it's visible, in addition to
          # going to normal mode.
          {
            mode = "i"; key = "<Esc>";
            action = ''pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"'';
            options.expr = true;
          }

          # Same thing for command line
          {
            mode = "c"; key = "<Esc>";
            action = ''wildmenumode() ? "\<C-e>\<Esc>" : "\<Esc>"'';
            options.expr = true;
          }

          # Enable and disable the gutter with <leader>s
          {
            mode = "n";
            key = "<leader>s";
            action = config.lib.nixvim.mkRaw ''
              function()
                if vim.wo.number then
                  vim.wo.number = false
                  vim.wo.relativenumber = false
                  vim.wo.signcolumn = "no"
                else
                  vim.wo.number = true
                  vim.wo.relativenumber = true
                  vim.wo.signcolumn = "auto"
                end
              end
            '';
            options.desc = "Toggle gutter";
          }

        ];

        filetype.extension.flux = "flux";

        autoGroups = {
          view.clear = true;
        };

        autoCmd = [

          # Automatically save view when idle
          {
            group = "view";
            event = [ "CursorHold" "CursorHoldI" ];
            pattern = [ "*.nix" "*.c" "*.yaml" "*.md" "*.py" "*.css" "*.html" "*.js" "*.lua" ];
            command = "if &buftype == '' | silent! mkview | endif";
          }

          # Automatically save view when leaving a buffer or Vim
          {
            group = "view";
            event = [ "BufWinLeave" "FocusLost" "VimLeavePre" ];
            pattern = [ "*.nix" "*.c" "*.yaml" "*.md" "*.py" "*.css" "*.html" "*.js" "*.lua" ];
            command = "if &buftype == '' | silent! mkview | endif";
          }

          # Automatically load view when reading a file
          {
            group = "view";
            command = "silent! loadview";
            event = "FileType";
            pattern = [ "nix" "c" "yaml" "markdown" "python" "css" "html" "javascript" "lua" ];
          }

          # Resize all windows when the Vim window is resized
          { command = "tabdo wincmd ="; event = "VimResized"; }

          { event = "BufRead"; pattern = [ "*.flux" ]; command = "set filetype=flux"; }
          { event = "FileType"; pattern = [ "nix" "lua" "stylus" ]; command = "set tabstop=2 softtabstop=2 shiftwidth=2 expandtab"; }

          # Terminal settings
          { event = "TermOpen"; command = "setlocal nonumber norelativenumber scrolloff=0 winfixwidth winfixheight"; }
        ];

        extraConfigLuaPre = ''
          -- If ~/.config/nvim/init.lua exists, load it
          local init_lua = vim.fn.expand("~/.config/nvim/init.pre.lua")
          if vim.fn.filereadable(init_lua) == 1 then
            dofile(init_lua)
          end

          -- Opening nvim in a terminal within nvim is pain when esc is mapped to 
          -- normal mode. If nvim is started in a nvim terminal, just quit.
          if vim.env.VIMRUNNING ~= nil and vim.fn.has("gui_running") == 0 then
            io.stderr:write("Vim is already running in the terminal\n")
            vim.api.nvim_command('cq! 1')
          else
            vim.env.VIMRUNNING = 1
          end
        '';

        extraConfigLuaPost = ''
          -- If ~/.config/nvim/init.lua exists, load it
          local init_lua = vim.fn.expand("~/.config/nvim/init.local.lua")
          if vim.fn.filereadable(init_lua) == 1 then
            dofile(init_lua)
          end
        '';

      };


};

}
