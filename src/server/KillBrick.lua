--@module
local module = {}

--@bindTag, [KillBrick]
function module.killBrick(inst: BasePart)
    local conn = inst.Touched:Connect(function(p)
        local char = p.Parent
        local hum = char:FindFirstChild("Humanoid") :: Humanoid
        if hum then
            hum.Health = 0
        end
    end)
    return function()
        print("Killbrick: disconnect")
        conn:Disconnect()
    end
end

return module