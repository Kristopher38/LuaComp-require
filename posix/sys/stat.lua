local filesystem = require("filesystem")
local stat = {}

function stat.stat(path)
	local exists = filesystem.exists(path) -- this should suffice for now
    if exists then
        return {}
    else
        return nil, path .. ": No such file or directory"
    end
end

return stat