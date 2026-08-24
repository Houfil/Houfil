local PlaceId = game.PlaceId
local StarterGui = game:GetService("StarterGui")

local GameList = {
    [10090256806] = "https://raw.githubusercontent.com/Houfil/Houfil/refs/heads/main/Script/ttk.lua"
}

local ScriptURL = GameList[PlaceId]

if ScriptURL then
    print("[HOUFIL] Supported game detected (ID: " .. tostring(PlaceId) .. "). Loading script...")
    
    local success, err = pcall(function()
        getgenv().HoufilLoaderActive = true
        loadstring(game:HttpGet(ScriptURL))()
    end)
    
    if not success then
        warn("[HOUFIL] Failed to load script: " .. tostring(err))
    end
else
    warn("[HOUFIL] Unsupported game! (ID: " .. tostring(PlaceId) .. ")")
    
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Houfil",
            Text = "This game (ID: " .. tostring(PlaceId) .. ") is not supported by Houfil.",
            Duration = 5
        })
    end)
end
