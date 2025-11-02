# Extensible UI for Neovim notifications and LSP progress messages.
{
  plugins = {
    fidget = {
      enable = true;
      settings = {
        progress.display.progress_icon.pattern = "meter";
        notification.window.winblend = 0;
      };
    };
  };
}
