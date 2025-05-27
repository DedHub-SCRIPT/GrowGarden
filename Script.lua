-- script.lua

local HttpService = game:GetService("HttpService")

local key = "REPLACE_KEY_HERE" -- Discord бот подставит сюда актуальный ключ

local function getKeys()
    local success, result = pcall(function()
        return HttpService:JSONDecode(
            game:HttpGet("https://raw.githubusercontent.com/YourUser/YourRepo/main/keys.json")
        )
    end)
    if success then
        return result
    else
        warn("❌ Failed to fetch keys.json")
        return {}
    end
end

local validKeys = getKeys()

if validKeys[key] then
    print("✅ Valid key!")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/YourRepo/main/main.lua", true))()
else
    warn("❌ Invalid or expired key.")
end
