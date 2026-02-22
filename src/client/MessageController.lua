--@service
local controller = {}

--@remote, event
function controller.printMessage(message: string)
	print("Recieved message " .. message)
end

return controller
