local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "Nightmare Hub | Steal a Brainrot | 1.2v 👑",
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

local SpawnerTab = Window:CreateTab("Meme Spawner", 4483362534) 
local Section1 = SpawnerTab:CreateSection("Brainrot Models")

SpawnerTab:CreateButton({
   Name = "Spawn Strawberry Elephant (Visual)",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local part = Instance.new("Part")
         part.Size = Vector3.new(5, 5, 5)
         part.Color = Color3.fromRGB(255, 50, 120)
         part.Material = Enum.Material.Neon
         part.Name = "StrawberryElephant"
         part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 12, 0)
         part.Parent = game.Workspace
      end
   end
})

SpawnerTab:CreateButton({
   Name = "Spawn All Conveyor Memes (Visual)",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local colors = {
            Color3.fromRGB(255, 0, 0),
            Color3.fromRGB(0, 255, 0),
            Color3.fromRGB(0, 0, 255),
            Color3.fromRGB(255, 255, 0)
         }
         for i, color in ipairs(colors) do
            local part = Instance.new("Part")
            part.Size = Vector3.new(4, 4, 4)
            part.Color = color
            part.Material = Enum.Material.Neon
            part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(i * 6 - 12, 10, 0)
            part.Parent = game.Workspace
         end
      end
   end
})

SpawnerTab:CreateButton({
   Name = "Clear All Spawned Memes",
   Callback = function()
      for _, obj in pairs(game.Workspace:GetChildren()) do
         if obj:IsA("Part") and obj.Material == Enum.Material.Neon then
            obj:Destroy()
         end
      end
   end
})

local RedeemTab = Window:CreateTab("Code Redeemer", 4483362432)
local Section2 = RedeemTab:CreateSection("Sammy Admin Codes")

local wordsCount = 1

RedeemTab:CreateSlider({
   Name = "Words To Redeem After Full Code",
   Info = "Choose how many words to redeem (1-4)",
   Min = 1,
   Max = 4,
   CurrentValue = 1,
   Flag = "WordsSlider",
   Callback = function(Value)
      wordsCount = Value
   end
})

RedeemTab:CreateButton({
   Name = "Redeem Sammy Admin Codes",
   Callback = function()
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local redeemRemote = ReplicatedStorage:FindFirstChild("RedeemCode") or ReplicatedStorage:FindFirstChild("CodeRemote") or ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Redeem")
      
      if redeemRemote then
         local codeWords = {"SAMMY", "ABUSE", "BRAINROT", "EGGS"}
         local compiledCode = ""
         
         for i = 1, wordsCount do
            if codeWords[i] then
               if i == 1 then
                  compiledCode = codeWords[i]
               else
                  compiledCode = compiledCode .. codeWords[i]
               end
            end
         end
         
         if redeemRemote:IsA("RemoteFunction") then
            redeemRemote:InvokeServer(compiledCode)
         elseif redeemRemote:IsA("RemoteEvent") then
            redeemRemote:FireServer(compiledCode)
         end
      end
   end
})
