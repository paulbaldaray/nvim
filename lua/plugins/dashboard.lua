return {
	"folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[
        ▒▒╗        █████╗   ▒▒▒▒▒▒▒╗▒▒╗   ▒▒╗        AI
        ▒▒║       ██╔══██╗  ╚══▒▒▒╔╝╚▒▒╗ ▒▒╔╝     AI   
        ▒▒║       ███████║    ▒▒▒╔╝  ╚▒▒▒▒╔╝   ai      
        ▒▒║       ██╔══██║   ▒▒▒╔╝    ╚▒▒╔╝  ai        
        ▒▒▒▒▒▒▒╗  ██║  ██║  ▒▒▒▒▒▒▒╗   ▒▒║             
        ╚══════╝  ╚═╝  ╚═╝  ╚══════╝   ╚═╝             
        ▒▒╗   ▒▒╗  ██████╗  ▒▒▒╗   ▒▒▒╗                
        ▒▒║   ▒▒║  ╚═██╔═╝  ▒▒▒▒╗ ▒▒▒▒║                
        ▒▒║   ▒▒║    ██║    ▒▒╔▒▒▒▒╔▒▒║                
        ╚▒▒╗ ▒▒╔╝    ██║    ▒▒║╚▒▒╔╝▒▒║                
         ╚▒▒▒▒╔╝   ██████╗  ▒▒║ ╚═╝ ▒▒║                
          ╚═══╝    ╚═════╝  ╚═╝     ╚═╝                
        ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
        },
      },
    },
  }
}
