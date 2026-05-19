local M = {};

local tips = {
  "Use `g?` to..",
  "Use `dm[' and 'dm]` to go to previous/next mark.",
  "Use `dm{mark}` to delete a mark.",
};

function M.setup()
  local tip = tips[math.random(#tips)];
  require('fidget').notify(tip, 'DiagnosticHint', {
    annotate = '✨ tip',
    ttl = 10,
    key = 'motd',
  });
end

return M
