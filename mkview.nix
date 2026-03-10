{
  opts = {
    # 'viewoptions' control what is saved to a view created by 'mkview'. By
    # default, it's set to 'cursor,folds,curdir', which is pretty reasonable.
    # I just want this here so I can keep track of it.
    viewoptions = "cursor,folds,curdir";
  };

  autoGroups = {
    view.clear = true;
  };

  autoCmd = [

    # Automatically save view when idle
    {
      group = "view";
      event = [ "CursorHold" "CursorHoldI" ]; # see 'updatetime'
      pattern = [ "*.nix" "*.c" "*.yaml" "*.yml" "*.md" "*.py" "*.css" "*.html" "*.js" "*.lua" "*.rs" ".sass" ".scss" ];
      command = "if &buftype == '' | silent! mkview | endif";
    }

    # Automatically save view when leaving a buffer or Vim
    {
      group = "view";
      event = [ "BufWinLeave" "FocusLost" "VimLeavePre" ];
      pattern = [ "*.nix" "*.c" "*.yaml" "*.yml" "*.md" "*.py" "*.css" "*.html" "*.js" "*.lua" "*.rs" ".sass" ".scss"];
      command = "if &buftype == '' | silent! mkview | endif";
    }

    # Automatically load view when reading a file
    {
      group = "view";
      command = "silent! loadview";
      event = "FileType";
      pattern = [ "nix" "c" "yaml" "markdown" "python" "css" "html" "javascript" "lua" "rust" "sass" "scss" ];
    }

    # Resize all windows when the Vim window is resized
    { command = "tabdo wincmd ="; event = "VimResized"; }

    { event = "BufRead"; pattern = [ "*.flux" ]; command = "set filetype=flux"; }
    { event = "FileType"; pattern = [ "nix" "lua" "stylus" "json" ]; command = "set tabstop=2 softtabstop=2 shiftwidth=2 expandtab"; }

    # Terminal settings
    { event = "TermOpen"; command = "setlocal nonumber norelativenumber scrolloff=0 winfixwidth winfixheight"; }
  ];

}
