local teleported = false;
local grabbed = false;

while wait() do
for _,boards in pairs(game.Workspace["Boards"]:GetChildren()) do
    if boards.ClassName == "Model" then
       for _,x in pairs(boards:GetChildren()) do
          if x.ClassName == "ObjectValue" then 
             if x.Name == "Player1" or x.Name == "Player2" then
                 if x.Value == game.Players.LocalPlayer then
                    --print("found player")
                    if x.Name == "Player1" then
                       --print("[2] TARGET'S ACTION: ".. tostring(x.Parent.Player2Action.Value))
                       if x.Parent.Player2Action.Value == "Done" then
                          print("scamming...")
                          for _,i in pairs(game.Workspace["Dropped"]:GetChildren()) do
                              if i.ClassName == "Model" then
                                  for _,owner in pairs(i:GetChildren()) do
                                      if owner.ClassName == "ObjectValue" then
                                         if owner.Value == game.Players.LocalPlayer then
                                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner.Parent.Handle)
                                         end
                                     end
                                 end
                              end
                          end
                          wait(0.25)
                          if teleported == false then
                          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x.Parent.Controls.Done.Pad.CFrame.X, x.Parent.Controls.Done.Pad.CFrame.Y+1.5, x.Parent.Controls.Done.Pad.CFrame.Z);
                          teleported = true;
                          game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0;
                          end
                          wait(0.119999999999999)
                          game.ReplicatedStorage.RemoteEvents.Jumped:FireServer(game.Players.LocalPlayer.Name)
                          game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
                          teleported = false;
                       end
                    else
                       --print("[1] TARGET'S ACTION: ".. tostring(x.Parent.Player1Action.Value))
                       if x.Parent.Player1Action.Value == "Done" then
                          print("scamming...")
                          for _,i in pairs(game.Workspace["Dropped"]:GetChildren()) do
                              if i.ClassName == "Model" then
                                  for _,owner in pairs(i:GetChildren()) do
                                      if owner.ClassName == "ObjectValue" then
                                         if owner.Value == game.Players.LocalPlayer then
                                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner.Parent.Handle)
                                         end
                                     end
                                 end
                              end
                          end
                          wait(0.25)
                          if teleported == false then
                          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x.Parent.Controls.Done.Pad.CFrame.X, x.Parent.Controls.Done.Pad.CFrame.Y+1.5, x.Parent.Controls.Done.Pad.CFrame.Z);
                          teleported = true;
                          game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0;
                          end
                          wait(0.119999999999999)
                          game.ReplicatedStorage.RemoteEvents.Jumped:FireServer(game.Players.LocalPlayer.Name)
                          game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16;
                          teleported = false;
                       end
                    end
                 end
             end
          end
       end
    end
end
end
print("loaded")