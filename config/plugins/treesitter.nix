{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        cue
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

  # Optional, but nice for YAML editing (nixvim dropped plugins.vim-yaml)
  extraPlugins = [ pkgs.vimPlugins.vim-yaml ];

  # YAML: purple keys (left), blue values (right) + 2-space indent
  # Also re-applies after colorscheme changes (Modus overrides highlights late).
  extraConfigLua = ''
    vim.cmd("syntax on")

    local function apply_yaml_colors()
      local set = vim.api.nvim_set_hl

      -- Keys (left side) -> purple
      -- We set multiple captures because query names vary by TS version.
      set(0, "@property.yaml",  { fg = "#bb9af7", bold = true })
      set(0, "@field.yaml",     { fg = "#bb9af7", bold = true })
      set(0, "@key.yaml",       { fg = "#bb9af7", bold = true })
      set(0, "@keyword.yaml",   { fg = "#bb9af7", bold = true })
      set(0, "@tag.yaml",       { fg = "#bb9af7", bold = true })
      set(0, "@attribute.yaml", { fg = "#bb9af7", bold = true })

      -- ":" delimiter -> neutral bright
      set(0, "@punctuation.delimiter.yaml", { fg = "#c0caf5", bold = true })
      set(0, "@punctuation.delimiter",      { fg = "#c0caf5", bold = true })

      -- Values (right side) -> blue
      set(0, "@string.yaml",   { fg = "#7aa2f7" })
      set(0, "@number.yaml",   { fg = "#7aa2f7", bold = true })
      set(0, "@boolean.yaml",  { fg = "#7aa2f7", bold = true })
      set(0, "@constant.yaml", { fg = "#7aa2f7" })

      -- Fallbacks (sometimes YAML uses generic captures)
      set(0, "@string",   { fg = "#7aa2f7" })
      set(0, "@number",   { fg = "#7aa2f7", bold = true })
      set(0, "@boolean",  { fg = "#7aa2f7", bold = true })
      set(0, "@constant", { fg = "#7aa2f7" })

      -- Anchors/aliases (&appName / *appName)
      set(0, "@label.yaml", { fg = "#bb9af7", underline = true })

      -- Comments
      set(0, "@comment", { fg = "#565f89", italic = true })
    end

    -- YAML indent = 2 (keep global defaults for other filetypes)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "yaml", "yml" },
      callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.expandtab = true
        apply_yaml_colors()
      end,
    })

    -- Apply once immediately…
    apply_yaml_colors()

    -- …and re-apply after any colorscheme changes (Modus does this)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        apply_yaml_colors()
      end,
    })
  '';
}
