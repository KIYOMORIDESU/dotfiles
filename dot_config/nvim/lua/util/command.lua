local M = {}

function M.ExecuteCommand(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return  string.gsub(result, "\n$", "")
end

return M
