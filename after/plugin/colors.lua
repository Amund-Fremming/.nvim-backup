-- "amund" er porten av VSCode-temaet mitt, se colors/amund.lua
function ColorMyPencils(color)
	color = color or "amund"
	vim.cmd.colorscheme(color)
end

-- Kall denne hvis du vil se terminalbakgrunnen gjennom nvim
function TransparentBg()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

ColorMyPencils()
