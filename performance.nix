{
  performance = {
    byteCompileLua = {
      # Enable bytecode compilation for Lua files to improve startup time.
      enable = true;

      # Enable bytecode compilation for configuration files.
      configs = true;

      # Enable bytecode compilation for init.lua
      initLua = true;

      # Enable bytecode compilation for the lua library.
      luaLib = true;

      # Enable bytecode compilation for the nvim runtime library.
      nvimRuntime = true;

      # Enable bytecode compilation for plugins.
      plugins = true;
    };

    combinePlugins = {
      # Enable combining multiple plugins into a single Lua file to reduce
      # the number of files loaded at startup, improving startup time.
      # NOTE: This is experimental, and will fail if files names are not unique across
      # all plugins.
      enable = false;

      # List of plugins to exclude from combining.
      standalonePlugins = [];
    };
  };
}
