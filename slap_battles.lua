repeat wait() until game.Loaded or game:IsLoaded();

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("by dizy#5334")
local w1 = library:CreateWindow("by dizy#5334")

local tab1 = w:CreateFolder("Combat")
local tab2 = w:CreateFolder("Visuals")
local tab3 = w:CreateFolder("Misc")
local tab4 = w1:CreateFolder("Abilities")
local tab5 = w1:CreateFolder("Teleports")

local LocalPlayer = game:GetService("Players").LocalPlayer;
local debounce = false;
local ragdoll_debounce = false;
local ragdoll_debounce_1 = 0;
local event_debounce = false;
local ability_debounce = false;

getgenv().InfTimestop = false;
getgenv().PickUpGifts = false;
getgenv().GiftsEsp = false;
getgenv().GColor = Color3.fromRGB(111, 255, 0);
getgenv().HandleEsp = false;
getgenv().HColor = Color3.fromRGB(0, 166, 255);
getgenv().SizeOverride = false;
getgenv().PreventRagdoll = false;
getgenv().AntiChase = false;
getgenv().SpamRadio = false;
getgenv().HideVisuals = false;
getgenv().KillAura = false;
getgenv().KADelay = 0;
getgenv().AntiTimestop = false;
getgenv().AdminNotifier = false;
getgenv().ShowInvisPlrs = false;
getgenv().GoldenGodmode = false;
getgenv().RainbowCharacter = false;
getgenv().RGBDelay = 0;
getgenv().SpamBricks = false;

tab1:Toggle("Killaura",function(bool)
    shared.toggle = bool;
    getgenv().KillAura = bool;
end)

tab1:Slider("Hit Delay",{
    min = 0.05;
    max = 5;
    precise = true;
},function(value)
    getgenv().KADelay = value;
end)

tab1:Toggle("Anti Ragdoll",function(bool)
    shared.toggle = bool;
    getgenv().PreventRagdoll = bool;
end)

tab1:Toggle("Anti Chase",function(bool)
    shared.toggle = bool;
    getgenv().AntiChase = bool;
end)

tab1:Toggle("Anti Timestop",function(bool)
    shared.toggle = bool;
    getgenv().AntiTimestop = bool;
end)

tab1:Toggle("Glove Reach",function(bool)
    shared.toggle = bool;
    getgenv().SizeOverride = bool;
end)

tab2:Toggle("Gifts ESP",function(bool)
    shared.toggle = bool;
    getgenv().GiftsEsp = bool;
end)

tab2:ColorPicker("Gift Color",getgenv().GColor,function(color) --Default color
    getgenv().GColor = color;
end)

tab2:Toggle("Reach ESP",function(bool)
    shared.toggle = bool;
    getgenv().HandleEsp = bool;
end)

tab2:ColorPicker("Reach Color",getgenv().HColor,function(color) --Default color
    getgenv().HColor = color;
end)

tab2:Toggle("Hide Visuals",function(bool)
    shared.toggle = bool;
    getgenv().HideVisuals = bool;
end)

tab2:Toggle("Show Invisible Players",function(bool)
    shared.toggle = bool;
    getgenv().ShowInvisPlrs = bool;
end)

tab2:Toggle("Admin Notifier",function(bool)
    shared.toggle = bool;
    getgenv().AdminNotifier = bool;
end)

tab3:Toggle("Pick Up Gifts",function(bool)
    shared.toggle = bool;
    getgenv().PickUpGifts = bool;
end)

tab3:Toggle("Spam Radio",function(bool)
    shared.toggle = bool;
    getgenv().SpamRadio = bool;
end)

tab4:Toggle("Golden Godmode",function(bool)
    shared.toggle = bool;
    getgenv().GoldenGodmode = bool;
end)

tab4:Toggle("Reverse Godmode",function(bool)
    shared.toggle = bool;
    getgenv().ReverseGloveGodmode = bool;
end)

tab4:Toggle("Rainbow Character",function(bool)
    shared.toggle = bool;
    getgenv().RainbowCharacter = bool;
end)

tab4:Slider("Delay",{
    min = 0;
    max = 1.5;
    precise = true;
},function(value)
    getgenv().RGBDelay = value;
end)

tab4:Toggle("Loop Timestop",function(bool)
    shared.toggle = bool;
    getgenv().InfTimestop = bool;
end)

