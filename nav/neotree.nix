{

  # <https://github.com/nvim-neo-tree/neo-tree.nvim ⭐️4.9k 💾0.8k>
  plugins.neo-tree = {
    enable = true;
    settings = {
      filesystem = {
        use_libuv_file_watcher = true;
        follow_current_file = {
          enabled = true;
          leave_dirs_open = true;
        };
      };
      close_if_last_window = true;
      window.width = 30;
    };
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
