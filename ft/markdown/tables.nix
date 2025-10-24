{ pkgs, ... }: {

  extraPlugins = [
    pkgs.vimPlugins.markdown-table-mode
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
    
}
