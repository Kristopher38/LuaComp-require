local unistd = {}

function unistd.isatty(fd)
    if fd == 0 then
        return io.input().tty
    elseif fd == 1 then
        return io.output().tty
    elseif fd == 2 then
        return io.error().tty
    else
        return false
    end
end

return unistd