-- endeavour.lua — matches Hyprland wallpaper palette (EndeavourOS)
vim.cmd("hi clear")
vim.opt.termguicolors = true
vim.g.colors_name = "endeavour"

local bg      = "#1A0A2E"  -- deep purple background
local bg_alt  = "#0D0019"  -- darker (sidebar/inactive)
local fg      = "#E8E0F5"  -- main text
local muted   = "#8B7BA8"  -- comments / line numbers
local blue    = "#89CFF0"  -- baby blue
local pink    = "#E040FB"  -- electric pink
local purple  = "#6B2FA0"  -- mid purple
local red     = "#FF5C8A"
local green   = "#A0E090"
local yellow  = "#F5D76E"

local set = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

-- Editor
set("Normal",       { fg = fg, bg = bg })
set("NormalFloat",  { fg = fg, bg = bg_alt })
set("LineNr",       { fg = muted })
set("CursorLine",   { bg = bg_alt })
set("CursorLineNr", { fg = pink, bold = true })
set("Visual",       { bg = purple })
set("StatusLine",   { fg = blue, bg = bg_alt })
set("VertSplit",    { fg = purple })
set("Pmenu",        { fg = fg, bg = bg_alt })
set("PmenuSel",     { fg = bg, bg = pink })
set("Search",       { fg = bg, bg = yellow })
set("MatchParen",   { fg = pink, bold = true })

-- Syntax
set("Comment",      { fg = muted, italic = true })
set("Constant",     { fg = pink })
set("String",       { fg = green })
set("Number",       { fg = yellow })
set("Identifier",   { fg = blue })
set("Function",     { fg = blue, bold = true })
set("Statement",    { fg = pink })
set("Keyword",      { fg = pink, italic = true })
set("PreProc",      { fg = purple })
set("Type",         { fg = blue })
set("Special",      { fg = pink })
set("Error",        { fg = red, bold = true })
set("Todo",         { fg = yellow, bg = bg, bold = true })

-- Diagnostics
set("DiagnosticError", { fg = red })
set("DiagnosticWarn",  { fg = yellow })
set("DiagnosticInfo",  { fg = blue })
set("DiagnosticHint",  { fg = muted })
