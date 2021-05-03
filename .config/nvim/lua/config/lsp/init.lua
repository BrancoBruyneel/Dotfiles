local cmd = vim.cmd
local has_lsp, lspconfig = pcall(require, 'lspconfig')
if not has_lsp then
  return
end

require'config.lsp.completion'


-- Diagnostics
local function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = false,
      signs = true,
      update_in_insert = true,
    }
  )

  cmd("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()")
end

local function default_on_attach(client)
  print('Attaching to ' .. client.name)
  setup_diagnostics()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local default_config = {
  on_attach = default_on_attach,
  capabilities = capabilities,
}

-- Language Servers
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.tsserver.setup(default_config)
lspconfig.vimls.setup(default_config)
lspconfig.pyls.setup(default_config)

local pid = vim.fn.getpid()
local omnisharp_bin = "/opt/omnisharp-roslyn/run"

lspconfig.omnisharp.setup({
    cmd={ omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = default_on_attach,
})

-- Lsp Settings

cmd("sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError")
cmd("sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning")
cmd("sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation")
cmd("sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint")

cmd("hi LspDiagnosticsDefaultError guifg=#e06c75")
cmd("hi LspDiagnosticsDefaultWarning guifg=#e5c07b")

cmd("hi LspDiagnosticsSignError guifg=#e06c75")
cmd("hi LspDiagnosticsSignWarning guifg=#e5c07b")
cmd("hi LspDiagnosticsSignInfo guifg=#abb2bf")

vim.g.Omnisharp_server_stdio = 0
