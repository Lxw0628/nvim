return {
  {
    "aurum77/live-server.nvim",
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    build = function()
      require("live_server.util").install()
    end,
    config = function()
      local status_ok, live_server = pcall(require, "live_server")
      if not status_ok then
        return
      end

      live_server.setup({
        port = 8080,
        browser_command = "firefox", -- Command or executable path
        quiet = false,
        no_css_inject = false,
        install_path = vim.fn.stdpath("config") .. "/live-server/",
      })
    end,
  },
}
