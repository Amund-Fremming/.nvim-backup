local lsp_zero = require('lsp-zero')

-- LspAttach treffer alle servere, også de som settes opp utenom lsp-zero
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf, remap = false }

		-- Hopp til definisjon. F12 er samme tast som i VSCode.
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, opts)
		-- Telescope i stedet for quickfix: lukker seg selv når du velger,
		-- og gir preview mens du blar.
		local refs = function() require("telescope.builtin").lsp_references() end
		vim.keymap.set("n", "<S-F12>", refs, opts)

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gr", refs, opts)
		vim.keymap.set("n", "gi", function() require("telescope.builtin").lsp_implementations() end, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
	end,
})

-- Rename endrer også filer som ikke er åpne, men nvim lar dem ligge som
-- usparte buffere. Uten dette forsvinner endringene når du lukker nvim.
local rename_handler = vim.lsp.handlers["textDocument/rename"]
vim.lsp.handlers["textDocument/rename"] = function(err, result, ctx, config)
	rename_handler(err, result, ctx, config)
	if err or not result then
		return
	end

	local saved = 0
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].modified and vim.bo[buf].buftype == "" then
			vim.api.nvim_buf_call(buf, function() vim.cmd("silent! write") end)
			saved = saved + 1
		end
	end
	vim.notify("Rename lagret i " .. saved .. " fil(er)")
end

-- Vis feilen under cursor i et flytende vindu
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float({ border = "rounded", source = true })
end)

-- Samme, men kopierer meldingen til clipboard så den kan limes inn et sted
vim.keymap.set("n", "<leader>E", function()
	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
	local diags = vim.diagnostic.get(0, { lnum = line })
	if vim.tbl_isempty(diags) then
		vim.notify("Ingen feil på denne linja", vim.log.levels.INFO)
		return
	end

	local msgs = vim.tbl_map(function(d) return d.message end, diags)
	local text = table.concat(msgs, "\n")
	vim.fn.setreg("+", text)
	vim.notify("Kopiert til clipboard:\n" .. text)
end)

-- Hopp mellom feil
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)

vim.diagnostic.config({
	virtual_text = true,
	float = { border = "rounded", source = true },
})

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {'ts_ls', 'omnisharp'},
	handlers = {
		lsp_zero.default_setup,
	},
})

-- rust-analyzer comes from rustup, not mason, so it follows each project's
-- rust-toolchain.toml instead of forcing a newer toolchain.
vim.lsp.config('rust_analyzer', {
	cmd = { vim.fn.expand('~/.cargo/bin/rust-analyzer') },
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
vim.lsp.enable('rust_analyzer')

local cmp = require'cmp'

cmp.setup({
    mapping = {
        -- LSP setup on how to interact with the inline suggestions
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- Add other sources as necessary
    }),
    -- Include other configurations as needed
})
