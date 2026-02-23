--@component, [Counter]
local component = {
    count = 0,
    active = true
}

function component:_init(inst: BasePart)
    self.instance = inst
    local detector: ClickDetector = inst:WaitForChild("ClickDetector")
    local label: TextLabel = inst.SurfaceGui.TextLabel

    self.conn = detector.MouseClick:Connect(function(player)
        self.count += 1
        label.Text = "Count: " .. self.count
    end)

    task.spawn(function()
        while self.active do
            print("Counter: " .. self.instance.Name .. " count = " .. self.count)
            task.wait(3)
        end
    end)
end

function component:_destroy()
    print("Counter: Disconnect")
    self.conn:Disconnect()
    self.active = false
end


return component