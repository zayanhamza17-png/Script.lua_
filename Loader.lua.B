local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "Nightmare Hub | Brookhaven | 1.2v 👑",
   LoadingTitle = "LOADING NIGHTMER HUB",
   LoadingSubtitle = "",
   ConfigurationSaving = {
      Enabled = false
   },
   Theme = "Ocean",
   
   KeySystem = true,
   KeySettings = {
      Title = "Nightmare Hub Key",
      Subtitle = "The Key is: NightmareKEY95",
      Note = "Join Discord or Watch Video for Key",
      FileName = "NightmareKey",
      SaveKey = true,
      GrabKeyFromUrl = false,
      Key = {"NightmareKEY95"}
   }
})

local PlayerTab = Window:CreateTab("Player", 4483362458) 
local Section = PlayerTab:CreateSection("Mods")

local InfiniteJumpEnabled = false
PlayerTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "ToggleInfJump",
   Callback = function(Value)
      InfiniteJumpEnabled = Value
   end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
   if InfiniteJumpEnabled then
      game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
   end
end)

local NoclipEnabled = false
PlayerTab:CreateToggle({
   Name = "No Clip",
   CurrentValue = false,
   Flag = "ToggleNoclip",
   Callback = function(Value)
      NoclipEnabled = Value
      task.spawn(function()
         while NoclipEnabled do
            if game.Players.LocalPlayer.Character then
               for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                  if v:IsA("BasePart") then
                     v.CanCollide = false
                  end
               end
            end
            task.wait(0.1)
         end
      end)
   end
})

PlayerTab:CreateToggle({
   Name = "Gravity 0",
   CurrentValue = false,
   Flag = "ToggleGravity",
   Callback = function(Value)
      if Value then
         game.Workspace.Gravity = 0
      else
         game.Workspace.Gravity = 196.2
      end
   end
})
