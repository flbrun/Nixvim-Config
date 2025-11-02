{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        mode = "buffers";
        numbers = "none";
        diagnostics = "nvim_lsp";
        show_buffer_close_icons = false;
        show_close_icon = false;
        separator_style = "slant";
        always_show_bufferline = true;
        offsets = [
          {
            filetype = "oil";
            text = "File Explorer";
            highlight = "Directory";
            separator = true;
          }
        ];
      };
    };
  };

  # 💡 Recommended keymaps
  keymaps = [
    {
      key = "<A-,>";
      action = ":BufferLineCyclePrev<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Previous buffer";
      };
    }
    {
      key = "<A-.>";
      action = ":BufferLineCycleNext<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Next buffer";
      };
    }
    {
      key = "<A-1>";
      action = ":BufferLineGoToBuffer 1<CR>";
      options.desc = "Go to buffer 1";
    }
    {
      key = "<A-2>";
      action = ":BufferLineGoToBuffer 2<CR>";
      options.desc = "Go to buffer 2";
    }
    {
      key = "<leader>bp";
      action = ":BufferLinePick<CR>";
      options.desc = "Pick buffer visually";
    }
    {
      key = "<leader>bd";
      action = ":bdelete<CR>";
      options.desc = "Close current buffer";
    }
  ];
}
