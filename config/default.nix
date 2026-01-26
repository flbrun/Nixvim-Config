{
  imports = [
    ./plugins
    ./keymapping.nix
  ];

  config = {
    colorschemes.modus = {
      enable = true;
      settings.style = "modus_vivendi";
    };

    performance.byteCompileLua.enable = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = false;
    };

    globals = {
      loaded_ruby_provider = 0;
      loaded_perl_provider = 0;
      loaded_python_provider = 0;
    };

    opts = {
      updatetime = 100;
      relativenumber = true;
      number = true;
      hidden = true;
      mouse = "a";
      mousemodel = "extend";
      splitbelow = true;
      splitright = true;
      swapfile = false;
      modeline = true;
      modelines = 100;
      undofile = true;
      incsearch = true;
      inccommand = "split";
      ignorecase = true;
      smartcase = true;
      scrolloff = 8;
      cursorline = false;
      cursorcolumn = false;
      signcolumn = "yes";
      laststatus = 3;
      fileencoding = "utf-8";
      termguicolors = true;
      spell = false;
      wrap = false;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
      textwidth = 0;
      foldlevel = 300;
    };

    # --- Added: better YAML indent + richer Treesitter highlights (esp. with Modus) ---
    extraConfigLua = ''
      vim.cmd("syntax on")

      -- YAML should be 2-space indented (keep your global 4 for other languages)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "yaml", "yml" },
        callback = function()
          vim.opt_local.shiftwidth = 2
          vim.opt_local.tabstop = 2
          vim.opt_local.expandtab = true
        end,
      })

      -- Make Treesitter captures more contrasty (works well with Modus Vivendi)
      local set = vim.api.nvim_set_hl

      -- YAML keys / fields
      set(0, "@property.yaml", { bold = true })
      set(0, "@field.yaml",    { bold = true })

      -- Anchors/aliases often show up as labels depending on TS queries
      set(0, "@label.yaml",    { underline = true })

      -- Make booleans/numbers stand out in config files
      set(0, "@boolean",       { bold = true })
      set(0, "@number",        { bold = true })

      -- Comments: readable + slightly styled
      set(0, "@comment",       { italic = true })
    '';
  };
}
