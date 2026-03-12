{
  autoCmd = [
    { event = [ "FocusGained" "BufEnter" ]; command = "if mode() != 'c' | checktime | endif"; pattern = "*"; }
  ];
}