tab4:Toggle("Spam Farts",function(bool)
    shared.toggle = bool;
    getgenv().SpamFarts = bool;
end)

tab4:Toggle("Spam Bricks",function(bool)
    shared.toggle = bool;
    getgenv().SpamBricks = bool;
end)

tab4:Bind("Force Ability",Enum.KeyCode.X,function()
    if LocalPlayer.Character:FindFirstChild("God's Hand") ~= nil then
        game:GetService("ReplicatedStorage").TimestopJump:FireServer();
        game:GetService("ReplicatedStorage").Timestopchoir:FireServer();
        game:GetService("ReplicatedStorage").Timestop:FireServer();
    elseif tostring(LocalPlayer["leaderstats"]["Glove"].Value) == "Ghost" then
        game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
    elseif LocalPlayer.Character:FindFirstChild("Mail") ~= nil and ability_debounce == false then
        game:GetService("ReplicatedStorage").MailSend:FireServer();

        ability_debounce = true;
        delay(5, function()
            ability_debounce = false;
        end)
    elseif LocalPlayer.Character:FindFirstChild("Stun") ~= nil then
        game:GetService("ReplicatedStorage").StunR:FireServer(game:GetService("Workspace")[LocalPlayer.Name]:FindFirstChild("Stun"));
    elseif tostring(LocalPlayer["leaderstats"]["Glove"].Value) == "Swapper" and ability_debounce == false then
        game:GetService("ReplicatedStorage").SLOC:FireServer();

        ability_debounce = true;
        delay(6, function()
            ability_debounce = false;
        end)
    end
end)

tab4:Label("Available Abilities:", {
    TextSize = 20;
    TextColor = Color3.fromRGB(210,210,210);
    BgColor = Color3.fromRGB(40,40,40);
})

tab4:Label("Timestop (no delay)", {
    TextSize = 18;
    TextColor = Color3.fromRGB(210,210,210);
    BgColor = Color3.fromRGB(40,40,40);
})

tab4:Label("Invisibility (no delay)", {
    TextSize = 18;
    TextColor = Color3.fromRGB(210,210,210);
    BgColor = Color3.fromRGB(40,40,40);
})

tab4:Label("Mail (5 secs delay)", {
    TextSize = 18;
    TextColor = Color3.fromRGB(210,210,210);
    BgColor = Color3.fromRGB(40,40,40);
})

tab4:Label("Swap (6 secs delay)", {
    TextSize = 18;
    TextColor = Color3.fromRGB(210,210,210);
    BgColor = Color3.fromRGB(40,40,40);
})

tab3:Button("Get 250 Kills",function()
    for i=1,250 do
        game:GetService("ReplicatedStorage").KillsUpdated:FireServer(i, game:GetService("Workspace")[LocalPlayer.Name].Killstreak);
    end
end)

tab3:Button("Duck Badge",function()
    fireclickdetector(game:GetService("Workspace")["Arena"]["default island"]["Rubber Ducky"].ClickDetector);
end)

tab3:Button("Court Evidence Badge", function()
    fireclickdetector(game:GetService("Workspace")["Lobby"]["Scene"]["knofe"].ClickDetector);
end)

tab3:Button("Brazil Badge", function()
    firetouchinterest(game:GetService("Workspace")["Lobby"]["brazil"]["portal"]);
end)

tab3:Button("Error Glove Badge", function()
    fireclickdetector(game:GetService("Workspace")["Lobby"]["Error"].ClickDetector);
end)

tab5:Button("TP to Arena", function()
    LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(38, 0, 60);
end)

tab5:Button("TP to Lobby", function()
    LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(-339.448792, 324.929474, -1.96081245);
end)

spawn(function()
    while wait(0.75) do
        pcall(function()
            if getgenv().ReverseGloveGodmode then
                if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character.isInArena ~= nil and LocalPlayer.Character.isInArena.Value == true then
                    if LocalPlayer.Character:FindFirstChild("Left Arm"):FindFirstChildOfClass("SelectionBox") == nil or LocalPlayer.Character:FindFirstChild("Right Arm"):FindFirstChildOfClass("SelectionBox") == nil or LocalPlayer.Character:FindFirstChild("Left Leg"):FindFirstChildOfClass("SelectionBox") == nil or LocalPlayer.Character:FindFirstChild("Right Leg"):FindFirstChildOfClass("SelectionBox") == nil then
                        game:GetService("ReplicatedStorage").ReverseAbility:FireServer();
                    elseif LocalPlayer.Character:FindFirstChild("Reversed") ~= nil and LocalPlayer.Character:FindFirstChild("Reversed").Value == true then
                        return;
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait(getgenv().RGBDelay) do
        pcall(function()
            if getgenv().RainbowCharacter then
                if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("isInArena") ~= nil and LocalPlayer.Character:FindFirstChild("isInArena").Value == true then
                    game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.random());
                end
            end
        end)
    end
end)

