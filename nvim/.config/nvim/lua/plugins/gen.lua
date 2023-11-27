return {
    "David-Kunz/gen.nvim",
    config = function()
        vim.keymap.set('v', '<leader>gn', ':Gen<CR>')
        vim.keymap.set('n', '<leader>gn', ':Gen<CR>')
        require('gen').model = 'codellama'
        -- require('gen').container = 'ollama'
    end
}
