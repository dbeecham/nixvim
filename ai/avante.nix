{
  plugins.avante = {
    enable = true;
    settings = {
      provider = "sanctuary";
      providers = {
        sanctuary = {
          __inherited_from = "openai";
          endpoint = "http://100.103.199.12:8301";
          model = "qwen3-coder";
          timeout = 30000;
          api_key_name = "USER";
        };
      };
    };
  };
}
