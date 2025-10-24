{
  # <https://github.com/stevearc/aerial.nvim ⭐️2.1k 💾0.8k>
  # lsp/treesitter/markdown/asciidoc/man based outline
  plugins.aerial.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>ao";
      action = ":AerialOpen<cr>";
      options.desc = "Aerial: open";
    }
    {
      mode = "n";
      key = "<leader>ac";
      action = ":AerialClose<cr>";
      options.desc = "Aerial: close";
    }
  ];

  extraConfigLuaPost = ''
    require('which-key').add({
      { "<leader>a", group = "aerial", icon = { icon = "✨" } },
    })
  '';

}
