local Players = game:GetService("Players")

local INIT_DATA = {
    money = 0,
    level = 0
}

--@service, depends=[client:DataController]
local service = {
    data = {}
}

function service:_init(deps)
    self.DataController = deps.client.DataController

    Players.PlayerAdded:Connect(function(player)
        self.data[player.UserId] = INIT_DATA
    end)
end

function service:set(player: Player, data: PlayerData)
    self.data[player.UserId] = data
end

function service:update(player: Player, data)
    for key, value in pairs(data) do
        self.data[player.UserId][key] = value
    end

    self.DataController.updateData(player, data)
end

--@remote, function
function service.get(player: Player)
    return service.data[player.UserId]
end

return service