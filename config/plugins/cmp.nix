{

  plugins.luasnip.enable = true;
  plugins.cmp-nvim-lsp.enable = true;
  plugins.cmp-path.enable = true;

  extraConfigLua =
  ''
    -- Extra options for cmp-cmdline setup
    local cmp = require("cmp")
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
  '';

  plugins.cmp = {
    enable = true;

    settings = {
      snippet = {
        expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      };

      completion = {
        completeopt = "menu,menuone,noinsert";
      };

      # For an understanding of why these mappings were
      # chosen, you will need to read `:help ins-completion`
      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-y>" = "cmp.mapping.confirm { select = true }";
        "<C-Space>" = "cmp.mapping.complete {}";


        "<C-l>" = ''
          cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' })
        '';
        "<C-h>" = ''
          cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' })
        '';


      };

      # WARNING: If plugins.cmp.autoEnableSources Nixivm will automatically enable the
      # corresponding source plugins. This will work only when this option is set to a list.
      # If you use a raw lua string, you will need to explicitly enable the relevant source
      # plugins in your nixvim configuration.
      sources = [
        { name = "luasnip"; }
        { name = "nvim_lsp"; }
        { name = "path"; }
      ];
      window.documentation.border = [
          "╭"
          "─"
          "╮"
          "│"
          "╯"
          "─"
          "╰"
          "│"
      ];
    };
  };
}
