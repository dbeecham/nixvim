{

  # <https://github.com/nvim-neo-tree/neo-tree.nvim ⭐️4.9k 💾0.8k>
  plugins.neo-tree = {
    enable = true;
    filesystem = {
      useLibuvFileWatcher = true;
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = true;
      };
    };
    closeIfLastWindow = true;
    window.width = 30;
  };

  extraConfigLuaPost = ''
    require('which-key').add({
      { "<leader>t", group = "neotree", icon = { icon = require('mini.icons').get('filetype', 'dir') } },
    })
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>to";
      action = ":Neotree show<cr>";
      options.desc = "Neotree: open";
    }
    {
      mode = "n";
      key = "<leader>tc";
      action = ":Neotree close<cr>";
      options.desc = "Neotree: close";
    }
  ];

}
