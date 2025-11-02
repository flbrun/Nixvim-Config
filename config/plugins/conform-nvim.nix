{ lib, pkgs, ... }:{
  plugins = {
    conform-nvim = {
      enable = true;
      settings= {
        default_format_opts.lsp_format = "prefer";
        formattersByFt = {
          asm = ["asmfmt"];
          c = ["astyle"];
          cpp = ["astyle"];
          css = ["prettierd" "prettier"];
          cmake = ["cmake_format"];
          go = ["goimports" "gofumpt" "golines"];
          html = ["prettierd" "prettier"];
          javascript = ["prettierd" "prettier"];
          javascriptreact = ["prettier"];
          lua = ["stylua"];
          markdown = ["prettier"];
          nix = ["nixfmt"];
          python = ["isort" "black"];
          rust = ["rustfmt"];
          sh = ["shfmt"];
          typescript = ["prettierd" "prettier"];
          typescriptreact = ["prettier"];
          yaml = [ "yamlfix" ];
          xml = [ "xmllint" ];
          json = [ "fixjson" ];
        };
        formatters = {
               xmllint.command = lib.getExe' pkgs.libxml2 "xmllint";
               json.command = lib.getExe pkgs.fixjson;
               yaml.command = lib.getExe pkgs.yamlfix;
             };
      };
    };
  };
}
