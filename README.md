# prequire
Like `require` but with LuaComp preprocessing step added before loading the file. For OpenComputers mod only.

## Dependencies

Requires [libluacomp](https://github.com/lunaboards-dev/LuaComp/releases)

## Usage

```Lua
local prequire = require("prequire")
local somelib = prequire("somelib") -- somelib.lua can contain LuaComp syntax
```

## Notes

`posix` directory contains compatibility layer (since LuaComp uses luaposix), it's hacky but it gets the job done.
