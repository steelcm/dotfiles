return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('tokyonight-night')
        -- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE })
        -- vim.api.nvim_set_hl(0, "NeoTreeNormal", { guibg = NONE, ctermbg = NONE })
        -- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { guibg = NONE, ctermbg = NONE })
    end,
}
