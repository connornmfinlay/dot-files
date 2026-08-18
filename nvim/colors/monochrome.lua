-- monochrome.lua — pure black / white theme (macOS)
vim.opt.termguicolors = true
vim.g.colors_name = "monochrome"

local bg        = "#000000"  -- black background
local bg_alt    = "#0A0A0A"  -- slightly lifted (floats, sidebar)
local bg_sel    = "#1A1A1A"  -- selection / cursor line
local fg        = "#FFFFFF"  -- main text
local fg_dim    = "#CCCCCC"  -- secondary text
local muted     = "#808080"  -- comments / line numbers
local muted_dim = "#4D4D4D"  -- dimmer grey (least emphasis)

-- Diagnostics need to remain distinguishable; keeping red/yellow purely for severity signaling
local red     = "#FF5C5C"
local yellow  = "#F5D76E"

local set = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- Editor
set("Normal",       { fg = fg, bg = bg })
set("NormalFloat",  { fg = fg, bg = bg_alt })
set("LineNr",       { fg = muted })
set("CursorLine",   { bg = bg_sel })
set("CursorLineNr", { fg = fg, bold = true })
set("Visual",       { bg = fg_dim, fg = bg })
set("StatusLine",   { fg = fg, bg = bg_alt, bold = true })
set("VertSplit",    { fg = muted })
set("Pmenu",        { fg = fg, bg = bg_alt })
set("PmenuSel",     { fg = bg, bg = fg, bold = true })
set("Search",       { fg = bg, bg = fg })
set("MatchParen",   { fg = fg, bold = true, underline = true })

-- Syntax — no accent colour, so weight/style/shade carry the hierarchy
set("Comment",      { fg = muted, italic = true })
set("Constant",     { fg = fg })
set("String",       { fg = fg_dim, italic = true })
set("Number",       { fg = fg })
set("Identifier",   { fg = fg })
set("Function",     { fg = fg, bold = true })
set("Statement",    { fg = fg, bold = true })
set("Keyword",      { fg = fg, bold = true, italic = true })
set("PreProc",      { fg = fg_dim })
set("Type",         { fg = fg, underline = true })
set("Special",      { fg = fg, bold = true })
set("Error",        { fg = red, bold = true })
set("Todo",         { fg = bg, bg = fg, bold = true })

-- Diagnostics
set("DiagnosticError", { fg = red })
set("DiagnosticWarn",  { fg = yellow })
set("DiagnosticInfo",  { fg = fg_dim })
set("DiagnosticHint",  { fg = muted_dim })
