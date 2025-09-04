{
  autoGroups = {
    "json-txt" = {
      clear = true;
    };
  };
  autoCmd = [
    {
      group = "json-txt";
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
