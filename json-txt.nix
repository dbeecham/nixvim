{
  autoGroups = {
    "json-txt" = {
      clear = true;
    };
  };
  autoCmd = [
    {
      command = "setlocal filetype=json";
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "*.json.txt"
      ];
    }
  ];
}
