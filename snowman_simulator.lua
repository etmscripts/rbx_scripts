local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("by dizy#5334")

local tab1 = w:CreateFolder("Farming")
local tab2 = w:CreateFolder("Misc")

--variables
getgenv().AutoRebirth = false;
getgenv().AutoAddToSnowman = false;
getgenv().KillMinions = false;
getgenv().FarmSnow = false;
getgenv().OpenGifts = false;
getgenv().PickCandies = false;
getgenv().PreventLags = false;

tab1:Toggle("Auto Rebirth", function(bool)
    shared.toggle = bool
    getgenv().AutoRebirth = bool;
end)

tab1:Toggle("Auto Add To Snowman", function(bool)
    shared.toggle = bool
    getgenv().AutoAddToSnowman = bool;
end)

tab1:Toggle("Kill Minions", function(bool)
    shared.toggle = bool
    getgenv().KillMinions = bool;
end)

tab1:Toggle("Farm Snow", function(bool)
    shared.toggle = bool
    getgenv().FarmSnow = bool;
end)

tab1:Toggle("Open Gifts", function(bool)
    shared.toggle = bool
    getgenv().OpenGifts = bool;
end)

tab1:Toggle("Pick Candies", function(bool)
    shared.toggle = bool
    getgenv().PickCandies = bool;
end)

tab2:Toggle("Prevent Lags", function(bool)
    shared.toggle = bool
    getgenv().PreventLags = bool;
end)

spawn(function()
    for i=1, math.huge do
        wait(0.01)
        if getgenv().PickCandies then
            for _,v in pairs(game:GetService("Workspace")["gameCandyCanes"]:GetChildren()) do
                if v:IsA("Model") and v~=nil then
                    if v:FindFirstChild("cane")~=nil then
                        local tween = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {CFrame = v:FindFirstChild("cane").CFrame});
                        tween:Play();
                        tween.Completed:Wait(X);
                    end
                end
            end             
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    spawn(function()
        if getgenv().AutoRebirth then
            for _,plot in pairs(game:GetService("Workspace")["snowmanBases"]:GetChildren()) do
                if plot:IsA("Model") then
                    if plot:FindFirstChild("player").Value == game:GetService("Players").LocalPlayer then
                        if plot:FindFirstChild("progressPosition")["progressBar"]["background"]["bar"]["text"].Text == "MAX" then
                            fireproximityprompt(plot:FindFirstChild("rebirthControl"):FindFirstChild("BUTTON"):FindFirstChildOfClass("ProximityPrompt"), math.huge);
                        end
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().AutoAddToSnowman then
            print(game:GetService("Players").LocalPlayer["localData"].snowballs.Value)
            if game:GetService("Players").LocalPlayer["localData"].snowballs.Value == game:GetService("Players").LocalPlayer["localData"].sackStorage.Value then
                game:GetService("ReplicatedStorage")['ThisGame']['Calls'].snowballController:FireServer("addToSnowman");
            end
        end
    end)

    spawn(function()
        if getgenv().KillMinions then
            for _,v in pairs(game:GetService("Workspace")["minionSpawns"]:GetChildren()) do
                if v:IsA("Part") then
                    local A_1 = v:FindFirstChild("minionHolder"):FindFirstChildOfClass("Model");
                    game:GetService("ReplicatedStorage")["ThisGame"]["Calls"].minionHelper:FireServer("minionHit", A_1);
                end
            end
        end
    end)

    spawn(function()
        if getgenv().FarmSnow then
            for _,plot in pairs(game:GetService("Workspace")["snowmanBases"]:GetChildren()) do
                if plot:IsA("Model") then
                    if plot:FindFirstChild("player").Value == game:GetService("Players").LocalPlayer then
                        if (plot:FindFirstChild("root").Position-game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > 5 then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x52')
                            game:GetService('VirtualUser'):SetKeyUp('0x52')

                            game:GetService("ReplicatedStorage")['ThisGame']['Calls'].snowballController:FireServer("startRoll");
                            game:GetService("ReplicatedStorage")["ThisGame"]["Calls"].collectSnow:FireServer();
                        end
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().OpenGifts then
            for _,v in pairs(game:GetService("Workspace")["giftSpawns"]:GetChildren()) do
                if v:IsA("Model") then
                    if v:FindFirstChild("hitbox")~=nil then
                        fireproximityprompt(v:FindFirstChild("hitbox")["proxGui"]:FindFirstChildOfClass("ProximityPrompt"), math.huge);
                        repeat wait() until v:FindFirstChild("hitbox") == nil;
                    end
                end
            end            
        end
    end)

    spawn(function()
        if getgenv().PreventLags then
            for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if v:IsA("MeshPart") then
                    for _,effect in pairs(v:GetChildren()) do
                        if effect:IsA("ParticleEmitter") or effect:IsA("Trail") then
                            effect.Enabled = false;
                        end
                    end
                end
            end

            for _,x in pairs(game:GetService("Workspace")["gameCandyCanes"]:GetChildren()) do
                if x:IsA("Model") then
                    for _,t in pairs(x:FindFirstChildOfClass("MeshPart"):GetChildren()) do
                        if t:IsA("ParticleEmitter") then
                            t:Destroy();
                        end
                    end
                end
            end

            for _,n in pairs(game:GetService("Workspace")["giftSpawns"]:GetChildren()) do
                if n:IsA("Model") then
                    for _,c in pairs(n:FindFirstChild("base"):FindFirstChildOfClass("Part"):GetChildren()) do
                        if c:IsA("ParticleEmitter") then
                            c:Destroy();
                        end
                    end
                end
            end
        end
    end)
end)
