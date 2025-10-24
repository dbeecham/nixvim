{ lib, ... }: {

  # <https://github.com/jpalardy/vim-slime ⭐️2.0k 💾0.7k>
  plugins.vim-slime = {
    enable = true;
    settings.target = "neovim";
  };

  # <https://github.com/michaelb/sniprun ⭐️1.6k 💾1.3k>
  # The 'sniprun' plugin is a REPL plugin that can run code in a variety of
  # languages. It's trigged by hitting <leader>r
  plugins.sniprun = {
    enable = true;
    settings = {
      display_options = {
        terminal_line_number = false;
        terminal_signcolumn = false;
      };
      selected_interpreters = [
        "Python3_fifo"
        "Bash_original"
        "Lua_nvim"
        "SQL_original"
      ];
      repl_enable = [
        "Bash_original"
        "Python3_fifo"
      ];
      display = [
        "Terminal"
        "TempFloatingWindowOk"
        #"VirtualTextOk"
      ];
    };
  };

  autoGroups.vim-slime.clear = true;
  autoCmd = [
    {
      event = "BufRead";
      group = "vim-slime";
      pattern = [ "*.md" ];
      callback = lib.nixvim.mkRaw ''
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
