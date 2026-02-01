{ lib, pkgs, ... }:
{

  lsp = {
    inlayHints.enable = true;

    # Python
    servers.ruff = {
      enable = true;
      # activate = false;
    };

    # Python
    servers.pylsp = {
      enable = true;
      # activate = false;
    };

    # Python
    servers.pyright.enable = false;

    # <https://github.com/detachhead/basedpyright ⭐️1.1k 💾10.0k>
    servers.basedpyright.enable = true;

    servers.ansiblels.enable = true;

    # Vimscript
    servers.vimls.enable = true;

    # Markdown
    servers.markdown_oxide = {
      enable = true;
      config = {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true;
            };
          };
        };
      };
    };

    # Markdown
    servers.zk = {
      enable = true;
      config = {
        filetypes = [ "markdown" ];
      };
    };

    servers.bashls.enable = true;

    # Rust has rust-analyzer, bacon_ls 
    # rust_analyzer should be installed by cargo though.
    servers.rust_analyzer.enable = true;

    servers.clangd.enable = true;

    # <https://github.com/terror/just-lsp ⭐️0.2k 💾0.2k>
    servers.just.enable = true;

    servers.html.enable = true;

    # <https://github.com/luals/lua-language-server>
    servers.lua_ls.enable = false;

    # <https://github.com/johnnymorganz/stylua>
    servers.stylua.enable = false;

    # <https://github.com/EmmyLuaLs/emmylua-analyzer-rust>
    servers.emmylua_ls = {
      enable = true;
      config = {
        # cmd = "emmylua_ls";
        # filetypes = [ "lua" ];
        # root_markers = [ ".git/" ];
        # workspace_required = true;
        # root_dir = ...
        # settings = {} (https://github.com/neovim/nvim-lspconfig/blob/master/lsp/hls.lua)
        # init_options = {} (https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua)
        # capabilities = ... (https://github.com/neovim/nvim-lspconfig/blob/master/lsp/helm_ls.lua)
        settings.Lua = {
          runtime = {
            version = "LuaJIT";
            requirePattern = [
              "lua/?.lua"
              "lua/?/init.lua"
              "?/lua/?.lua"
              "?/lua/?/init.lua"
            ];
          };
          workspace = {
            # library = [ (lib.nixvim.mkRaw "vim.env.VIMRUNTIME") ];
            library = lib.nixvim.mkRaw "vim.api.nvim_get_runtime_file('', true)";
            ignoreGlobs = ["**/*_spec.lua"];
          };
          diagnostics = {
            globals = [ "vim" ];
            disable = [ "undefined-global" ];
          };
        };
      };
    };

  };

  # <https://github.com/neovim/nvim-lspconfig ⭐️15.5k 💾3.7k>
  plugins.lsp = {
    enable = true;
    autoLoad = true;
    servers = {

      # pyright is a popular choice for Python LSP, it's good, but mypy is more
      # thorough. ruff handles linting and formatting and replaces flake8,
      # isort, black, etc. mypy is the golden standard for Python type
      # checking.
      # pyright = {
      #   enable = true;
      #   autostart = true;
      #   settings = {
      #     pyright = {
      #       disableOrganizeImports = true; # ruff handles this
      #     };
      #     python = {
      #       analysis = {
      #         # "off", "basic", "strict". I'm using mypy.
      #         typeCheckingMode = "off"; 
      #         ignore = [ "*" ];
      #       };
      #     };
      #   };
      # };

      # https://docs.astral.sh/ruff/configuration/
      # https://docs.astral.sh/ruff/editors/settings/#configuration_resolution_order
      # https://docs.astral.sh/ruff/editors/settings/#lint_enable
      # ruff = {
      #   enable = true;
      #   activate = false;
      #   settings = {
      #     logLevel = "debug";
      #     lint = {
      #       enable = true;
      #       preview = true;
      #       select = [ "E" "F" ];
      #     };
      #     lineLength = 80;
      #     configuration = {
      #       format = {
      #         "quote-style" = "double";
      #       };
      #     };
      #   };
      # };

      # pylsp = {
      #   enable = true;
      #   rootMarkers = [ "pyproject.toml" "setup.cfg" "setup.py" "requirements.txt" ".git/" ];
      #   settings = {
      #     plugins = {
      #       pylsp_mypy = {
      #         enabled = true;
      #         live_mode = true;
      #       };
      #     };
      #   };
      # };

      # <https://github.com/oppiliappan/statix ⭐️0.7k 💾0.3k>
      # Lints and suggestions for the nix programming language
      statix = {
        enable = true;
      };

      # <https://github.com/ribru17/ts_query_ls ⭐️108 💾278>
      # An LSP implementation for tree-sitter query files
      ts_query_ls = {
        enable = false;
      };

      hyprls.enable = true;

      # <https://github.com/typescript-language-server/typescript-language-server ⭐️2.2k 💾0.6k>
      ts_ls = {
        enable = true;
      };

      # Nix
      nixd.enable = true;
      nil_ls.enable = true;

      # <https://github.com/tailwindlabs/tailwindcss-intellisense ⭐️3.4k 💾1.2k>
      tailwindcss.enable = true;

      # JSON
      jsonls.enable = true;

      # Yaml
      yamlls = {
        enable = true;
      };

    };
  };

  # add inotify-tools for LSP file watching if Linux
  extraPackages = lib.optionals (pkgs.stdenv.isLinux) [
    pkgs.inotify-tools
  ];

  # keymaps = [
  #   { mode = "n"; key = "<leader>llr"; action = lib.nixvim.mkRaw "vim.lsp.codelens.run"; options.desc = "codelens:run"; }
  #   { mode = "n"; key = "<leader>llc"; action = lib.nixvim.mkRaw "function() vim.lsp.codelens.clear(nil, 0) end"; options.desc = "codelens:clear"; }
  #   { mode = "n"; key = "<leader>llR"; action = lib.nixvim.mkRaw "function() vim.lsp.codelens.refresh({ bufnr = 0 }) end"; options.desc = "codelens:refresh"; }
  # ];

  # autoCmd = [
  #   {  
  #     desc = "Update Code Lens Automatically";
  #     buffer = lib.nixvim.mkRaw "bufnr";
  #     callback = lib.nixvim.mkRaw ''
  #       function()
  #         vim.lsp.codelens.refresh({ bufnr = 0})
  #       end
  #     '';
  #     event = [ "TextChanged" "InsertLeave" "CursorHold" "BufEnter" ];
  # ];

  extraConfigLuaPost = ''
    require('which-key').add({
      { "<leader>ll", desc = "Code [L]ens", icon = "🔍" },
    })
  '';

  keymaps = [
    { mode = "n"; key = "gd"; action = ":Telescope lsp_definitions<cr>"; options.silent = true; options.desc = "goto definition(s)"; }
    # overwritten by toggle dianostics
    { mode = "n"; key = "<leader>ld"; action = ":Telescope lsp_definitions<cr>"; options.silent = true; options.desc = "goto definition(s)"; }
    { mode = "n"; key = "<leader>li"; action = ":Telescope lsp_implementations<cr>"; options.silent = true; options.desc = "goto implementation(s)"; }
    { mode = "n"; key = "<leader>lc"; action = ":Telescope lsp_incoming_calls<cr>"; options.silent = true; options.desc = "incoming"; }
    { mode = "n"; key = "<leader>lr"; action = ":Telescope lsp_references<cr>"; options.silent = true; options.desc = "references"; }
    { mode = "n"; key = "<leader>ls"; action = ":Telescope lsp_document_symbols<cr>"; options.silent = true; options.desc = "symbols"; }
    { 
      mode = "n"; 
      key = "<leader>ld"; 
      action = lib.nixvim.mkRaw ''
        function()
          local new_config = not vim.diagnostic.config().virtual_lines
          vim.diagnostic.config({ virtual_lines = new_config })
        end
      '';
      options.desc = "Toggle diagnostics";
    }
  ];
}

