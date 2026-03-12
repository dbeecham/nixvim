{ lib, ... }: {
  keymaps = [
    { mode = [ "n" "v" ]; key = "<leader>se"; action = lib.nixvim.mkRaw "function() require('agentic').toggle() end"; options.desc = "agentic:toggle"; }
    { mode = [ "n" "v" ]; key = "<leader>sa"; action = lib.nixvim.mkRaw "function() require('agentic').add_selection_or_file_to_context() end"; options.desc = "agentic:add"; }
    { mode = [ "n" "v" ]; key = "<leader>sn"; action = lib.nixvim.mkRaw "function() require('agentic').new_session() end"; options.desc = "agentic:new"; }
    { mode = [ "n" "v" ]; key = "<leader>sr"; action = lib.nixvim.mkRaw "function() require('agentic').restore_session() end"; options.desc = "agentic:restore"; }
    { mode = "n"; key = "<leader>sd"; action = lib.nixvim.mkRaw "function() require('agentic').add_current_line_diagnostic() end"; options.desc = "agentic:add diagnostic"; }
    { mode = "n"; key = "<leader>sD"; action = lib.nixvim.mkRaw "function() require('agentic').add_buffer_diagnostics() end"; options.desc = "agentic:add all diagnostic"; }
  ];
}
