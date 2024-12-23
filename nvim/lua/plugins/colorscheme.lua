return {
  -- add dracula
  { "Mofiqul/dracula.nvim" },
  
  -- add Gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
