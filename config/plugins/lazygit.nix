{
  plugins = {
    lazygit = {
      enable = true;
    };
  };

  keymaps = [
    {
      action = ":LazyGit<CR>";
      key = "<leader>gg";
      options = {
        silent = true;
        noremap = true;
        desc = "Open lazygit";
      };
    }
  ];
}
