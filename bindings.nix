{
  keymaps = [
    {
      key = "<S-LeftMouse>";
      options = { noremap = true; silent = true; };
      action = ''
        function()
          local mp = vim.fn.getmousepos()
          local buf = vim.api.nvim_win_get_buf(mp.winid)
          vim.notify(vim.inspect(vim.inspect_pos(buf, mp.line - 1, mp.column - 1)))
        end
      '';
    }

    # Tab navigation with Ctrl-Tab and Ctrl-Shift-Tab
    {
      mode = [ "n" ];
      key = "<C-Tab>";
      options = { noremap = true; };
      action = ":tabnext<CR>";
    }
    {
      mode = [ "n" ];
      key = "<C-S-Tab>";
      options = { noremap = true; };
      action = ":tabprevious<CR>";
    }
  ];
}
