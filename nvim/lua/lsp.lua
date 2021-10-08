-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}
lsp.gopls.setup {}
lsp.terraformls.setup{}
lsp.bashls.setup{}
lsp.yamlls.setup{}
lsp.dockerls.setup{}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

local opts = { noremap=true, silent=true }
-- Mappings.
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- lsp-install
--local function setup_servers()
  --require'lspinstall'.setup()

  ---- get all installed servers
  --local servers = require'lspinstall'.installed_servers()

  --for _, server in pairs(servers) do
    --local config = make_config()

    ---- language specific config
    --if server == "lua" then
      --config.settings = lua_settings
    --end
    --if server == "sourcekit" then
      --config.filetypes = {"swift", "objective-c", "objective-cpp"}; -- we don't want c and cpp!
    --end
    --if server == "clangd" then
      --config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
    --end

    --require'lspconfig'[server].setup(config)
  --end
--end

--setup_servers()
