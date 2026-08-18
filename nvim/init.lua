vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Colorscheme auto-swaps by OS/distro:
--   macOS       -> pure black/white "monochrome"
--   EndeavourOS -> cyberpunk-samurai purple "endeavour"
--   else        -> black/white + neon blue "wallpaper"
local function linux_distro_id()
  local f = io.open("/etc/os-release", "r")
  if not f then return nil end
  local id
  for line in f:lines() do
    id = line:match('^ID="?([^"]*)"?$')
    if id then break end
  end
  f:close()
  return id
end

local sysname = vim.loop.os_uname().sysname
local colorscheme = "wallpaper"
if sysname == "Darwin" then
  colorscheme = "monochrome"
elseif sysname == "Linux" and linux_distro_id() == "endeavouros" then
  colorscheme = "endeavour"
end

vim.cmd.colorscheme(colorscheme)

require("lsp")
