{ pkgs, config, lib, ... }:
{

  extraPlugins = [
    pkgs.vimPlugins.opencode-nvim
  ];

  keymaps = [
    { mode = "n"; key = "<leader>ot"; action = lib.nixvim.mkRaw "require('opencode').toggle"; options.desc = "Toggle OpenCode"; }
    { mode = "n"; key = "<leader>oa"; action = lib.nixvim.mkRaw "require('opencode').ask"; options.desc = "Ask OpenCode"; }
    { mode = "v"; key = "<leader>oa"; action = lib.nixvim.mkRaw "function() require('opencode').ask('@selection: ') end"; options.desc = "Ask OpenCode"; }
    { mode = [ "n" "v" ]; key = "<leader>oe"; action = lib.nixvim.mkRaw "require('opencode').select_prompt"; options.desc = "Select Prompt"; }
    { mode = "n"; key = "<leader>on"; action = lib.nixvim.mkRaw "function() require('opencode').command('session_new') end"; }

  ];

  extraConfigLuaPost = ''
    require('which-key').add({
      { "<leader>o", group = "OpenCode", icon = { icon = "󰚰", color = "blue" } },
      { "<leader>o", mode = "v", group = "OpenCode", icon = { icon = "󰚰", color = "blue" } },
    })
  '';

}
