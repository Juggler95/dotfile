-- lua/plugins/live-server.lua
return {
    "barrett-ruth/live-server.nvim",
    build = function()
        -- Try pnpm first, fallback to npm
        local handle = io.popen("which pnpm")
        local result = handle:read("*a")
        handle:close()

        if result ~= "" then
            print("Installing/Updating live-server via pnpm...")
            os.execute("pnpm add -g live-server")
        else
            print("Installing/Updating live-server via npm...")
            os.execute("npm install -g live-server")
        end
    end,
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
}
