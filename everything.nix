{ pkgs, config, lib, ... }:
with { inherit (lib.nixvim) mkRaw; };
{
  impureRtp = true;

  # See [neovimcraft](https://neovimcraft.com) for plugin popularity.

  # plugins.notify = { # Extra optional for noice
  #   enable = true;
  #   lazyLoad.settings.enabled = "not vim.g.vscode";
  #   settings = {
  #     stages = "fade";
  #     timeout = 1000;
  #   };
  # };


  # <https://github.com/nvim-treesitter/nvim-treesitter ⭐️12.4k 💾5.9k>
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = false;
    };
  };


  # <https://github.com/nvim-treesitter/nvim-treesitter-context ⭐️2.9k 💾0.5k>
  # The 'treesitter-context' plugin is a plugin that shows the context of the
  # current line in a floating window at the top of the screen.
  # hl groups:
  # - TreesitterContext
  # - TreesitterContextLineNumber
  # - TreesitterContextSeparator
  # - TreesitterContextBottom
  plugins.treesitter-context = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
    settings = {
      max_lines = 4;
      max_window_height = 28;
      mode = "topline";
      trim_scope = "outer";
    };
  };


  # <https://github.com/nvim-treesitter/nvim-treesitter-textobjects ⭐️2.5k 💾0.6k>
  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "aC" = "@conditional.outer";
        "iC" = "@conditional.inner";
        "as" = "@local.scope";
      };
    };
  };

  # <https://github.com/andymass/vim-matchup ⭐️1.8k 💾0.8k>
  # Extends vim's `%` motion to match more than just parentheses, and
  # provides additional text objects for matching pairs.
  plugins.vim-matchup = {
    enable = true;
    # I use sandwich for surround, so disable it in vim-matchup
    settings.surround_enabled = 0;
  };

  # <https://github.com/machakann/vim-sandwich ⭐️1.5k 💾0.5k>
  # We need to edit the key mappings for sandwith; both vim-sandwith and
  # leap.nvim uses the 's' key.
  # sandwich is a plugin that allows you to easily add, change, and delete
  # surrounding characters in your text;
  #  - sa'    - Surround Add single quotes
  #  - sr'"   - Surround Replace single quotes with double quotes
  #  - sd'    - Surround Delete single quotes
  #  - sdb    - Surround Delete auto
  #  - srb    - Surround Replace auto
  #  - saiw[  - Surround Add Inner Word brackets
  #  - sais'  - Surround Add Inner Sentence single quotes
  #  - saib'  - Surround Add Inner Block single quotes
  #  - sait'  - Surround Add Inner Tag single quotes
  #  - Vsa(   - Visual Surround Add parentheses
  #  - ^Vsa{  - Block Visual Surround Add curly braces
  # The 'ib', 'ab', 'is' and 'as' are text objects for automatically
  # selecting a "block" or a "search". They are configured using g:sandwith#recipes.
  plugins.sandwich = {
    enable = true;
    settings = {
      no_default_key_mappings = 0;
    };
  };

  # <https://github.com/m4xshen/autoclose.nvim ⭐️0.6k 💾0.1k>
  # So, what I've learned is that I don't want to automatically close
  # brackets and stuff, I want to easily be able to close them.
  # plugins.autoclose.enable = true;

  # <https://github.com/andrewferrier/debugprint.nvim ⭐️0.5k 💾1.0k>
  # The 'debugprint' plugin is a neat way to add debug prints to your code.
  # It's triggered by hitting 'g?p' to add a print statement below, and 'g?P'
  # to add a print statement above. There is also 'g?o' and 'g?O' to add
  # textobj prints (not tested), and 'g?v' and 'g?V' to add variable prints,
  # (also not tested).
  plugins.debugprint.enable = true;

  # <https://github.com/nvim-neorocks/lz.n ⭐️178 💾0.3k>
  # Enable lazy-loading so we don't load plugins when used in VSCode
  plugins.lz-n.enable = true;

  plugins.toggleterm = {
    enable = true;
    lazyLoad.settings.enabled = "not vim.g.vscode";
  };

  plugins.nvim-surround = {
    enable = true;
  };

  opts = {

    # Number of lines to scroll when using ctrl+u and ctrl+d.
    scroll = 12;

    # Minimum number of lines to keep above/below the cursor when scrolling.
    scrolloff = 8;

    # Ignore case in searches, unless the search pattern contains uppercase
    # characters, in which case it will be case-sensitive.
    ignorecase = true;
    smartcase = true;


    # Always display a single fold column in the gutter.
    foldcolumn = "1";

    # Prefer manual folding using 'zf', 'zd', 'zo', etc.
    foldmethod = "manual";

    number = true;
    relativenumber = true;
    wrap = false;
    conceallevel = 2;
    #winwidth = 100;
    #winminwidth = 35;
    wildmode = "longest:full,full,noselect";

    # If not specified elsewhere, we use a 4-space tabstop.
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    expandtab = true;
    scrollback = 1000;

    autochdir = false;

    # Required for nvim-notify
    # https://github.com/rcarriga/nvim-notify/blob/22f29093eae7785773ee9d543f8750348b1a195c/README.md?plain=1#L28
    termguicolors = true;

    # Split to the right, not the left
    splitright = true;

    # When on, all the windows are automatically made the same size after
    # splitting or closing a window. When off, splitting a window will
    # reduce the size of the current window and leave the other windows
    # the same.
    equalalways = true;

    # Make the 'equalalways' direction apply to both vertical and horizontal
    # splits.
    eadirection = "both";

    # Default "update time" is 4000ms, which is astronomical. It controls how
    # often the swap file is written to disk, and how often the cursor
    # position is "idle" (the CursorHold and CursorHoldI events). Set it to
    # something more reasonable.
    updatetime = 1000;

    # 'viewoptions' control what is saved to a view created by 'mkview'. By
    # default, it's set to 'cursor,folds,curdir', which is pretty reasonable.
    # I just want this here so I can keep track of it.
    viewoptions = "cursor,folds,curdir";

    # lualine recommends to set this.
    laststatus = 3;
  };
  globals = {
    netrw_winsize = -30;
    netrw_banner = 0;
    mapleader = " ";
  };
  keymaps = [
    # { mode = [ "v" "n" ]; key = "J"; action = "5j"; }
    # { mode = [ "v" "n" ]; key = "K"; action = "5k"; }

    # Remap Swedish keyboard layout keys to easier-to-reach keys for normal mode
    { mode = "n"; key = "å"; action = "["; options.remap = true; }
    { mode = "n"; key = "¨"; action = "]"; options.remap = true; }
    { mode = "n"; key = "-"; action = "/"; options.remap = true; }

    # Make Ctrl-A go to the beginning of the command line in command mode
    { mode = "c"; key = "<c-a>"; action = "<home>"; }

    # Getting out of the terminal mode is hard on swedish keyboard layouts. Using
    # escape here is not ideal, since terminal applications may want it, but
    # it's better than nothing. M-c only works for... well-configured terminals.
    { mode = "t"; key = "<M-c>"; action = "<C-\\><C-n>"; }
    { mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>"; }

    # Apparently, I've gone back and forward on using q and w for quitting and
    # saving. I'm currently feeling like it gives me less finger strain. It's
    # pretty comfy. Note to self: if I do regret this, write it down.
    # It's because it's already bound to record macro.
    { mode = "n"; key = "q"; action = ":q<cr>"; options = { silent = true; }; }
    { mode = "n"; key = "Q"; action = ":cquit<cr>"; }


    # { 
    #   mode = [ "i" "s" ];
    #   key = "<Tab>";
    #   action = lib.nixvim.mkRaw ''
    #     function()
    #
    #       if require('luasnip').expand_or_jumpable() then
    #         require('luasnip').expand_or_jump()
    #         return
    #       end
    #
    #       if require('blink-cmp').is_visible() then
    #         require('blink-cmp').insert_next()
    #         return
    #       end
    #
    #       -- Feed the tab character as normal
    #       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', true)
    #     end
    #   '';
    #   options.silent = true;
    # }

    { 
      mode = "i";
      key = "<S-Tab>";
      action = lib.nixvim.mkRaw ''
        function()
          if package.loaded['luasnip'] and require('blink-cmp').is_visible() then
            require('blink-cmp').insert_prev()
            return
          end

          return "<S-Tab>"
        end
      '';

      options = {
        silent = true;
        expr = true;
      };
    }

    {
      mode = "i";
      key = "<F3>";
      action = lib.nixvim.mkRaw ''
        function()
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
          end
        end
      '';
      options.silent = true;
      options.desc = "Accept Copilot suggestion";
    }

    {
      mode = "i";
      key = "";
      action = lib.nixvim.mkRaw ''
        function()
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept_line()
          end
        end
      '';
      options.silent = true;
      options.desc = "Accept Copilot suggestion";
    }

    {
      mode = "i";
      key = "<F13>";
      action = lib.nixvim.mkRaw ''
        function()
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
          end
        end
      '';
      options.silent = true;
      options.desc = "Accept Copilot suggestion";
    }

    {
      mode = "i";
      key = "<cr>";
      action = mkRaw ''
        function()
          if package.loaded['blink-cmp'] and require('blink-cmp').is_visible() and require('blink-cmp').get_selected_item() ~= nil then
            require('blink-cmp').accept()
            return
          end

          -- Else, just feed the Enter key as normal
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 'n', true)

        end
      '';
    }

    { 
      mode = "n"; 
      key = "<cr>"; 
      action = mkRaw ''
        function()
          -- Dismiss Noice messages, stop highlighting search matches, and
          -- close the preview window.
          ${lib.optionalString config.plugins.noice.enable ''require('noice').cmd('dismiss')''}
          vim.o.hlsearch = false
          vim.cmd.pclose()
        end
      '';
      options.silent = true;
    }

    # execute ~/.config/nvim/test.lua
    { 
      mode = "n"; 
      key = "<leader>vt"; 
      action = mkRaw ''
        function()
          local test_lua = vim.fn.expand("~/.config/nvim/test.lua")
          if vim.fn.filereadable(test_lua) == 1 then
            dofile(test_lua)
          end
        end
      ''; 
      options.desc = "Execute ~/.config/nvim/test.lua";
    }

    # edit ~/.config/nvim/test.lua
    { 
      mode = "n"; 
      key = "<leader>ve"; 
      action = ":vsplit ~/.config/nvim/test.lua<cr>";
      options.desc = "Edit ~/.config/nvim/test.lua";
    }

    # dim
    { 
      mode = "n";
      key = "<leader>zdt";
      action = ":Twilight<cr>";
      options.silent = true;
      options.desc = "Toggle dim"; 
    }

    { mode = "n"; key = "<leader>ct"; action = lib.nixvim.mkRaw "require('treesitter-context').toggle"; options.silent = true; options.desc = "Toggle treesitter context"; }

    # Use gF to "forcefully" edit the file under the cursor, creating it if
    # it doesn't exist.
    {
      mode = "n";
      key = "gF";
      action = lib.nixvim.mkRaw ''
        function()
          -- get the directory of the current file
          local dir = vim.fn.expand('%:h')

          -- get the target file name under the cursor
          local file = vim.fn.expand('<cfile>')

          -- normalize path
          local path = vim.fn.fnamemodify(dir .. '/' .. file, ':p')

          -- escape whitespaces
          vim.fn.fnameescape(path)

          -- open the file, create it if it doesn't exist
          vim.cmd.edit(path)
        end
      '';
      options.desc = "Edit file under cursor, create it if necessary";
    }


    # Make the Esc key close the popup menu if it's visible, in addition to
    # going to normal mode.
    # {
    #   mode = "i"; key = "<Esc>";
    #   action = ''pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"'';
    #   options.expr = true;
    # }

    # Same thing for command line
    # {
    #   mode = "c"; key = "<Esc>";
    #   action = ''wildmenumode() ? "\<C-e>\<Esc>" : "\<Esc>"'';
    #   options.expr = true;
    # }

    # Enable and disable the gutter with <leader>s
    {
      mode = "n";
      key = "<leader>s";
      action = lib.nixvim.mkRaw ''
        function()
          if vim.wo.number then
            vim.wo.number = false
            vim.wo.relativenumber = false
            vim.wo.signcolumn = "no"
            vim.wo.foldcolumn = "0"
          else
            vim.wo.number = true
            vim.wo.relativenumber = true
            vim.wo.signcolumn = "auto"
            vim.wo.foldcolumn = "1"
          end
        end
      '';
      options.desc = "Toggle gutter";
    }

  ];

  filetype.extension.flux = "flux";

  autoGroups = {
    view.clear = true;
  };

  autoCmd = [

    # Automatically save view when idle
    {
      group = "view";
      event = [ "CursorHold" "CursorHoldI" ];
      pattern = [ "*.nix" "*.c" "*.yaml" "*.yml" "*.md" "*.py" "*.css" "*.html" "*.js" "*.lua" ];
      command = "if &buftype == '' | silent! mkview | endif";
    }

    # Automatically save view when leaving a buffer or Vim
    {
      group = "view";
      event = [ "BufWinLeave" "FocusLost" "VimLeavePre" ];
      pattern = [ "*.nix" "*.c" "*.yaml" "*.yml" "*.md" "*.py" "*.css" "*.html" "*.js" "*.lua" ];
      command = "if &buftype == '' | silent! mkview | endif";
    }

    # Automatically load view when reading a file
    {
      group = "view";
      command = "silent! loadview";
      event = "FileType";
      pattern = [ "nix" "c" "yaml" "markdown" "python" "css" "html" "javascript" "lua" ];
    }

    # Resize all windows when the Vim window is resized
    { command = "tabdo wincmd ="; event = "VimResized"; }

    { event = "BufRead"; pattern = [ "*.flux" ]; command = "set filetype=flux"; }
    { event = "FileType"; pattern = [ "nix" "lua" "stylus" "json" ]; command = "set tabstop=2 softtabstop=2 shiftwidth=2 expandtab"; }

    # Terminal settings
    { event = "TermOpen"; command = "setlocal nonumber norelativenumber scrolloff=0 winfixwidth winfixheight"; }
  ];

  extraConfigLuaPre = ''
    -- Opening nvim in a terminal within nvim is pain when esc is mapped to 
    -- normal mode. If nvim is started in a nvim terminal, just quit.
    if vim.env.VIMRUNNING ~= nil and vim.fn.has("gui_running") == 0 then
      io.stderr:write("Vim is already running in the terminal\n")
      vim.api.nvim_command('cq! 1')
    else
      vim.env.VIMRUNNING = 1
    end

    local configwatch = function(file)
      local path = vim.fn.stdpath("config") .. "/" .. file
      if vim.fn.filereadable(path) then
        local w = vim.uv.new_fs_event()
        vim.notify("Watching " .. file .. " for changes...", vim.log.levels.INFO)
        w:start(
          path,
          {},
          vim.schedule_wrap(function(err, filename, status)
            if err then
              vim.notify("Error watching " .. file .. ": " .. err, vim.log.levels.ERROR)
              return
            end

            vim.notify("Reloading " .. file .. "...", vim.log.levels.INFO)
            dofile(path)
            configwatch(file)
          end)
        )
      end
    end

    local loadconfigwatch = function(file)
      local path = vim.fn.stdpath("config") .. "/" .. file
      vim.notify("Attempting to load " .. file .. "...", vim.log.levels.INFO)
      if vim.fn.filereadable(path) then
        vim.notify("Loading " .. file .. "...", vim.log.levels.INFO)
        dofile(path)
        configwatch(file)
      end
    end

    -- If ~/.config/nvim/init.lua exists, load it
    if vim.fn.filereadable(vim.fn.stdpath("config") .. "/init.local.lua") then
      dofile(vim.fn.stdpath("config") .. "/init.local.lua")
    end
  '';

  extraConfigLuaPost = ''

    -- If ~/.config/nvim/init.lua exists, load it
    if vim.fn.filereadable(vim.fn.stdpath("config") .. "/init.post.lua") then
      dofile(vim.fn.stdpath("config") .. "/init.post.lua")
    end


    local config = function(name)
      local path = vim.fn.stdpath("config") .. "/" .. name

      -- Make sure the file exists
      if not vim.fn.filereadable(path) then
        return
      end

      dofile(path)

      -- Add a watcher to the file
      -- local w = vim.uv.new_fs_event()
      -- w:start(
      --   path,
      --   {},
      --   vim.schedule_wrap(function(err, filename, status)
      --     if err then
      --       vim.notify("Error watching " .. filename .. ": " .. err, vim.log.levels.ERROR)
      --       return
      --     end
      --
      --     vim.notify("Reloading " .. name .. "...", vim.log.levels.INFO)
      --     config(name)
      --   end)
      -- )
    end
  '';

  colorscheme = "lunix";

}
