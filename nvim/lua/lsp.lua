-- LSP Config

-- install: npm install -g @ansible/ansible-language-server
vim.lsp.config.ansiblels = {
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml.ansible" },
  root_markers = { "ansible.cfg", ".ansible-lint", "requirements.yml", ".git" },
  settings = {
    ansible = {
      validation = {
        lint = { enabled = false },
      },
    },
  },
}

vim.lsp.enable({ "ansiblels" })

-- Plain *.yml/*.yaml don't carry an "ansible" filetype on their own,
-- so tag the usual Ansible file layouts as yaml.ansible.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/playbooks/*.yml", "*/playbooks/*.yaml",
    "*/roles/*/tasks/*.yml", "*/roles/*/tasks/*.yaml",
    "*/roles/*/handlers/*.yml", "*/roles/*/handlers/*.yaml",
    "*playbook*.yml", "*playbook*.yaml",
    "site.yml", "site.yaml",
  },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})
