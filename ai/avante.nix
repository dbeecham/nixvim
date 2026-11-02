{ self, pkgs, lib, ... }: {
  plugins.avante = {
    enable = true;
    package = self.inputs.avante.packages.${pkgs.stdenv.hostPlatform.system}.avante-nvim;
    settings = {
      input = {
        provider = "snacks";
      };
      provider = "maki";
      acp_providers = {
        maki = {
          command = "maki";
          args = [ "acp" ];
        };
      };
    };
  };
}
