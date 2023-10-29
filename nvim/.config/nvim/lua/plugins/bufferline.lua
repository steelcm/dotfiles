-- https://github.com/akinsho/bufferline.nvim
return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            separator_style = "slant",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Explorer",
                    highlight = "Directory",
                    separator = true -- use a "true" to enable the default, or set your own character
                }
            }
        }
    }
}
