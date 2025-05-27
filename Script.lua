local validKey = "DON-K82h-n8XG-QlC5-9ZmR-hWDq" -- replace with key received from Discord/email

local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "KeyMenu"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Text = "Enter Key to Continue"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8, 0, 0, 40)
box.Position = UDim2.new(0.1, 0, 0.4, 0)
box.PlaceholderText = "Enter your key..."
box.Text = ""
box.Font = Enum.Font.Code
box.TextSize = 14
box.TextColor3 = Color3.fromRGB(0, 0, 0)
box.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)

local submit = Instance.new("TextButton", frame)
submit.Text = "Submit"
submit.Size = UDim2.new(0.8, 0, 0, 40)
submit.Position = UDim2.new(0.1, 0, 0.7, 0)
submit.Font = Enum.Font.GothamBold
submit.TextSize = 16
submit.TextColor3 = Color3.fromRGB(255, 255, 255)
submit.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Instance.new("UICorner", submit).CornerRadius = UDim.new(0, 8)

submit.MouseButton1Click:Connect(function()
    if box.Text == validKey then
        gui:Destroy()
        print("✅ Access Granted!")
        -- Run your script here
    else
        box.Text = ""
        box.PlaceholderText = "❌ Invalid Key"
    end
end)
