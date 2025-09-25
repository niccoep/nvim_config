local home = os.getenv( 'HOME' )

vim.g.mapleader = " "

--color
vim.cmd("colo habamax")
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

vim.opt.number = true
vim.opt.relativenumber = true
--vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.ignorecase = true
vim.opt.winborder = "rounded"
vim.opt.signcolumn = "yes"

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

vim.diagnostic.config({
  float = {
    border = "rounded"
  }
})

vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>s', ':source<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>n', ':tabnew<CR>:tabm<CR>')
vim.keymap.set('n', '<leader>N', ':tabnew<CR>:tabm<CR>:tablast<CR>:Explore<CR>')
vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', '<leader>1', ':tabn1<CR>')
vim.keymap.set('n', '<leader>2', ':tabn2<CR>')
vim.keymap.set('n', '<leader>3', ':tabn3<CR>')
vim.keymap.set('n', '<leader>4', ':tabn4<CR>')
vim.keymap.set('n', '<leader>5', ':tabn5<CR>')
vim.keymap.set('n', '<leader>6', ':tabn6<CR>')
vim.keymap.set('n', '<leader>7', ':tabn7<CR>')
vim.keymap.set('n', '<leader>8', ':tabn8<CR>')
vim.keymap.set('n', '<leader>9', ':tabn9<CR>')


vim.lsp.config( 'luals', {
    cmd = { home .. '/.local/lua-language-server/bin/lua-language-server' },
    root_markers = { '.git' },
    filetypes = { 'lua' },
    settings = {
        lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            runtime = {
                version =  'LuaJIT'
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("",true),
            },
        }
    }
})
vim.lsp.enable( 'luals' )

vim.lsp.config('rust_analyzer', {
    cmd = { home .. '/.cargo/bin/rust-analyzer' },
    root_markers = { 'Cargo.toml' },
    --root_markers = { '.git' },
    filetypes = { 'rust' },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
            procMacro = {
                enable = true,
            },
        }
    }
})
vim.lsp.enable('rust_analyzer')

vim.keymap.set( 'n', 'gd', vim.lsp.buf.definition )
vim.keymap.set( 'n', 'gD', vim.lsp.buf.declaration )
vim.keymap.set( 'n', 'gr', vim.lsp.buf.references )
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })





