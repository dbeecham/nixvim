{ config, ... }: 
with { inherit (config.lib.nixvim) mkRaw; };
{
  programs.nixvim = {
    autoGroups.markdown.clear = true;
    autoCmd = [
      {
        event = "BufRead";
        group = "markdown";
        pattern = [ "*.md" ];
        callback = mkRaw ''
          function(ev)
            vim.wo.number = false
            vim.wo.relativenumber = false
          end
        '';
      }
    ];
  };
}
