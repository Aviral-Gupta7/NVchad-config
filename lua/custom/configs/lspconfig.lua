local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client,bufnr)
  end,
  capabilities = capabilities, 
}

lspconfig.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}

lspconfig.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact"
  }
}

lspconfig.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "scss",
    "less",
  }
}

lspconfig.emmet_language_server.setup({
  filetypes = {
    "astro",
    "eruby",
    "html",
    "php",
    "pug",
    "sass",
    "javascriptreact",
    "typescriptreact"
  },
  init_options = {
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> 
    syntaxProfiles = {},
    --- @type table<string, string>
    variables = {},
  },
})


