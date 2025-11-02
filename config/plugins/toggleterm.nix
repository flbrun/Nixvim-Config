{
  plugins = {
    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<F12>]]";
        direction = "float";
        float_opts.border = "curved";
        shading_factor = 2;
        size = 20;
        highlights = {
          Normal.link = "Normal";
          NormalNC.link = "NormalNC";
          NormalFloat.link = "NormalFloat";
          FloatBorder.link = "FloatBorder";
          StatusLine.link = "StatusLine";
          StatusLineNC.link = "StatusLineNC";
          WinBar.link = "WinBar";
          WinBarNC.link = "WinBarNC";
        };
      };
    };
  };

  keymaps = [
    {
      action = ":lua require('toggleterm').toggle(0)<CR>";
      key = "<F12>";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle terminal (centered)";
      };
    }
  ];
}
