if vim.g.neovide then
  local neovide_options = {
    guifont = "Hack Nerd Font:h11",         -- font for graphical nvim
    linespace = 4,                         -- space between lines
  }

  for k, v in pairs(neovide_options) do
    vim.opt[k] = v
  end

  -- transparency value
  vim.g.neovide_transparency = 0.7
  vim.g.transparency = 0.7

end
