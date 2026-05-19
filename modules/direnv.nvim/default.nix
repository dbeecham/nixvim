{ lib, ... }:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "direnv-nvim";
  maintainers = "dbe";
  moduleName = "direnv";
  extraConfig = {
    autoGroups = {
      direnv = {
        clear = true;
      };
    };
    autoCmd = [
      {
        event = "User";
        pattern = "DirenvLoaded";
        group = "direnv";
        callback = ''
          function()
            vim.api.nvim_exec_autocmds('FileType', { pattern = vim.bo.filetype })
          end
        '';
      }
    ];
  };
  settingsExample = {
    autoload_direnv = true;
  };
}
