return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = "<leader>sw" },
            { icon = " ", key = "r", desc = "Recent Files", action = "<leader>fr" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.picker('files', {cwd = vim.fn.stdpath('config')}); vim.cmd('cd ' .. vim.fn.stdpath('config'))",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          header = [[
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███  ███████████    
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
        },
      },
      picker = {
        layout = {
          preset = "ivy",
        },
        sources = {
          projects = {
            dev = { "~/Documents/Developer/Projects", "~/Documents/Developer/Codecrafter/" },
            patterns = {
              ".git",
              "_darcs",
              ".hg",
              ".bzr",
              ".svn",
              "package.json",
              "Makefile",
              "Cargo.toml",
              "go.mod",
              "Dockerfile",
              "docker-compose.yml",
              "README.md",
            },
            recent = false,
          },
        },
      },
      explorer = {
        replace_netrw = true,
      },
      styles = {
        input = {
          relative = "cursor",
          row = -3,
          col = 0,
          b = {
            completion = true,
          },
        },
      },
    },
  },
}
