local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Maxgat5/UiLib/main/lua')))()
local w = library:CreateWindow("by dizy#5334")

local tab1 = w:CreateFolder("Functions")

getgenv().AutoFarm = false;
local debounce = true;

tab1:Toggle("Auto Farm Rebirths", function(bool)
    shared.toggle = bool;
    getgenv().AutoFarm = bool;
end)

tab1:Button("Complete Obby", function()
    for i = 1, 150 do
        wait(0.15)
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Workspace")["Stages"]:FindFirstChild(i).CFrame;
        
        if i == 150 then
            print("FINISHED OBBY");
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:IsA("Model") then
                    if v:FindFirstChild("Part") ~= nil then
                        if v:FindFirstChild("Part")["RebirthClicker"] ~= nil then
                            fireclickdetector(v:FindFirstChild("Part")["RebirthClicker"].Clicker);
                        end
                    end
                end
            end
        end
    end
end)

tab1:Button("Get Inf Coins", function()
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", -math.huge, "Galaxy");
end)

tab1:Button("Get All Trails", function()
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Red");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Blue");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Green");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Pink");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Turquoise");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Orange");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Purple");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Pastel Blue");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Reddy Pink");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Pastel Green");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "Dark Gray");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingTrail", 0, "White");
end)

tab1:Button("Get All Skins", function()
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Galaxy");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Golden");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Ping Stripe");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Checkered");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Silver");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Red and Pink Stripes");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Red Sparkle Time");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Glass");
    game:GetService("ReplicatedStorage")["Remotes"].MainFunction:InvokeServer("PlayerRequestingData");
    game:GetService("ReplicatedStorage")["Remotes"].MainRemote:FireServer("PlayerBuyingSkin", 0, "Grass");
end)

game:GetService("RunService").Heartbeat:Connect(function()
    spawn(function()
        if getgenv().AutoFarm then
            if debounce == false then
                return;
            elseif debounce == true then
                debounce = false;
                for i = 1, 150 do
                    wait(0.15)
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Workspace")["Stages"]:FindFirstChild(i).CFrame;
                    print("Teleported to ["..tostring(i).."] Stage");
                    if i == 150 then
                        warn("[script] Finished Obby, waiting for a rebirth...");
                        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                            if v:IsA("Model") then
                                if v:FindFirstChild("Part") ~= nil then
                                    if v:FindFirstChild("Part")["RebirthClicker"] ~= nil then
                                        delay(2, function()
                                            fireclickdetector(v:FindFirstChild("Part")["RebirthClicker"].Clicker);
                                            fireclickdetector(v:FindFirstChild("Part")["RebirthClicker"].Clicker);
                                            fireclickdetector(v:FindFirstChild("Part")["RebirthClicker"].Clicker);
                                            print("[script] Fired Click Detector.");
                                        end)

                                        delay(3.5, function()
                                            debounce = true;
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            debounce = true;
        end
    end)
end)