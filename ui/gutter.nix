{ lib, ... }: {

  # <https://github.com/tpope/vim-fugitive ⭐️21k 💾2.2k>
  # vim-fugitive is a Git wrapper for Vim
  plugins.fugitive.enable = true;

  # <https://github.com/lewis6991/gitsigns.nvim ⭐️6.1k 💾1.1k>
  # The 'gitsigns.nvim' plugin displays git signs in the gutter.
  plugins.gitsigns = {
      enable = true;
      settings = {
        signcolumn = true;
        auto_attach = true;
        attach_to_untracked = true;

        # Git signs priority needs to be higher than the marks priority,
        # otherwise the git signs are "shifted in", and it looks really weird.
        sign_priority = 30;
      };
  };

  # <https://github.com/chentoast/marks.nvim ⭐️1.1k 💾70>
  # The 'marks.nvim' plugins is a plugin which displays marks in the gutter.
  plugins.marks = {
      enable = true;
      settings = {
        builtin_marks = [ "<" ">" "." ];
        excluded_filetypes = [
          "netrw"
        ];
        sign_priority = {
          lower = 10;
          upper = 15;
          builtin = 8;
          bookmark = 20;
        };
      };
  };

  # <https://github.com/sindrets/diffview.nvim ⭐️4.8k 💾0.3k>
  plugins.diffview.enable = true;

}
