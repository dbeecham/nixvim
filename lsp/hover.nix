{ lib, pkgs, ... }: {

  extraPlugins = [
    pkgs.vimPlugins.hover-nvim
  ];

  extraConfigLua= ''
    require("hover").setup {
      providers = {
        'hover.providers.diagnostic',
        'hover.providers.lsp',
        'hover.providers.dap',
        'hover.providers.man',
        'hover.providers.dictionary',
      }
    };
  '';

  keymaps = [
    {
      mode = "n";
      key = "K";
      action = lib.nixvim.mkRaw ''
        function()
          require("hover").open()
        end
      '';
      options.desc = "show hover information";
    }
    {
      mode = "n";
      key = "gK";
      action = lib.nixvim.mkRaw ''
        function()
          require("hover").enter()
        end
      '';
      options.desc = "show hover information";
    }
    {
      mode = "n";
      key = "<C-p>";
      action = lib.nixvim.mkRaw ''
        function()
          require("hover").switch('previous')
        end
      '';
      options.desc = "show hover information";
    }
    {
      mode = "n";
      key = "<C-n>";
      action = lib.nixvim.mkRaw ''
        function()
          require("hover").switch('next')
        end
      '';
      options.desc = "show hover information";
    }
  ];

}
