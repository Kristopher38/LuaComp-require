local stdlib = {}

function stdlib.setenv(var, val)
    os.setenv(var, val)
end

return stdlib