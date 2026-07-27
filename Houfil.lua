local HttpGet = game.HttpGet
local GameId: number = game.GameId

local Games: {[number]: string} = loadstring(
  HttpGet(game, "https://raw.githubusercontent.com/TonPseudo/Houfil-Hub/main/GameList.lua")
)() :: any

local URL: string? = Games[GameId]
if not URL then 
    warn("❌ Houfil Hub: Ce jeu n'est pas encore supporté ! (GameId: " .. tostring(GameId) .. ")")
    return 
end

loadstring(HttpGet(game, URL))()
