local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"bashls", "pyright", "rust_analyzer", "ansiblels", "dockerls", "bashls", "gopls", "zls", "lemminx", "powershell_es"},
})
-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "ts_ls", "clangd","bashls","dockerls","gopls", "zls", "lemminx"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}

--rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
}

--ansible server
lspconfig.ansiblels.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml"},
}

--xml
lspconfig.lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"xml"},
}

--toml
lspconfig.harper_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"toml"},
}

--ps1
lspconfig.powershell_es.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  shell = "powershell.exe",
  filetypes = {"ps1"},
  cmd = {'pwsh', '-NoLogo', '-NoProfile', '-Command', "c:/PSES/Start-EditorServices.ps1"},
}
