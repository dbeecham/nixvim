{ pkgs, ... }:
{
  # <https://github.com/L3MON4D3/LuaSnip ⭐️4.0k 💾2.3k>
  plugins.luasnip = {
    enable = true;
    fromVscode = [ { paths = ./snippets/vscode-snippets; } { paths = "~/.config/nvim/snippets/vscode"; } ];
    fromSnipmate = [ { paths = ./snippets/snipmate-snippets; } { paths = "~/.config/nvim/snippets/snipmate"; } ];
    fromLua = [ { paths = ./snippets/luasnip-snippets; } { paths = "~/.config/nvim/snippets/luasnip"; } ];
  };
}
