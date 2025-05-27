-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystem"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 0.1
frame.Parent = gui
frame:TweenPosition(UDim2.new(0.5, -150, 0.5, -100), "Out", "Back", 0.4)

-- UICorner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "🔑 Enter Key to Unlock"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

-- TextBox
local box = Instance.new("TextBox")
box.Size = UDim2.new(0.8, 0, 0, 40)
box.Position = UDim2.new(0.1, 0, 0.4, 0)
box.PlaceholderText = "DON-XXXX-XXXX..."
box.Text = ""
box.ClearTextOnFocus = false
box.Font = Enum.Font.Code
box.TextSize = 14
box.TextColor3 = Color3.fromRGB(0, 0, 0)
box.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
box.Parent = frame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = box

-- Submit Button
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.8, 0, 0, 40)
btn.Position = UDim2.new(0.1, 0, 0.7, 0)
btn.Text = "Submit"
btn.Font = Enum.Font.GothamBold
btn.TextSize = 16
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
btn.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = btn

-- Valid keys list (you can fetch it from remote or webhook)
local validKeys = {
    ["DON-K82h-n8XG-QlC5-9ZmR-hWDq"] = true,
    ["DON-X7h4-9LmW-VN5x-dE6k-PhUa"] = true
}

btn.MouseButton1Click:Connect(function()
    local input = box.Text
    if validKeys[input] then
        frame:TweenPosition(UDim2.new(0.5, -150, -1, 0), "In", "Back", 0.5, true, function()
            gui:Destroy()
        end)
        -- 🎉 Call the rest of your script here
        print("✅ Key Accepted!")
    else
        box.Text = ""
        box.PlaceholderText = "❌ Invalid Key. Try Again"
    end
end)
