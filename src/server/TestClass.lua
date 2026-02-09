local ReplicatedStorage = game:GetService("ReplicatedStorage")
local class = require(ReplicatedStorage.Generated.Index).Class

--@indexed
local TestClass = {}

function TestClass:_init(str: any)
    self.value = str
end

function TestClass:getString(): any
    return self.value
end

TestClass = class(TestClass)
return TestClass