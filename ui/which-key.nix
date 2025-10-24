{

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
        { "<leader>v", icon = { icon = require('mini.icons').get('filetype', 'vim') } },
        { "<leader>l", icon = "📌", desc = "lsp" },
        { "<leader>z", group = "zen", icon = { icon = "🧘" } },
        { "<leader>zd", group = "dim", icon = { icon = "💡" } },
        { "<leader>c", desc = "context", icon = { icon = "🌳" } },
      })
    '';
  };

}
