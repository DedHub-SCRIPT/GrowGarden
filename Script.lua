-- script.lua

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- UI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeyMenu"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🔑 Enter Script Key"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.BackgroundTransparency = 1

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.8, 0, 0, 40)
box.Position = UDim2.new(0.1, 0, 0.4, 0)
box.PlaceholderText = "DON-XXXX-XXXX..."
box.Text = ""
box.ClearTextOnFocus = true
box.Font = Enum.Font.Code
box.TextSize = 14
box.TextColor3 = Color3.new(0, 0, 0)
box.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0.8, 0, 0, 40)
btn.Position = UDim2.new(0.1, 0, 0.7, 0)
btn.Text = "Submit"
btn.Font = Enum.Font.GothamBold
btn.TextSize = 16
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

-- Проверка ключа
btn.MouseButton1Click:Connect(function()
	local userKey = box.Text
	if userKey == "" then
		box.PlaceholderText = "❗ Please enter your key"
		return
	end

	local success, data = pcall(function()
		return HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/DedHub-SCRIPT/GrowGarden/main/keys.json"))
	end)

	if success and data[userKey] then
		print("✅ Key is valid!")
		gui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DedHub-SCRIPT/GrowGarden/main/main.lua", true))()
	else
		box.Text = ""
		box.PlaceholderText = "❌ Invalid key. Try again"
	end
end)
