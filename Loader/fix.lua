

local player = game:GetService("Players").LocalPlayer


local function regenLoop(char)
    local hum = char:WaitForChild("Humanoid")
    while hum and hum.Parent do
        if hum.Health > 0 then
            hum.Health = hum.MaxHealth
        end
        task.wait(0.1)
    end
end


player.CharacterAdded:Connect(function(char)
    task.spawn(function()
        regenLoop(char)
    end)
end)

if player.Character then
    task.spawn(function()
        regenLoop(player.Character)
    end)
end