spawn(function()
    while wait(4) do
        pcall(function()
            if getgenv().SpamBricks then
                if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("isInArena") ~= nil and LocalPlayer.Character:FindFirstChild("isInArena").Value == true then
                    game:GetService("ReplicatedStorage").lbrick:FireServer()
                end
            end
        end)
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    spawn(function()
        if getgenv().InfTimestop then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                if LocalPlayer.Character.isInArena.Value == true and game:GetService("Workspace"):FindFirstChild("universaltimestop") == nil then
                    game:GetService("ReplicatedStorage").TimestopJump:FireServer();
                    game:GetService("ReplicatedStorage").Timestopchoir:FireServer();
                    game:GetService("ReplicatedStorage").Timestop:FireServer();
                end
            end
        end
    end)

    spawn(function()
        if getgenv().GoldenGodmode then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:WaitForChild("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("isInArena") ~= nil and LocalPlayer.Character:FindFirstChild("isInArena").Value == true then
                for _,v in pairs(LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Part") then
                        if v.Color ~= Color3.fromRGB(255,255,0) then
                            game:GetService("ReplicatedStorage").Goldify:FireServer(true);
                        end
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().SpamFarts then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                game:GetService("ReplicatedStorage").Fart:FireServer();
            end
        end
    end)

    spawn(function()
        if getgenv().HandleEsp then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:WaitForChild("Torso").Transparency == 0 then
                for _,v in pairs(LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "Radio" then
                        if v:FindFirstChild("Glove") ~= nil then
                            if not v:FindFirstChildOfClass("BoxHandleAdornment") then
                                local box = Instance.new("BoxHandleAdornment", v);
                                box.Adornee = v:FindFirstChild("Glove");
                                box.Size = v:FindFirstChild("Glove").Size;
                                box.AlwaysOnTop = true;
                                box.Transparency = 0.7;
                                box.Color3 = getgenv().HColor;
                            elseif v:FindFirstChildOfClass("BoxHandleAdornment") ~= nil then
                                if v:FindFirstChildOfClass("BoxHandleAdornment").Size ~= v:FindFirstChild("Glove").Size then
                                    v:FindFirstChildOfClass("BoxHandleAdornment"):Destroy();
                                end
                            end
                        end
                    end
                end
            end
        elseif not getgenv().HandleEsp then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:WaitForChild("Torso").Transparency == 0 then
                for _,v in pairs(LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "Radio" then
                        if v:FindFirstChild("Glove") ~= nil then
                            if v:FindFirstChildOfClass("BoxHandleAdornment") ~= nil then
                                v:FindFirstChildOfClass("BoxHandleAdornment"):Destroy();
                            end
                        end
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().SizeOverride then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:WaitForChild("Torso").Transparency == 0 then
                for _,v in pairs(LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "Radio" then
                        if v:FindFirstChild("Glove") ~= nil then
                            if v:FindFirstChild("Glove"):FindFirstChildOfClass("Texture") then v:FindFirstChild("Glove"):FindFirstChildOfClass("Texture"):Destroy() end
                            v:FindFirstChild("Glove").Size = Vector3.new(50.5, 30.5, 30.7);
                            v:FindFirstChild("Glove").Transparency = 1;
                        end
                    end
                end
            end
        end
    end)

    pcall(function()
        if getgenv().PreventRagdoll then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:WaitForChild("Torso").Transparency == 0 then
                if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand == true then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false; end
                if LocalPlayer.Character:WaitForChild("Ragdolled") ~= nil then
                    if LocalPlayer.Character:WaitForChild("Ragdolled").Value == false then hum_cframe = LocalPlayer.Character:FindFirstChild("Torso").CFrame; end
                    if ragdoll_debounce == true then if ragdoll_debounce_1 < 6 then LocalPlayer.Character:FindFirstChild("Torso").CFrame = hum_cframe; ragdoll_debounce = false; elseif ragdoll_debounce_1 == 6 then ragdoll_debounce_1 = 0; ragdoll_debounce = false; end end
                    if LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false;
                        LocalPlayer.Character:FindFirstChild("Head").Anchored = true;
                        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true;
                        LocalPlayer.Character:FindFirstChild("Torso").Anchored = true;
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Landed);
                        --LocalPlayer.Character:FindFirstChild("Torso").CFrame = hum_cframe;
                        ragdoll_debounce = true;
                        for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                            if v.Name == "Head" or v.Name == "Torso" or v.Name == "Left Arm" or v.Name == "Right Arm" or v.Name == "Left Leg" or v.Name == "Right Leg" or v.Name == "HumanoidRootPart" or v.Name == "Torso" then
                                for _,r in pairs(v:GetChildren()) do
                                    if r:IsA("BallSocketConstrait") or r:IsA("BodyVelocity") or r:IsA("BodyAngularVelocity") then
                                        r:Destroy();
                                    elseif r:IsA("Attachment") then
                                        if r.Name == "a0" or r.Name == "a1" or r.Name == "torsoweld" or r.Name == "x1" then
                                            r:Destroy();
                                        end
                                    end
                                end
                            elseif string.sub(v.Name, 0, 8) == "FakePart" then
                                v.Anchored = true;
                                v.CanCollide = false;
                            elseif v.Name == "Icecube" then
                                LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false;
                                v:Destroy();
                            end
                        end
                    elseif LocalPlayer.Character:WaitForChild("Ragdolled").Value == false then
                        LocalPlayer.Character:FindFirstChild("Head").Anchored = false;
                        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false;
                        LocalPlayer.Character:FindFirstChild("Torso").Anchored = false;
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().SpamRadio then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:WaitForChild("Torso").Transparency == 0 then
                if LocalPlayer.Backpack:FindFirstChild("Radio") ~= nil then
                    LocalPlayer.Backpack:FindFirstChild("Radio")["Handle"]["Sound"]["ID"].Value = 5361902748;
                    LocalPlayer.Backpack:FindFirstChild("Radio").Parent = LocalPlayer.Character;
                elseif LocalPlayer.Character:FindFirstChild("Radio") ~= nil then
                    LocalPlayer.Character:FindFirstChild("Radio")["Handle"]["Sound"]["ID"].Value = 5361902748;
                    LocalPlayer.Character:FindFirstChild("Radio"):Activate();
                    LocalPlayer.Character:FindFirstChild("Radio").Parent = LocalPlayer.Backpack;
                end
            end
        end
    end)

    spawn(function()
        if getgenv().AntiChase then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:WaitForChild("Torso").Transparency == 0 then
                if LocalPlayer.Character:FindFirstChild("CHASED") or LocalPlayer.Character:FindFirstChild("CHASE")  then
                    for _,v in pairs(LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Part") or v:IsA("MeshPart") then
                            v.Anchored = false;
                        elseif v:IsA("BoolValue") and v.Name == "Ragdolled" then
                            v.Value = false;
                        end
                    end
                end
            end
        end
    end)

    pcall(function()
        if getgenv().AntiTimestop then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character:WaitForChild("Torso").Transparency == 0 then
                if game:GetService("Workspace"):FindFirstChild("universaltimestop") ~= nil then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false;
                    LocalPlayer.Character:FindFirstChild("TSVulnerability").Value = false;
                    for _,v in pairs(LocalPlayer.Character:GetChildren()) do
                        if v:IsA("MeshPart") or v:IsA("Part") then
                            v.Anchored = false;
                        end
                    end
                elseif not game:GetService("Workspace"):FindFirstChild("universaltimestop") then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false;
                    LocalPlayer.Character:FindFirstChild("TSVulnerability").Value = true;
                end
            end
        end
    end)

    pcall(function()
        if getgenv().HideVisuals then
            if game:GetService("Lighting"):FindFirstChildOfClass("ColorCorrectionEffect") then
                game:GetService("Lighting"):FindFirstChildOfClass("ColorCorrectionEffect"):Destroy();
            end
               
            for _,v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                if v.Name == "VineThudImageScreenGUI" or v.Name == "MailPopup" or v.Name == "MittenBlind" then 
                    v:Destroy();
                end
            end

            for _,p in pairs(game:GetService("Workspace"):GetChildren()) do
                if p.Name == "wall" or p.Name == "BusModel" or p.Name == "Union" then
                    p.CanCollide = false;
                    p.CanTouch = false;
                    p.Transparency = 0.8;
                elseif p.Name == "Turret" then
                    p:FindFirstChild("HingePart"):FindFirstChild("Glove").CanTouch = false;
                    p:FindFirstChild("HingePart"):FindFirstChild("Glove").CanCollide = false;
                    p:FindFirstChild("HingePart"):FindFirstChild("Glove").Transparency = 0.5;
                end
            end
                    
            for _,v in pairs(game:GetService("Players"):GetChildren()) do
                if v.Character:FindFirstChild("rock") ~= nil then
                    v.Character:FindFirstChild("rock").CanTouch = false;
                    v.Character:FindFirstChild("rock").CanCollide = false;
                end
            end
            
            for _,b in pairs(game:GetService("Workspace"):GetChildren()) do
                if b:IsA("Part") and b:FindFirstChild("SelectionBox") ~= nil and b:FindFirstChild("Sound") ~= nil and b:FindFirstChild("SelectionBox").Color == Color3.fromRGB(84, 255, 255) then
                    b.CanCollide = false;
                end
            end
        end
    end)

    pcall(function()
        if getgenv().KillAura then
            for _,v in pairs(game:GetService("Players"):GetChildren()) do
                if v.Name ~= LocalPlayer.Name then
                    if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and not debounce then 
                        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character:FindFirstChild("rock") == nil and v.Character:FindFirstChild("isInArena") ~= nil and v.Character:FindFirstChild("isInArena").Value == true then
                            if v.Character:FindFirstChild("BlockedV") ~= nil then if v.Character:FindFirstChild("BlockedV").Value == game:GetService("Players").LocalPlayer.Name then return; end end
                            if (LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position-v.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 30 then
                                for _,glove in pairs(LocalPlayer.Character:GetChildren()) do
                                    if glove:IsA("Tool") and glove.Name ~= "Radio" and glove.Name ~= "Spectator" then
                                        glove:Activate();

                                        if glove.Name == "Default" then
                                            glove:FindFirstChild("Glove").Size = Vector3.new(50.5, 30.5, 30.7);
                                        elseif glove.Name == "Diamond" or glove.Name == "MEGAROCK" then
                                            game:GetService("ReplicatedStorage").DiamondHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Extended" then
                                            glove:FindFirstChild("Glove").Size = Vector3.new(50.5, 30.5, 30.7);
                                        elseif glove.Name == "Brick" then
                                            game:GetService("ReplicatedStorage").BrickHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Snow" then
                                            game:GetService("ReplicatedStorage").SnowHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Flash" then
                                            game:GetService("ReplicatedStorage").FlashHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Swapper" then
                                            glove:FindFirstChild("Glove").Size = Vector3.new(50.5, 30.5, 30.7);
                                        elseif glove.Name == "Bull" then
                                            game:GetService("ReplicatedStorage").BullHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Dice" then
                                            game:GetService("ReplicatedStorage").DiceHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Ghost" then
                                            game:GetService("ReplicatedStorage").GhostHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Thanos" then
                                            game:GetService("ReplicatedStorage").ThanosHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Stun" then
                                            game:GetService("ReplicatedStorage").HtStun:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "「ZA HANDO」" then
                                            glove:FindFirstChild("Glove").Size = Vector3.new(50.5, 30.5, 30.7);
                                        elseif glove.Name == "Pusher" then
                                            game:GetService("ReplicatedStorage").PusherHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Space" then
                                            game:GetService("ReplicatedStorage").HtSpace:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Dream" then
                                            game:GetService("ReplicatedStorage").Dreamhit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Mail" then
                                            game:GetService("ReplicatedStorage").MailHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Golden" then
                                            game:GetService("ReplicatedStorage").GoldenHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Cheeky" then
                                            game:GetService("ReplicatedStorage").CheekyHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Reaper" then
                                            game:GetService("ReplicatedStorage").ReaperHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Replica" then
                                            game:GetService("ReplicatedStorage").ReplicaHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Defense" then
                                            game:GetService("ReplicatedStorage").DefenseHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Killstreak" then
                                            glove:FindFirstChild("Glove").Size = Vector3.new(50.5, 30.5, 30.7);
                                        elseif glove.Name == "Reverse" then
                                            game:GetService("ReplicatedStorage").ReverseHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Shukuchi" then
                                            game:GetService("ReplicatedStorage").ShukuchiHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Duelist" then
                                            game:GetService("ReplicatedStorage").DuelistHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "woah" then
                                            game:GetService("ReplicatedStorage").woahHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Ice" then
                                            game:GetService("ReplicatedStorage").IceHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Adios" then
                                            game:GetService("ReplicatedStorage").hitAdios:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "OVERKILL" then
                                            game:GetService("ReplicatedStorage").Overkillhit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Acrobat" then
                                            game:GetService("ReplicatedStorage").AcHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Plague" then
                                            game:GetService("ReplicatedStorage").PlagueHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Hallow Jack" then
                                            game:GetService("ReplicatedStorage").HallowHIT:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "[REDACTED]" then
                                            game:GetService("ReplicatedStorage").ReHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "bus" then
                                            game:GetService("ReplicatedStorage").hitbus:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Error" then
                                            game:GetService("ReplicatedStorage").Errorhit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Pull" then
                                            game:GetService("ReplicatedStorage").PullHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Phase" then
                                            game:GetService("ReplicatedStorage").PhaseH:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Blocked" then
                                            game:GetService("ReplicatedStorage").BlockedHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Engineer" then
                                            game:GetService("ReplicatedStorage").engiehit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "God's Hand" then
                                            glove:FindFirstChild("Glove").Size = Vector3.new(50.5, 30.5, 30.7);
                                        elseif glove.Name == "The Flex" then
                                            game:GetService("ReplicatedStorage").FlexHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        elseif glove.Name == "Mitten" then
                                            game:GetService("ReplicatedStorage").MittenHit:FireServer(game:GetService("Workspace")[v.Name]["Right Arm"]);
                                        end
                                    end
                                end
                                debounce = true;
                                delay(getgenv().KADelay, function()
                                    debounce = false;
                                end)
                            end
                        end
                    end
                end
            end
        else
            if debounce then debounce = false; end
        end
    end)

    pcall(function()
        if getgenv().PickUpGifts then
            if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil and LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and LocalPlayer.Character.isInArena ~= nil and LocalPlayer.Character.isInArena.Value == true then
                for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "Gift" and v.Transparency == 0 then
                        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame;
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().GiftsEsp then
            if LocalPlayer.Character ~= nil then
                for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "Gift" and v:FindFirstChildOfClass("BoxHandleAdornment") == nil then
                        local box = Instance.new("BoxHandleAdornment", v);
                        box.Adornee = v;
                        box.Size = v.Size;
                        box.AlwaysOnTop = true;
                        box.Transparency = 0.6;
                        box.Color3 = getgenv().GColor;
                    end
                end
            end
        end
    end)
        
    pcall(function()
        if getgenv().AdminNotifier then
            if game:GetService("Players"):FindFirstChild("PimGameFreak") or game:GetService("Players"):FindFirstChild("buffwagon") or game:GetService("Players"):FindFirstChild("Astronaxtic") or game:GetService("Players"):FindFirstChild("Villadyne") or game:GetService("Players"):FindFirstChild("undeadtaIIie") or game:GetService("Players"):FindFirstChild("L3fr3akyy") or game:GetService("Players"):FindFirstChild("moignon06") or game:GetService("Players"):FindFirstChild("Aleph_Zero1") or game:GetService("Players"):FindFirstChild("Adam_DK") then
                LocalPlayer:Kick(" \n[dizy's script] \nAdmin joined! Join on other server. ")
            end
        end
    end)

    spawn(function()
        if getgenv().ShowInvisPlrs then
            for _,v in pairs(game:GetService("Players"):GetChildren()) do
                if v.Name ~= LocalPlayer.Name and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health > 0 then
                    if v.Character:FindFirstChild("Torso").Transparency == 1 then
                        for _,x in pairs(v.Character:GetChildren()) do
                            if x:IsA("Part") and x.Transparency == 1 and x.Name ~= "HumanoidRootPart" then
                                x.Transparency = 0.4;
                                x.CanCollide = true;
                            end
                        end
                    end
                end
            end
        end
    end)
end)
