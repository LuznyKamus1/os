local component = component or require("component")
local gpu = component.list("gpu")()
local screen = component.list("screen")()

public function tellgpu(cmd, arg, ...)
    local res = {}
    local n = 1
    for address in component.list("screen") do
        component.invoke(gpu, "bind", address)
        if type(arg) == "table" then
            res[#res + 1] = {component.invoke(gpu, cmd, table.unpack(arg[n]))}
        else
            res[#res + 1] = {component.invoke(gpu, cmd, arg, ..)}
        end
        n = n+1
    end
    return res
end