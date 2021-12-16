local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("by dizy#5334")

local tab1 = w:CreateFolder("Functions")

local previous_pos = CFrame.new(0,0,0);
local tp_debounce = true;
local targets = {}

getgenv().GetCoins = false;
getgenv().RemoveLaserDoors = false;
getgenv().RemoveJumpEffect = false;
getgenv().KillAll = false;

local function get_targets()
    for _,v in pairs(game:GetService("Players"):GetChildren()) do
        if v~=nil and v.Character~=nil and v.Name~=game:GetService("Players").LocalPlayer.Name then
            if not table.find(targets,v) then
                table.insert(targets,v);
            end
        end
    end
end

get_targets();

tab1:Toggle("Kill All",function(bool)
    shared.toggle = bool;
    getgenv().KillAll = bool;
end)

tab1:Toggle("Get all Coins",function(bool)
    shared.toggle = bool;
    getgenv().GetCoins = bool;
end)

tab1:Toggle("Remove Laser Doors",function(bool)
    shared.toggle = bool;
    getgenv().RemoveLaserDoors = bool;
end)

tab1:Toggle("Remove Jump Effect",function(bool)
    shared.toggle = bool;
    getgenv().RemoveJumpEffect = bool;
end)

tab1:Button("Get all Tools",function()
    for _,plot in pairs(game:GetService("Workspace"):GetChildren()) do
        if plot:IsA("Folder") and plot ~= nil then
            if plot.Name == "Wind" or plot.Name == "Shock" or plot.Name == "Light" or plot.Name == "Gravity" or plot.Name == "Fire" or plot.Name == "Earth" then
                for _,v in pairs(plot["Objects"]:GetChildren()) do
                    if v:IsA("Model") then
                        for _,giver in pairs(v:GetChildren()) do
                            if giver:IsA("MeshPart") and giver.Name == "GiverPart" and giver:FindFirstChild("TouchInterest") then
                                wait(0.5);
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = giver.CFrame;
                            end
                        end
                    end
                end
            end
        end
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    spawn(function()
        if getgenv().GetCoins then
            for _,v in pairs(game:GetService("Workspace")["Coins"]:GetChildren()) do
                if v:FindFirstChild("Value") ~= nil then
                    tp_debounce = false;
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(v:FindFirstChild("CoinPart1").CFrame.X, v:FindFirstChild("CoinPart1").CFrame.Y, v:FindFirstChild("CoinPart1").CFrame.Z);
                end
            end
        elseif not tp_debounce then 
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true;
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = previous_pos;
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false;
            tp_debounce = true;
        elseif tp_debounce then
            previous_pos = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame;
        end
    end)

    spawn(function()
        if getgenv().RemoveLaserDoors then
            for _,plot in pairs(game:GetService("Workspace"):GetChildren()) do
                if plot:IsA("Folder") and plot ~= nil then
                    if plot.Name == "Wind" or plot.Name == "Shock" or plot.Name == "Light" or plot.Name == "Gravity" or plot.Name == "Fire" or plot.Name == "Earth" then
                        for _,door in pairs(plot:GetChildren()) do
                            if door:IsA("Model") and door.Name == "ClaimPart" then
                                if door.Owner.Value ~= game:GetService("Players").LocalPlayer.Name then
                                    door.Head.CanCollide = false;
                                    door.Head.CanTouch = false;
                                    door.Head.Transparency = 1;
                                end
                            end
                        end
                    end
                end
            end
        else
            for _,plot in pairs(game:GetService("Workspace"):GetChildren()) do
                if plot:IsA("Folder") and plot ~= nil then
                    if plot.Name == "Wind" or plot.Name == "Shock" or plot.Name == "Light" or plot.Name == "Gravity" or plot.Name == "Fire" or plot.Name == "Earth" then
                        for _,door in pairs(plot:GetChildren()) do
                            if door:IsA("Model") and door.Name == "ClaimPart" then
                                if door.Owner.Value ~= game:GetService("Players").LocalPlayer.Name then
                                    door.Head.CanCollide = false;
                                    door.Head.CanTouch = true;
                                    door.Head.Transparency = 0.2;
                                end
                            end
                        end
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().RemoveJumpEffect then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Landed then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored == true then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false;
                end
            end
        end
    end)

    spawn(function()
        if getgenv().KillAll then
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                    if targets == nil or targets == {} then get_targets() end

                    if table.find(targets, v) then
                        if v.Character ~= nil and v.Character:FindFirstChildOfClass("Humanoid") ~= nil and v.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                            for _,tool in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                                tool.Parent = game:GetService("Players").LocalPlayer.Character;
                            end

                            for _,equipped_tool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                                if equipped_tool:IsA("Tool") then
                                    equipped_tool:Activate();
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(v.Character:FindFirstChild("HumanoidRootPart").CFrame.X, v.Character:FindFirstChild("HumanoidRootPart").CFrame.Y-math.random(2,3), v.Character:FindFirstChild("HumanoidRootPart").CFrame.Z+1);
                                end
                            end

                            if v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then table.remove(targets, v); end
                        end
                    end
                end
            end
        end
    end)
end)
