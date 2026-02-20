{ lib, ... }: {

  # Rust has rust-analyzer, bacon_ls 
  # rust_analyzer should be installed by cargo though.
  # If rust_analyzer is installed through here, the version won't agree with the version needed in local flake.nix files.
  # servers.rust_analyzer.enable = true;
  autoGroups = {
    rust-analyzer = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = "FileType";
      pattern = "rust";
      group = "rust-analyzer";
      callback = lib.nixvim.mkRaw ''
        function()
          if vim.fn.executable("rust-analyzer") == 1 then

            vim.lsp.config('rust_analyzer', {
              settings = {
                ['rust-analyzer'] = {
                  imports = {
                    granularity = {
                      group = "module"
                    },
                    prefix = "self"
                  },
                  cargo = {
                    buildScripts = {
                      enable = true
                    }
                  },
                  procMacro = {
                    enable = true
                  },
                  check = {
                    command = "clippy"
                  },
                  diagnostics = {
                    enable = true,
                    experimental = {
                      enable = false
                    },
                  },
                };
              },
            })

            vim.lsp.enable('rust_analyzer')
          end
        end
      '';

    }
  ];

}
