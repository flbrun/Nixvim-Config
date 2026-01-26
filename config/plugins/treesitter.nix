{pkgs, ...}{
  plugins = {
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 4;
        min_window_height = 40;
      };
    };
    sleuth.enable = true;
  };
  #extraConfigLua = ''
  #    vim.api.nvim_set_hl(0, "@boolean", { fg = "#ff8800", bold = true })

  #    vim.api.nvim_set_hl(0, "@number", { fg = "#61afef" })

  #    vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#c678dd", italic = true })

  #    vim.api.nvim_set_hl(0, "@function", { fg = "#98c379" })
  #    vim.api.nvim_set_hl(0, "@keyword", { fg = "#e06c75" })
  #  '';
}
