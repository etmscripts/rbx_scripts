local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("by dizy#5334")

local tab1 = w:CreateFolder("Farming")
local tab2 = w:CreateFolder("Buybot")
local tab3 = w:CreateFolder("Misc")

local LocalPlayer = game:GetService'Players'.LocalPlayer;

--variables
getgenv().autoupgrade = false;
getgenv().pick_drops = false;
getgenv().utobuy_crate = false;
getgenv().autoclicker = false;
getgenv().warn_debounce = false;
getgenv().pick_snowmens = false;
getgenv().pick_presents = false;

--tables
local codes = {
    "blackiron",
    "20klikes"
}
local crates = {}
local crates_values = {
    ["Starter"] = 1350,
    ["Noobie"] = 5500,
    ["Stepping"] = 11500,
    ["Learning"] = 17500,
    ["Funding"] = 25000,
    ["Business"] = 33500,
    ["Legendary"] = 62500,
    ["Marcellus"] = 95000,
    ["Famous"] = 155000,
    ["Mythic"] = 275000,
    ["Eirene"] = 550000,
    ["Aeschylus"] = 950000,
    ["Olysseus"] = 1500000
}
local selected_crate = "";

--collecting data
for _,v in pairs(LocalPlayer.PlayerGui['Gui']['Frames']['Cases']['Standard']:GetChildren()) do
    if v:IsA("Frame") then
        if v.Name ~= "Noobish" or v.Name ~= "Rares" or v.Name ~= "Big Bux" or v.Name ~= "Prosperous" or v.Name ~= "Extravagant" then
            if not table.find(crates, v) then
                table.insert(crates, v);
            end
        end
    end
end

tab1:Toggle("Auto Click", function(bool)
    shared.toggle = bool
    getgenv().autoclicker = bool;
end)

tab1:Toggle("Pick Supply Drops", function(bool)
    shared.toggle = bool
    getgenv().pick_drops = bool;
end)

tab1:Toggle("Pick Presents", function(bool)
    shared.toggle = bool
    getgenv().pick_presents = bool;
end)

tab1:Toggle("Pick Snowmens", function(bool)
    shared.toggle = bool
    getgenv().pick_snowmens = bool;
end)

tab2:Toggle("Buy Click's Upgrade", function(bool)
    shared.toggle = bool
    getgenv().autoupgrade = bool;
end)

tab2:Toggle("Buy Crate", function(bool)
    shared.toggle = bool
    getgenv().autobuy_crate = bool;
end)

tab2:Dropdown("select crate..", crates, true, function(crate)
    selected_crate = crate;
end)

tab3:Button("Redeem All Codes", function()
    for i,v in codes do
        game:GetService("ReplicatedStorage")['Events'].StoreActions:InvokeServer("Code", v)
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    spawn(function()
        if getgenv().autoclicker then
            for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                for i,v in pairs(getconnections(LocalPlayer.PlayerGui['Gui']['Hotbar']['Container']['ClickerButton'].Button[v])) do
                    delay(0.2, function()
                        v:Fire()
                    end)
                end
            end
        end
    end)

    spawn(function()
        if getgenv().autobuy_crate and selected_crate ~= nil and selected_crate ~= "" then
            game:GetService("ReplicatedStorage").Events.OpenCase:InvokeServer(tostring(selected_crate))
        end
    end)

    spawn(function()
        if getgenv().autoupgrade then
            local cost = string.sub(string.gsub(string.sub(tostring(game:GetService("Players").LocalPlayer.PlayerGui['Gui']['Frames']['Store']['Frames']['SubUpgrades']['Holder']['Clicks'].UpgradeName.Text), 53), "</font>", ""), 1, string.len(string.gsub(string.sub(tostring(game:GetService("Players").LocalPlayer.PlayerGui['Gui']['Frames']['Store']['Frames']['SubUpgrades']['Holder']['Clicks'].UpgradeName.Text), 53), "</font>", ""))-1)
            local cost_val = cost * 2400;
            if LocalPlayer.PlayerGui['Gui']['Hotbar']['Stats']['Robux'].Amount.Text >= tostring(cost_val) then
                game:GetService("ReplicatedStorage")['Events'].StoreActions:InvokeServer("Upgrade", "Clicks")
            else
                warn("[ERROR] Can't upgrade clicks due to not enough money.")
            end
        end
    end)

    spawn(function()
        if getgenv().pick_drops then
            for _,v in pairs(game:GetService("Workspace")['SupplyDrops']:GetChildren()) do
                for _,x in pairs(v:GetChildren()) do
                    if x.Name == "Touch" then
                        delay(5, function()
                            LocalPlayer.Character.HumanoidRootPart.CFrame = x.CFrame;
                            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, x)
                        end)
                    end
                end
            end
        end
    end)

    spawn(function()
        if getgenv().pick_presents then
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name == "Present" then
                    delay(5, function()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v)
                    end)
                end
            end
        end
    end)

    spawn(function()
        if getgenv().pick_snowmens then
            for _,v in pairs(game:GetService("Workspace")['Snowmen']:GetChildren()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    delay(5, function()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame;
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v)
                    end)
                end
            end
        end
    end)
end)
