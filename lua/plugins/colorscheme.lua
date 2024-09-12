return  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,

    config = function()
      -- Theme list
      -- github_dark
      -- github_dark_default
      -- github_dark_dimmed
      -- github_light
      -- github_light_default
      -- github_light_dimmed
      vim.cmd.colorscheme("github_dark_dimmed")
    end,
  }
