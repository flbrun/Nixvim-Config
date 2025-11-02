{
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzy-native.enable = true;
        ui-select.enable = true;

        frecency = {
          enable = true;

          settings = { db_safe_mode = false; };
        };
      };
    };
  };
  keymaps = [
    {
      action = ":Telescope live_grep<CR>";
      key = "<leader>sg";
      options = {
        silent = true;
        noremap = true;
        desc = "Search grep";
      };
    }
    # Telescope search current buffer
    {
      action = ":Telescope current_buffer_fuzzy_find<CR>";
      key = "<leader>sb";
      options = {
        silent = true;
        noremap = true;
        desc = "Search current buffer";
      };
    }
    # Telescope search commands
    {
      action = ":Telescope command_history<CR>";
      key = "<leader>sc";
      options = {
        silent = true;
        noremap = true;
        desc = "Search commands";
      };
    }
    # Telescope search files
    {
      action = ":Telescope find_files<CR>";
      key = "<leader>sf";
      options = {
        silent = true;
        noremap = true;
        desc = "Search files";
      };
    }
    # Telescope search commands
    {
      action = ":Telescope commands<CR>";
      key = "<leader>sc";
      options = {
        silent = true;
        noremap = true;
        desc = "Search commands";
      };
    }
  ];
}
