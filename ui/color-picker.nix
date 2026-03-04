{ pkgs, ... }: {
  # extraPlugins = with pkgs.vimPlugins; [
  #   oklch-color-picker-nvim
  # ];
  # extraPackagesAfter = with pkgs; [
  #   (oklch-color-picker.overrideAttrs (old: {
  #     runtimeDependencies = with pkgs; [
  #       libGL
  #     ];
  #     meta.broken = false;
  #   }))
  # ];
}
