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

    -- Keys (left side)
    set(0, "@property.yaml", { fg = "#7aa2f7", bold = true })
    set(0, "@field.yaml",    { fg = "#7aa2f7", bold = true })

    -- The ":" delimiter (visually separates key/value)
    set(0, "@punctuation.delimiter.yaml", { fg = "#c0caf5", bold = true })

    -- Values (right side)
    set(0, "@string.yaml",  { fg = "#9ece6a" })              -- strings
    set(0, "@number.yaml",  { fg = "#ff9e64", bold = true }) -- numbers
    set(0, "@boolean.yaml", { fg = "#e0af68", bold = true }) -- booleans

    -- Fallbacks (some TS versions use generic groups)
    set(0, "@string",  { fg = "#9ece6a" })
    set(0, "@number",  { fg = "#ff9e64", bold = true })
    set(0, "@boolean", { fg = "#e0af68", bold = true })

    -- Anchors/aliases (often show as labels)
    set(0, "@label.yaml", { fg = "#bb9af7", underline = true })

    -- Comments
    set(0, "@comment", { fg = "#565f89", italic = true })
  '';
}
