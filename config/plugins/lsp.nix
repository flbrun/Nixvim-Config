{ pkgs, ... }:
{
  plugins = {
    lsp-lines.enable = true;

    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };

    helm.enable = true;

    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          rust = [ "rustfmt" ];
          json = [ "prettier" ];
          yaml = [ "prettier" ];
          lua = [ "stylua" ];
          python = [ "black" ];
        };

        format_on_save = {
          timeout_ms = 2000;
          lsp_fallback = true;
        };

        notify_on_error = false;
      };
    };

    lsp = {
      enable = true;
      inlayHints = true;

      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };
        lspBuf = {
          gd = "definition";
          gD = "references";
          gt = "type_definition";
          gi = "implementation";
          K = "hover";
          "<F2>" = "rename";
        };
      };

      servers = {
        ts_ls.enable = true;
        gopls.enable = true;
        golangci_lint_ls.enable = true;
        lua_ls.enable = true;
        nil_ls.enable = true;
        pyright.enable = true;
        pylsp.enable = true;
        tflint.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        terraformls.enable = true;
        kotlin_language_server.enable = true;

        rust_analyzer = {
          enable = true;
          settings."rust-analyzer" = {
            cargo.allFeatures = true;
            check.command = "clippy";
            inlayHints.lifetimeElisionHints.enable = "always";
          };
        };

        helm_ls = {
          enable = true;
          extraOptions.settings."helm_ls".yamlls.path =
            "${pkgs.yaml-language-server}/bin/yaml-language-server";
        };

        yamlls = {
          enable = true;
          extraOptions.settings.yaml = {
            validate = true;
            hover = true;
            completion = true;
            schemas = {
              kubernetes = "'*.yaml";
              "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
              "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
              "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
              "https://json.schemastore.org/kustomization.json" = "kustomization.{yml,yaml}";
              "https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook" = "*play*.{yml,yaml}";
              "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
              "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
              "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "*docker-compose*.{yml,yaml}";
              "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" = "*flow*.{yml,yaml}";
            };
          };
        };

        jsonls = {
          enable = true;
          extraOptions.settings.json = {
            validate.enable = true;
            schemas = [
              { fileMatch = [ "package.json" ]; url = "https://json.schemastore.org/package.json"; }
              { fileMatch = [ "tsconfig*.json" ]; url = "https://json.schemastore.org/tsconfig.json"; }
              { fileMatch = [ ".eslintrc.json" ".eslintrc" ]; url = "https://json.schemastore.org/eslintrc.json"; }
              { fileMatch = [ "prettierrc.json" ".prettierrc" ]; url = "https://json.schemastore.org/prettierrc.json"; }
              { fileMatch = [ "babel.config.json" ]; url = "https://json.schemastore.org/babelrc.json"; }
            ];
          };
        };
        dockerls = {
          enable = true;
          extraOptions = {
            cmd = [ "${pkgs.nodePackages.dockerfile-language-server-nodejs}/bin/docker-langserver" "--stdio" ];
            filetypes = [ "dockerfile" ];
            root_dir = ''
              vim.fs.dirname(vim.fs.find({".git", "Dockerfile"}, { upward = true })[1])
            '';
            settings.docker.languageserver = {
              diagnostics.enable = true;
              completion.enable = true;
            };
          };
        };
      };
    };
  };
}
