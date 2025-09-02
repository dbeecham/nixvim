{ pkgs, ... }:
{
  # <https://github.com/L3MON4D3/LuaSnip ⭐️4.0k 💾2.3k>
  plugins.luasnip = {
    enable = true;
    fromVscode = [ { paths = ./vscode-snippets; } { paths = "~/.config/nvim/vscode-snippets"; } ];
    fromSnipmate = [ { paths = ./snipmate-snippets; } { paths = "~/.config/nvim/snipmate-snippets"; } ];
    fromLua = [ { paths = ./luasnip-snippets; } ];
    luaConfig.post = ''
      require('luasnip.loaders.from_lua').lazy_load({ paths = "~/.config/nvim/luasnip-snippets", fs_event_providers = { libuv = true; } })
    '';
  };
}
