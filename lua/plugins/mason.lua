-- Mason.

return {
  -- mason конфигурация.
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    lazy = false,
  },
  -- cmp конфигурация.
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Поддержка LSP
      "hrsh7th/cmp-buffer", -- Автозаполнение из буфера
      "hrsh7th/cmp-path", -- Автозаполнение для путей
      "hrsh7th/cmp-cmdline", -- Автозаполнение для командной строки
      "L3MON4D3/LuaSnip", -- Сниппеты
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmdline" },
        },
      })
    end,
  },
  -- lsp конфигурация.
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "tsserver", "cssls" },
      })

      local lspconfig = require("lspconfig")
      local on_attach = function(_, bufnr)
        local function buf_set_option(...)
          vim.api.nvim_buf_set_option(bufnr, ...)
        end
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      lspconfig.lua_ls.setup({ on_attach = on_attach })
      lspconfig.tsserver.setup({ on_attach = on_attach })
      lspconfig.gopls.setup({ on_attach = on_attach })
      lspconfig.cssls.setup({ on_attach = on_attach })
    end,
  },
}
