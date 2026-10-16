{
  # <https://github.com/OXY2DEV/markview.nvim ⭐️2.8k 💾0.6k>
  # Markdown renderer in neovim. Used by codecompanion.
  plugins.markview = {
    enable = false;
    settings = {
      markdown = {
        enable = true;
        heading = {
          enable = true;
          heading_1 = {
            style = "label"; # simple, label, icon
            align = "left";
            corner_left = "    ";
            corner_right = "    ";
            icon = "";
            sign = "§;";
            sign_hl = "MarkviewHeading1";
          };
          heading_2 = {
            style = "simple";
            align = "left";
            icon = "";
            corner_left = "   ";
            corner_right = "   ";
            sign = "§2";
            sign_hl = "MarkviewHeading2";
          };
          heading_3 = {
            style = "simple";
            align = "left";
            icon = "";
          };
          org_indent = true;
          org_shift_char = " ";
          shift_width = 1;
          setext_1 = {
            style = "decorated";
            icon = "§ ";
          };
        };
        code_blocks = {
          style = "simple"; # simple, block
          min_width = 35;
          pad_amount = 4;
          sign = true;
          border_hl = "MarkviewCodeBlockBorder";
          default = {
            block_hl = "MarkviewCode";
            pad_hl = "MarkviewCodePad"; # left padding
          };
          wrap = false;
        };
        block_quotes = {
          wrap = false;
        };
        metadata_minus = {
          enable = true;
          border_top = "┄";
          border_bottom = "┄";
          hl = "MarkviewMetadata";
          border_hl = "MarkviewMetadataBorder";
        };
        list_items = {
          enable = true;
          wrap = true;
          shift_width = 2;
          marker_minus = {
            text = "•";
            add_padding = true;
          };
        };
      };
      preview = {
        enable = true;
        filetypes = [ "markdown" "codecompanion" ];
        ignore_buftypes = [];
        buf_ignore = [];
      };
      markdown_inline = {
        enable = true;
        hyperlinks = {
          enable = true;
          default = {
            icon = "";
            hl = "MarkviewHyperlink";
          };
        };
      };
    };
  };
}
