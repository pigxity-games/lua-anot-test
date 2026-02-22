local Players = game:GetService("Players")

--@service, depends=[client:MessageController, DataService]
local module = {}

function module:_init(deps)
	self.MessageController = deps.client.MessageController
	self.DataService = deps.DataService

	task.spawn(start)
end

function start()
	while task.wait(1) do
		for _, player in ipairs(Players:GetPlayers()) do
			module.MessageController.printMessage(player, 'Hello, ' .. player.Name)
			module.DataService:update(player, {money = math.floor(time())})
		end
	end
end

return module
