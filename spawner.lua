local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpawnBtn = Instance.new("TextButton")
local ClearBtn = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "BrainrotSpawnerHub"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 220, 0, 160)
MainFrame.Active = true
MainFrame.Draggable = true 

Title.Parent = MainFrame
Title.Text = "BRAINROT SPAWNER 👑"
Title.Size = UDim2.new(1, 0, 0.25, 0)
Title.TextColor3 = Color3.fromRGB(0, 255, 150) 
Title.BackgroundTransparency = 1
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold


SpawnBtn.Parent = MainFrame
SpawnBtn.Text = "🌀 SPAWN BRAINROT BLOCK"
SpawnBtn.Size = UDim2.new(0.9, 0, 0.25, 0)
SpawnBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
SpawnBtn.BackgroundColor3 = Color3.fromRGB(130, 0, 180)
SpawnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpawnBtn.Font = Enum.Font.SourceSansBold
SpawnBtn.TextSize = 14

SpawnBtn.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
    
        local part = Instance.new("Part")
        part.Size = Vector3.new(4, 4, 4)
       
        part.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        part.Material = Enum.Material.Neon
        
     
        part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
        part.Parent = game.Workspace
        
        
        table.insert(blocchiCreati, part)
    end
end)

ClearBtn.Parent = MainFrame
ClearBtn.Text = "❌ CLEAR ALL BLOCKS"
ClearBtn.Size = UDim2.new(0.9, 0, 0.25, 0)
ClearBtn.Position = UDim2.new(0.05, 0, 0.68, 0)
ClearBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
ClearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearBtn.Font = Enum.Font.SourceSansBold
ClearBtn.TextSize = 14

ClearBtn.MouseButton1Click:Connect(function()
    for _, blocco in pairs(blocchiCreati) do
        if blocco then
            blocco:Destroy()
        end
    end
    blocchiCreati = {}
end)
