local localplayer_item = Color3.fromRGB(72, 245, 66);
local otherplr_item = Color3.fromRGB(203, 66, 245);
local transparency = 0.45;

while wait(0.1) do
for _,i in pairs(game.Workspace["Dropped"]:GetChildren()) do
   if i.ClassName == "Model" then
      for _,dropped in pairs(i:GetChildren()) do
         
         if dropped.ClassName == "BoxHandleAdornment" or dropped.ClassName == "BillboardGui" then dropped:Destroy() end
 
         if dropped.ClassName == "ObjectValue" then
            if dropped.Value == game.Players.LocalPlayer then
                local lp_item = Instance.new("BoxHandleAdornment", dropped.Parent)
                lp_item.Name = "local_player";
                lp_item.ZIndex = 10;
                lp_item.AlwaysOnTop = true;
                lp_item.Color3 = localplayer_item;
                lp_item.Size = dropped.Parent.Handle.Size;
                lp_item.Adornee = dropped.Parent;
                lp_item.Transparency = transparency;

                local BillboardGui = Instance.new("BillboardGui")
                BillboardGui.Parent = dropped.Parent
                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                BillboardGui.Active = true
                BillboardGui.Adornee = dropped.Parent.Handle
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 0.980
                BillboardGui.Size = UDim2.new(5, 0, 1.10000002, 0)
                BillboardGui.StudsOffset = Vector3.new(0, 1.5, 0)

                local TextLabel = Instance.new("TextLabel")
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Font = Enum.Font.Nunito
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextScaled = true
                TextLabel.TextSize = 14.000
                TextLabel.TextStrokeTransparency = 0.290
                TextLabel.TextWrapped = true
                TextLabel.Text = tostring(dropped.Value);
            else
                local other_item = Instance.new("BoxHandleAdornment", dropped.Parent)
                other_item.Name = "other_player";
                other_item.ZIndex = 10;
                other_item.AlwaysOnTop = true;
                other_item.Color3 = otherplr_item;
                other_item.Size = dropped.Parent.Handle.Size;
                other_item.Adornee = dropped.Parent;
                other_item.Transparency = transparency;
 
                local BillboardGui = Instance.new("BillboardGui")
                BillboardGui.Parent = dropped.Parent
                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                BillboardGui.Active = true
                BillboardGui.Adornee = dropped.Parent.Handle
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 0.980
                BillboardGui.Size = UDim2.new(5, 0, 1.10000002, 0)
                BillboardGui.StudsOffset = Vector3.new(0, 1.5, 0)

                local TextLabel = Instance.new("TextLabel")
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Font = Enum.Font.Nunito
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextScaled = true
                TextLabel.TextSize = 14.000
                TextLabel.TextStrokeTransparency = 0.290
                TextLabel.TextWrapped = true
                TextLabel.Text = tostring(dropped.Value);
            end
         end
      end
   end
end
end