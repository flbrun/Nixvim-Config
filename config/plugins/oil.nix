{
  plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "icons"
        "permissions"
        "size"
        "mtime"
      ];
      default_file_explorer = true;
      delete_to_trash = true;
      skip_confirmation_for_simple_edits = true;
      win_options = {
            signcolumn = "yes:2";
      };
    };
  };

  plugins.oil-git-status = {
    enable = true;
  };
  keymaps = [
    {
      key = "<leader>ee";
      action = ":Oil<CR>";
      options = {
        silent = true;
        noremap = true;
        desc = "Open Oil";
      };
    }
  ];
}
