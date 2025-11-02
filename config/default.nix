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
  };
}
