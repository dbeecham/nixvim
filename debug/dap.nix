{ lib, pkgs, ... }: {

  plugins.dap = {
    enable = true;
    configurations = {
      lua = [{
        type = "nlua";
        request = "attach";
        name = "Attach to running Neovim instance";
      }];
    };
    adapters = {
      nlua.__raw = ''
        function(callback, config)
          callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
        end
      '';
    };
  };

  plugins.dap-virtual-text = {
    enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    one-small-step-for-vimkind
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action = lib.nixvim.mkRaw ''
        function()
          require("dap").toggle_breakpoint()
        end
      '';
      options = {
        desc = "Toggle breakpoint";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = lib.nixvim.mkRaw ''
        function()
          require("dap").continue()
        end
      '';
      options = {
        desc = "Continue";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = lib.nixvim.mkRaw ''
        function()
          require("dap").repl.open()
        end
      '';
      options = {
        desc = "Open REPL";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = lib.nixvim.mkRaw ''
        function()
          require("osv").launch({port = 8086})
        end
      '';
      options = {
        desc = "Launch Neovim OSV debugger";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dw";
      action = lib.nixvim.mkRaw ''
        function()
          require("dap.ui.widgets").hover()
        end
      '';
      options = {
        desc = "dap widget hover";
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>df";
      action = lib.nixvim.mkRaw ''
        function()
          require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
        end
      '';
      options = {
        desc = "dap widget frames";
        noremap = true;
        silent = true;
      };
    }

  ];

}
