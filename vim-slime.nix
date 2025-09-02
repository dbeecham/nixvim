{ lib, ... }: 
with { inherit (lib.nixvim) mkRaw; };
{
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
}
