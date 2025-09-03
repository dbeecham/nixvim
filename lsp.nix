{ lib, ... }:
{

  lsp = {
    inlayHints.enable = true;
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

      markdown_oxide = {
        enable = true;
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
            library = [ (lib.nixvim.mkRaw "vim.env.VIMRUNTIME") ];
          };
        };
      };

      # Yaml
      yamlls = {
        enable = true;
      };

      # Bash
      bashls.enable = true;

    };
  };

  keymaps = [
    { mode = "n"; key = "<leader>llr"; action = lib.nixvim.mkRaw "vim.lsp.codelens.run"; options.desc = "codelens:run"; }
    { mode = "n"; key = "<leader>llc"; action = lib.nixvim.mkRaw "function() vim.lsp.codelens.clear(nil, 0) end"; options.desc = "codelens:clear"; }
    { mode = "n"; key = "<leader>llR"; action = lib.nixvim.mkRaw "function() vim.lsp.codelens.refresh({ bufnr = 0 }) end"; options.desc = "codelens:refresh"; }
  ];

  extraConfigLuaPost = ''
    require('which-key').add({
      { "<leader>ll", desc = "Code [L]ens", icon = "🔍" },
    })
  '';
}

