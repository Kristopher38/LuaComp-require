local luacomp = require("libluacomp")

local loading = {}

local function prequire(module)
  checkArg(1, module, "string")
  if package.loaded[module] ~= nil then
    return package.loaded[module]
  elseif not loading[module] then
    local library, status, step

    step, library, status = "not found", package.searchpath(module, package.path)

    if library then
      step, library, status = "luacomp failed", luacomp.process_file(library, library)
    end

    if library then
        step, library, status = "load failed (compilation)", load(library)
    end

    if library then
      loading[module] = true
      step, library, status = "load failed (runtime)", pcall(library, module)
      loading[module] = false
    end

    assert(library, string.format("module '%s' %s:\n%s", module, step, status))
    package.loaded[module] = status
    return status
  else
    error("already loading: " .. module .. "\n" .. debug.traceback(), 2)
  end
end

return prequire