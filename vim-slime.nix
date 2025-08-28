{ config, ... }: 
with { inherit (config.lib.nixvim) mkRaw; };
{
  programs.nixvim = {
    plugins.vim-slime = {
      enable = true;
      settings.target = "neovim";
    };
    autoGroups.vim-slime.clear = true;
    autoCmd = [
      {
        event = "BufRead";
        group = "vim-slime";
        pattern = [ "*.md" ];
        callback = mkRaw ''
          function(ev)
            vim.b.slime_cell_delimiter = '^```'
            vim.keymap.set(
              'n',
              '<c-c><c-c>',
              '<Plug>SlimeSendCell'
            )
          end
        '';
      }
    ];
  };
}
