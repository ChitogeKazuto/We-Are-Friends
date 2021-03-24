local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local Window = DiscordLib:Window("We Are Friends - Demo")

local Universal = Window:Server("Universal", "http://www.roblox.com/asset/?id=4384400106")
local LocalPlayers = Universal:Channel("LocalPlayer")

LocalPlayers:Label("vV WalkSpeeds Vv")
local WS = LocalPlayers:Slider("Values", 0, 300, 16, function(Value)
    _G.WS = Value
end)
LocalPlayers:Toggle("Toggles WalkSpeeds",false, function(Value)
    _G.WSoc = Value
    while _G.WSoc do wait()
        if _G.WSoc then
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = _G.WS
        else
            game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
end)
LocalPlayers:Button("Change to Normal", function()
    WS:Change(16)
    DiscordLib:Notification("Notification", "WalkSpeed = 16", "Okay!")
end)    

LocalPlayers:Label("vV JumpPowers Vv")
local JP = LocalPlayers:Slider("Values", 0, 300, 50, function(Value)
    _G.JP = Value
end)
LocalPlayers:Toggle("Toggles JumpPowers",false, function(Value)
    _G.JPoc = Value
    while _G.JPoc do wait()
        if _G.JPoc then
            game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = _G.JP
        else
            game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end
end)
LocalPlayers:Button("Change to Normal", function()
    JP:Change(50)
    DiscordLib:Notification("Notification", "JumpPowers = 50", "Okay!")
end)

local PublicScript = Universal:Channel("Public Script")
PublicScript:Label("vV Universal Scripts Vv")
local InfJump
PublicScript:Toggle("Infinite Jump",false, function(Value)
    if Value == true then
        if InfJump then InfJump:Disconnect() end
            InfJump = game:GetService("UserInputService").JumpRequest:Connect(function(Jump)
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end)
    else
        if InfJump then InfJump:Disconnect() end
    end
end)
PublicScript:Button("Ctrl+Click TP", function()
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
    if not Mouse.Target then return end
        Plr.Character:MoveTo(Mouse.Hit.p)
    end)
end)
PublicScript:Label("vV Admin Scripts Vv")
PublicScript:Button("Infinite Yield", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

local Settings = Window:Server("Settings", "http://www.roblox.com/asset/?id=4483345737")
local Setting = Settings:Channel("Settings")
Setting:Label("vV Ui Settings Vv")
Setting:Toggle("Confirm Destroy Ui",false, function(Value)
    _G.ConfirmDS = Value
end)
Setting:Button("Destroy Ui", function()
    if _G.ConfirmDS == true then
        game:GetService("CoreGui").Discord:Destroy()
    else
        DiscordLib:Notification("Notification", "Ture Confirm Destroy Ui On To Destroy Ui", "Okay!")
    end
end)