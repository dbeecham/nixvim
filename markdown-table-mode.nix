# <https://github.com/Kicamon/markdown-table-mode.nvim>
{ pkgs, config, ... }: {
  programs.nixvim = {

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "markdown-table-mode.nvim";
        version = "bb1ea9b";
        src = pkgs.fetchFromGitHub {
          owner = "nvim-lua";
          repo = "markdown-table-mode.nvim";
          rev = "bbb1ea9b76c1b29e15e14806fdfbb2319df5c06f";
          hash = "sha256-Pwsp9QQiADvzMjn2jSiQ/MPVCYjVnugKu55gbjvlYDk=";
        };
      })
    ];

    plugins.lz-n.plugins = [
      {
        __unkeyed-1 = "markdown-table-mode.nvim";
        ft = [ "markdown" "md"  ];
        after = ''
          function()
            require('markdown-table-mode').setup();
            vim.keymap.set('n', '<leader>mtt', ':Mtm<cr>', { silent = true, desc = "Toggle markdown table mode" })
            vim.notify("markdown-table-mode loaded")
          end
        '';
      }
    ];

#    extraConfigLuaPre = ''
#      require('markdown-table-mode').setup();
#    '';

#    keymaps = [
#      {
#        mode = "n";
#        key = "<leader>mtt";
#        action = ":Mtm<cr>";
#        options = { 
#          silent = true;
#          desc = "Toggle markdown table mode";
#        };
#      }
#    ];
    
  };
}
