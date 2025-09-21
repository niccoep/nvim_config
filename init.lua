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
vim.keymap.set('n', '<leader>E', ':Explore<CR>')


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

--vim.lsp.config( 

vim.lsp.enable( 'luals' )

vim.keymap.set( 'n', 'gd', vim.lsp.buf.definition )
vim.keymap.set( 'n', 'gD', vim.lsp.buf.declaration )
vim.keymap.set( 'n', 'gr', vim.lsp.buf.references )
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })





