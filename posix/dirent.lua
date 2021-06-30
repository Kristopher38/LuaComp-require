local filesystem = require("filesystem")
local dirent = {}

function dirent.files(path)
    return filesystem.list(path)
end

return dirent