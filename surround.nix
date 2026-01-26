{
  # <https://github.com/m4xshen/autoclose.nvim ⭐️0.6k 💾0.1k>
  # So, what I've learned is that I don't want to automatically close
  # brackets and stuff, I want to easily be able to close them.
  # plugins.autoclose.enable = true;

  # <https://github.com/andymass/vim-matchup ⭐️1.8k 💾0.8k>
  # Extends vim's `%` motion to match more than just parentheses, and
  # provides additional text objects for matching pairs.
  plugins.vim-matchup = {
    enable = false;
    # I use sandwich for surround, so disable it in vim-matchup
    settings.surround_enabled = 0;
  };
  
  # <https://github.com/machakann/vim-sandwich ⭐️1.5k 💾0.5k>
  # sandwich is a plugin that allows you to easily add, change, and delete
  # surrounding characters in your text. I no longer use vim-sandwich, as
  # it seems a bit unmaintained at the moment.
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
    enable = false;
    settings = {
      no_default_key_mappings = 0;
    };
  };

  # <https://github.com/kylechui/nvim-surround>
  # nvim-surround is pretty good, it can surround html tags, which is neat - but I
  # found the keybindings a bit awkward; nvim-surround uses 'ds' for 'delete surround'
  # instead of 'sd' like other plugins. This is especially weird when adding surrounds,
  # which uses 'ys' instead of 'sa'.
  plugins.nvim-surround = {
    enable = false;
  };

  # <https://github.com/nvim-mini/mini.surround>
  # mini.surround is really interesting. not only can it surround tags like nvim-surround,
  # it can also surround code into a function call, which is super neat. It also uses reasonable
  # keybindings, like 'sa' for surround add, and 'sd' for surround delete.
  plugins.mini-surround = {
    enable = true;
  };

}
