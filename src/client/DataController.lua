--@service, depends=[server:DataService]
local controller = {}

function controller:_init(deps)
    self.DataService = deps.server.DataService

    task.spawn(function()
        self.data = self.DataService.get()
        print(self.data)
    end)
end

--@remote, event
function controller.updateData(data)
    for key, value in pairs(data) do
        controller.data[key] = value
    end
    print(controller.data)
end

return controller