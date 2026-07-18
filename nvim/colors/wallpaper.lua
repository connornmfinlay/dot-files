-- wallpaper.lua — neon blue / black / white theme
vim.opt.termguicolors = true
vim.g.colors_name = "wallpaper"

local bg      = "#000000"  -- black background
local bg_alt  = "#0A0A0A"  -- slightly lifted (floats, sidebar)
local bg_sel  = "#1A1A1A"  -- selection / cursor line
local fg      = "#FFFFFF"  -- main text
local fg_dim  = "#CCCCCC"  -- secondary text
local muted   = "#808080"  -- comments / line numbers
local neon    = "#3FBFFE"  -- neon blue accent
local neon_dim = "#2080BB" -- dimmer neon (less emphasis)

-- Diagnostics need to remain distinguishable; keeping red/yellow purely for severity signaling
local red     = "#FF5C5C"
local yellow  = "#F5D76E"

local set = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- Editor
set("Normal",       { fg = fg, bg = bg })
set("NormalFloat",  { fg = fg, bg = bg_alt })
set("LineNr",       { fg = muted })
set("CursorLine",   { bg = bg_sel })
set("CursorLineNr", { fg = neon, bold = true })
set("Visual",       { bg = neon_dim, fg = bg })
set("StatusLine",   { fg = neon, bg = bg_alt })
set("VertSplit",    { fg = muted })
set("Pmenu",        { fg = fg, bg = bg_alt })
set("PmenuSel",     { fg = bg, bg = neon, bold = true })
set("Search",       { fg = bg, bg = neon })
set("MatchParen",   { fg = neon, bold = true, underline = true })

-- Syntax
set("Comment",      { fg = muted, italic = true })
set("Constant",     { fg = neon })
set("String",       { fg = fg_dim })
set("Number",       { fg = neon })
set("Identifier",   { fg = fg })
set("Function",     { fg = neon, bold = true })
set("Statement",    { fg = fg, bold = true })
set("Keyword",      { fg = fg, bold = true, italic = true })
set("PreProc",      { fg = neon_dim })
set("Type",         { fg = neon })
set("Special",      { fg = neon, bold = true })
set("Error",        { fg = red, bold = true })
set("Todo",         { fg = bg, bg = neon, bold = true })

-- Diagnostics
set("DiagnosticError", { fg = red })
set("DiagnosticWarn",  { fg = yellow })
set("DiagnosticInfo",  { fg = neon })
set("DiagnosticHint",  { fg = muted })
