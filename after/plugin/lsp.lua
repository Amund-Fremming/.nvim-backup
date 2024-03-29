local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'tsserver', 'rust_analyzer', 'omnisharp'},
	handlers = {
		lsp_zero.default_setup,
	},
})

local cmp = require'cmp'

cmp.setup({
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-pp>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-ppp>'] = cmp.mapping.confirm({ select = true }), -- Confirm with <leader>c
        ['<C-pppp>'] = cmp.mapping.complete(), -- Manually trigger completion with <leader>cp
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- Add other sources as necessary
    }),
    -- Include other configurations as needed
})

