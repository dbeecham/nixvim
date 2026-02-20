{

  imports = [
    ./vimspector.nix
    ./dap.nix
  ];

  # Install a tool that shows the content of the generated init.lua file. Run it using 'nixvim-print-init'.
  enablePrintInit = true;
}
