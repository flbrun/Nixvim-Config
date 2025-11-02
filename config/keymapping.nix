{
  globals = {
    mapleader = " ";
  };

  keymaps = [
    {
      action = ":q<CR>";
      key = "<leader>q";
      options = {
        silent = true;
        noremap = true;
        desc = "Quit";
      };
    }

    {
      action = ":wq<CR>";
      key = "<leader>x";
      options = {
        silent = true;
        noremap = true;
        desc = "Save and quit";
      };
    }

    {
      action = ":bd<CR>";
      key = "<leader>c";
      options = {
        silent = true;
        noremap = true;
        desc = "Close buffer";
      };
    }

    {
      action = "ggVG";
      key = "<C-a>";
      options = {
        noremap = true;
        silent = true;
        desc = "Select all text";
      };
    }

    {
      key = "<tab>";
      mode = [
        "n"
        "v"
        "i"
      ];
      action = "><esc>gv";
      options = {
        noremap = true;
        silent = true;
        desc = "indent line or selection";
      };
    }

    {
      key = "<S-Tab>";
      mode = [
        "n"
        "v"
        "i"
      ];
      action = "<<Esc>gv";
      options = {
        noremap = true;
        silent = true;
        desc = "Unindent line or selection";
      };
    }

    {
      key = "<Tab>";
      mode = "i";
      action = "<C-t>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      key = "<S-Tab>";
      mode = "i";
      action = "<C-d>";
      options = {
        noremap = true;
        silent = true;
      };
    }
  ];
}
