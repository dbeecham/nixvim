{
  plugins.avante = {
    enable = true;
    settings = {
      input = {
        provider = "snacks";
      };
      provider = "sanctuary";
      providers = {
        sanctuary = {
          __inherited_from = "openai";
          use_response_api = false;
          endpoint = "http://100.103.199.12:8301";
          model = "qwen3-coder";
          timeout = 30000;
          api_key_name = "USER";
        };
      };
    };
  };
}
