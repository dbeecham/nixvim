{ lib, ... }: {

  # Use :CodeCompanionChat to open the chat window
  # Use `:checkhealth codecompanion` to check health
  # In visual mode, use `:CodeCompanion <prompt>` to ask an LLM a question
  plugins.codecompanion = {

    # codecompanion currently does not load because it depends
    # on blink, which is apparently loaded after codecompanion.
    # I should fix this soon.
    enable = true;
    # lazyLoad.settings = {
    #   enabled = "not vim.g.vscode";
    #   before = lib.nixvim.mkRaw "function() require('lz-n').trigger_load('blink.cmp') end";
    # };
    settings = {

      interactions = {
        chat = {
          adapter = "opencode";
          opts.completion_provider = "blink";
        };
        inline.adapter = "sanctuary";
        cmd.adapter = "sanctuary";
      };

      adapters.http.sanctuary = lib.nixvim.mkRaw ''
        function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://sanctuary:8301/v1",
              chat_url = "/chat/completions",
              api_key = "USER",
            },
            schema = {
              model = {
                default = "default",
              },
            },
          })
        end
      '';

      adapter.acp.opencode = lib.nixvim.mkRaw ''
        function()
          return require('codecompanion.adapters').extend('opencode', {
            commands = { default = { 'opencode', 'acp' } }
          })
        end
      '';

    };
  };

}
