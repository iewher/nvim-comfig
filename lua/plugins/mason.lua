-- Mason

return {
	--mason confug
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
        lazy = false,
    },
    	-- lsp config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "gopls", "tsserver", "cssls" },
            }

            local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup{}
	    	lspconfig.tsserver.setup {}
	    	lspconfig.gopls.setup {}
	    	lspconfig.cssls.setup {}
        end,
    },
}
