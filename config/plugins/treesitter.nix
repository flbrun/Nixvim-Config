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

  # Make YAML "key: value" more contrast-rich + enforce YAML 2-space indent
  extraConfigLua = ''
  vim.cmd("syntax on")

  -- YAML should be 2-space indented (keep global defaults for other languages)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "yml" },
    callback = function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end,
  })

  local set = vim.api.nvim_set_hl

  -- =========================
  -- YAML: purple keys, blue values
  -- =========================

  -- Keys (left side) -> purple
  set(0, "@property.yaml", { fg = "#bb9af7", bold = true })
  set(0, "@field.yaml",    { fg = "#bb9af7", bold = true })
  set(0, "@keyword.yaml",  { fg = "#bb9af7", bold = true })
  set(0, "@tag.yaml",      { fg = "#bb9af7", bold = true })

  -- ":" delimiter -> neutral bright (helps eye separate left/right)
  set(0, "@punctuation.delimiter.yaml", { fg = "#c0caf5", bold = true })
  set(0, "@punctuation.delimiter",      { fg = "#c0caf5", bold = true })

  -- Values (right side) -> blue
  set(0, "@string.yaml",   { fg = "#7aa2f7" })
  set(0, "@number.yaml",   { fg = "#7aa2f7", bold = true })
  set(0, "@boolean.yaml",  { fg = "#7aa2f7", bold = true })
  set(0, "@constant.yaml", { fg = "#7aa2f7" })

  -- Fallbacks (some Treesitter versions use generic captures)
  set(0, "@string",   { fg = "#7aa2f7" })
  set(0, "@number",   { fg = "#7aa2f7", bold = true })
  set(0, "@boolean",  { fg = "#7aa2f7", bold = true })
  set(0, "@constant", { fg = "#7aa2f7" })

  -- Anchors / aliases (YAML &appName / *appName)
  set(0, "@label.yaml", { fg = "#bb9af7", underline = true })

  -- Comments
  set(0, "@comment", { fg = "#565f89", italic = true })
'';
}
