{
  plugins = {
    chatgpt = {
      enable = true;
      settings = {
        keymaps = {
          submit = "<Enter>";
          close = "<Esc>";
        };
      };
    };

    copilot-lua = {
      enable = true;
      settings = {
        filetypes = { markdown = true; };
        suggestion = {
          enabled = true;
          auto_trigger = true;
        };
      };
    };
  };

  keymaps = [
    # --- Copilot toggle ---
    {
      key = "<leader>ac";
      mode = "n";
      action = ''
        :if get(g:, "copilot_status", "stopped") ==# "running" |
          let g:copilot_status = "stopped" |
          Copilot disable |
        else |
          let g:copilot_status = "running" |
          Copilot enable |
        endif<CR>
      '';
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Copilot";
      };
    }

    # --- ChatGPT commands ---
    {
      key = "<leader>aCc";
      mode = "n";
      action = "<cmd>ChatGPT<CR>";
      options.desc = "ChatGPT";
    }

    {
      key = "<leader>aCe";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTEditWithInstruction<CR>";
      options.desc = "Edit with instruction";
    }

    {
      key = "<leader>aCg";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun grammar_correction<CR>";
      options.desc = "Grammar Correction";
    }

    {
      key = "<leader>aCt";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun translate<CR>";
      options.desc = "Translate";
    }

    {
      key = "<leader>aCk";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun keywords<CR>";
      options.desc = "Keywords";
    }

    {
      key = "<leader>aCd";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun docstring<CR>";
      options.desc = "Docstring";
    }

    {
      key = "<leader>aCa";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun add_tests<CR>";
      options.desc = "Add Tests";
    }

    {
      key = "<leader>aCo";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun optimize_code<CR>";
      options.desc = "Optimize Code";
    }

    {
      key = "<leader>aCs";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun summarize<CR>";
      options.desc = "Summarize";
    }

    {
      key = "<leader>aCf";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun fix_bugs<CR>";
      options.desc = "Fix Bugs";
    }

    {
      key = "<leader>aCx";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun explain_code<CR>";
      options.desc = "Explain Code";
    }

    {
      key = "<leader>aCr";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun roxygen_edit<CR>";
      options.desc = "Roxygen Edit";
    }

    {
      key = "<leader>aCl";
      mode = [ "n" "v" ];
      action = "<cmd>ChatGPTRun code_readability_analysis<CR>";
      options.desc = "Code Readability Analysis";
    }
  ];
}
