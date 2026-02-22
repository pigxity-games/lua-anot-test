--@component, [Counter]
local component = {
    count = 0
}

function component:_init(inst: BasePart)
    self.instance = inst
    local detector: ClickDetector = inst:WaitForChild("ClickDetector")
    local label: TextLabel = inst.SurfaceGui.TextLabel

    detector.MouseClick:Connect(function(player)
        self.count += 1
        label.Text = "Count: " .. self.count
    end)
end

return component