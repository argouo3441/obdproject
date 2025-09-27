print("injection is successful ✅")
warn("OBDeleven version 25w39c")

warn("Changelogs are migrated to github")

--[[DO NOT MODIFY THIS PART, THIS IS FOR THE COREGUI.ROBLOXGUI
 YOU WILL BE BANNED OTHERWISE FOR CREATING NEW GUIS]]
local coreGui = game:GetService("CoreGui").RobloxGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "7b117de4599b0c2454a301fdf1e83e2c1939114799a1f40cfba7c6880d867db0"
screenGui.Parent = coreGui
--[[DO NOT MODIFY ABOVE]]
----------------------------------------------------------------------------------------------------------

-- main
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0.3, 0, 0.7, 0)                                                                                     
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -255)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0

-- rightshift to toggle
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local frame = mainFrame

local fVis = true

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        fVis = not fVis
        frame.Visible = fVis
    end
end)

-- drag state
mainFrame.Active = true
mainFrame.Draggable = true

-- image
local obdimage = Instance.new("ImageLabel")
obdimage.Parent = mainFrame
obdimage.Size = UDim2.new(1, 0, 0.07, 0)
obdimage.Position = UDim2.new(0, 0, 0, 0)
obdimage.Image = "rbxassetid://84235374004078"
obdimage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
obdimage.BorderSizePixel = 0
obdimage.ScaleType = Enum.ScaleType.Fit

-- name input
local playerNameBox = Instance.new("TextBox")
playerNameBox.Parent = mainFrame
playerNameBox.Size = UDim2.new(0.6, 0, 0.07, 0)
playerNameBox.Position = UDim2.new(0.35, 0, 0.08, 0)
playerNameBox.PlaceholderText = "Enter Player Name"
playerNameBox.TextScaled = true
playerNameBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
playerNameBox.BorderSizePixel = 0
playerNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
playerNameBox.Font = Enum.Font.Ubuntu

-- auto player name
local Players = game:GetService("Players")
local player = Players.LocalPlayer
playerNameBox.Text = player.Name



-- nav menu

local navMenu = Instance.new("Frame")
navMenu.Parent = mainFrame
navMenu.Size = UDim2.new(0.3, 0, 0.93, 0)
navMenu.Position = UDim2.new(0, 0, 0.07, 0)
navMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
navMenu.BorderSizePixel = 0

local navmenutext = Instance.new("TextLabel")
navmenutext.Parent = navMenu
navmenutext.Size = UDim2.new(1, 0, 0.04, 0)
navmenutext.Position = UDim2.new(0, 0, 0, 0)
navmenutext.Text = "Features"
navmenutext.TextScaled = true
navmenutext.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
navmenutext.BorderSizePixel = 0
navmenutext.TextColor3 = Color3.fromRGB(255, 255, 255)
navmenutext.Font = Enum.Font.Ubuntu

-- menus

local mainmenu = Instance.new("TextButton")
mainmenu.Parent = navMenu
mainmenu.Size = UDim2.new(1, 0, 0.07, 0)
mainmenu.Position = UDim2.new(0, 0, 0.04, 0)
mainmenu.Text = "Main 💰"
mainmenu.TextScaled = true
mainmenu.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
mainmenu.BorderSizePixel = 0
mainmenu.TextColor3 = Color3.fromRGB(255, 255, 255)
mainmenu.Font = Enum.Font.Ubuntu

local worldmenu = Instance.new("TextButton")
worldmenu.Parent = navMenu
worldmenu.Size = UDim2.new(1, 0, 0.07, 0)
worldmenu.Position = UDim2.new(0, 0, 0.11, 0)
worldmenu.Text = "World 🌐"
worldmenu.TextScaled = true
worldmenu.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
worldmenu.BorderSizePixel = 0
worldmenu.TextColor3 = Color3.fromRGB(255, 255, 255)
worldmenu.Font = Enum.Font.Ubuntu

local espmenu = Instance.new("TextButton")
espmenu.Parent = navMenu
espmenu.Size = UDim2.new(1, 0, 0.07, 0)
espmenu.Position = UDim2.new(0, 0, 0.18, 0)
espmenu.Text = "ESP 👁️"
espmenu.TextScaled = true
espmenu.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
espmenu.BorderSizePixel = 0
espmenu.TextColor3 = Color3.fromRGB(255, 255, 255)
espmenu.Font = Enum.Font.Ubuntu

local vehiclemenu = Instance.new("TextButton")
vehiclemenu.Parent = navMenu
vehiclemenu.Size = UDim2.new(1, 0, 0.07, 0)
vehiclemenu.Position = UDim2.new(0, 0, 0.25, 0)
vehiclemenu.Text = "Vehicle 🚗"
vehiclemenu.TextScaled = true
vehiclemenu.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
vehiclemenu.BorderSizePixel = 0
vehiclemenu.TextColor3 = Color3.fromRGB(255, 255, 255)
vehiclemenu.Font = Enum.Font.Ubuntu

local playermenu = Instance.new("TextButton")
playermenu.Parent = navMenu
playermenu.Size = UDim2.new(1, 0, 0.07, 0)
playermenu.Position = UDim2.new(0, 0, 0.32, 0)
playermenu.Text = "Player 💪 (wip)"
playermenu.TextScaled = true
playermenu.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
playermenu.BorderSizePixel = 0
playermenu.TextColor3 = Color3.fromRGB(255, 255, 255)
playermenu.Font = Enum.Font.Ubuntu

local miscmenu = Instance.new("TextButton")
miscmenu.Parent = navMenu
miscmenu.Size = UDim2.new(1, 0, 0.07, 0)
miscmenu.Position = UDim2.new(0, 0, 0.39, 0)
miscmenu.Text = "Misc ⚙️"
miscmenu.TextScaled = true
miscmenu.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
miscmenu.BorderSizePixel = 0
miscmenu.TextColor3 = Color3.fromRGB(255, 255, 255)
miscmenu.Font = Enum.Font.Ubuntu

-- menu buttons above
-- frames below

local mainfeatures = Instance.new("Frame")
mainfeatures.Parent = mainFrame
mainfeatures.Size = UDim2.new(0.7, 0, 0.85, 0)
mainfeatures.Position = UDim2.new(0.3, 0, 0.15, 0)
mainfeatures.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainfeatures.BorderSizePixel = 0
mainfeatures.Visible = false
mainfeatures.Name = "main"

local worldfeatures = Instance.new("Frame")
worldfeatures.Parent = mainFrame
worldfeatures.Size = UDim2.new(0.7, 0, 0.85, 0)
worldfeatures.Position = UDim2.new(0.3, 0, 0.15, 0)
worldfeatures.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
worldfeatures.BorderSizePixel = 0
worldfeatures.Visible = false
worldfeatures.Name = "world"

local espfeatures = Instance.new("Frame")
espfeatures.Parent = mainFrame
espfeatures.Size = UDim2.new(0.7, 0, 0.85, 0)
espfeatures.Position = UDim2.new(0.3, 0, 0.15, 0)
espfeatures.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espfeatures.BorderSizePixel = 0
espfeatures.Visible = false
espfeatures.Name = "esp"

local vehiclefeatures = Instance.new("Frame")
vehiclefeatures.Parent = mainFrame
vehiclefeatures.Size = UDim2.new(0.7, 0, 0.85, 0)
vehiclefeatures.Position = UDim2.new(0.3, 0, 0.15, 0)
vehiclefeatures.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
vehiclefeatures.BorderSizePixel = 0
vehiclefeatures.Visible = false
vehiclefeatures.Name = "vehicle"

local playerfeatures = Instance.new("Frame")
playerfeatures.Parent = mainFrame
playerfeatures.Size = UDim2.new(0.7, 0, 0.85, 0)
playerfeatures.Position = UDim2.new(0.3, 0, 0.15, 0)
playerfeatures.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerfeatures.BorderSizePixel = 0
playerfeatures.Visible = false
playerfeatures.Name = "player"

local miscfeatures = Instance.new("Frame")
miscfeatures.Parent = mainFrame
miscfeatures.Size = UDim2.new(0.7, 0, 0.85, 0)
miscfeatures.Position = UDim2.new(0.3, 0, 0.15, 0)
miscfeatures.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
miscfeatures.BorderSizePixel = 0
miscfeatures.Visible = false
miscfeatures.Name = "misc"

------------------------------------------------------------
-- BUTTONS BELOW PART OF MAIN

local ezLockPickLabel = Instance.new("TextLabel")
ezLockPickLabel.Parent = mainfeatures
ezLockPickLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
ezLockPickLabel.Position = UDim2.new(0.07, 0, 0.025, 0)
ezLockPickLabel.Text = "Easy Lockpick"
ezLockPickLabel.TextScaled = true
ezLockPickLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ezLockPickLabel.BorderSizePixel = 0
ezLockPickLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ezLockPickLabel.Font = Enum.Font.Ubuntu

local ezLockPickButton = Instance.new("TextButton")
ezLockPickButton.Parent = mainfeatures
ezLockPickButton.Size = UDim2.new(0.2, 0, 0.07, 0)
ezLockPickButton.Position = UDim2.new(0.27, 0, 0.025, 0)
ezLockPickButton.Text = "Apply"
ezLockPickButton.TextScaled = true
ezLockPickButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
ezLockPickButton.BorderSizePixel = 0
ezLockPickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ezLockPickButton.Font = Enum.Font.Ubuntu

local ezCrowbarLabel = Instance.new("TextLabel")
ezCrowbarLabel.Parent = mainfeatures
ezCrowbarLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
ezCrowbarLabel.Position = UDim2.new(0.07, 0, 0.108, 0)
ezCrowbarLabel.Text = "Easy Crowbar"
ezCrowbarLabel.TextScaled = true
ezCrowbarLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ezCrowbarLabel.BorderSizePixel = 0
ezCrowbarLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ezCrowbarLabel.Font = Enum.Font.Ubuntu

local ezCrowbarButton = Instance.new("TextButton")
ezCrowbarButton.Parent = mainfeatures
ezCrowbarButton.Size = UDim2.new(0.2, 0, 0.07, 0)
ezCrowbarButton.Position = UDim2.new(0.27, 0, 0.108, 0)
ezCrowbarButton.Text = "Apply"
ezCrowbarButton.TextScaled = true
ezCrowbarButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
ezCrowbarButton.BorderSizePixel = 0
ezCrowbarButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ezCrowbarButton.Font = Enum.Font.Ubuntu

------------------------------------------------------------
-- BUTTONS BELOW PART OF WORLD

-- breakable object destroy button and label
local brkObjectDestroyLabel = Instance.new("TextLabel")
brkObjectDestroyLabel.Parent = worldfeatures
brkObjectDestroyLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
brkObjectDestroyLabel.Position = UDim2.new(0.07, 0, 0.025, 0)
brkObjectDestroyLabel.Text = "Destroy Breakable Objects"
brkObjectDestroyLabel.TextScaled = true
brkObjectDestroyLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
brkObjectDestroyLabel.BorderSizePixel = 0
brkObjectDestroyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
brkObjectDestroyLabel.Font = Enum.Font.Ubuntu

local brkObjectDestroyButton = Instance.new("TextButton")
brkObjectDestroyButton.Parent = worldfeatures
brkObjectDestroyButton.Size = UDim2.new(0.2, 0, 0.07, 0)
brkObjectDestroyButton.Position = UDim2.new(0.27, 0, 0.025, 0)
brkObjectDestroyButton.Text = "Apply"
brkObjectDestroyButton.TextScaled = true
brkObjectDestroyButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
brkObjectDestroyButton.BorderSizePixel = 0
brkObjectDestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
brkObjectDestroyButton.Font = Enum.Font.Ubuntu


--antiteamtrees
local destroyTreesLabel = Instance.new("TextLabel")
destroyTreesLabel.Parent = worldfeatures
destroyTreesLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
destroyTreesLabel.Position = UDim2.new(0.07, 0, 0.108, 0)
destroyTreesLabel.Text = "Destroy Trees"
destroyTreesLabel.TextScaled = true
destroyTreesLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
destroyTreesLabel.BorderSizePixel = 0
destroyTreesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
destroyTreesLabel.Font = Enum.Font.Ubuntu

local destroyTreesButton = Instance.new("TextButton")
destroyTreesButton.Parent = worldfeatures
destroyTreesButton.Size = UDim2.new(0.2, 0, 0.07, 0)
destroyTreesButton.Position = UDim2.new(0.27, 0, 0.108, 0)
destroyTreesButton.Text = "Apply"
destroyTreesButton.TextScaled = true
destroyTreesButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
destroyTreesButton.BorderSizePixel = 0
destroyTreesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
destroyTreesButton.Font = Enum.Font.Ubuntu;

-- deployable label and button

local deployableRemoveLabel = Instance.new("TextLabel")
deployableRemoveLabel.Parent = worldfeatures
deployableRemoveLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
deployableRemoveLabel.Position = UDim2.new(0.07, 0, 0.191, 0)
deployableRemoveLabel.Text = "Destroy Deployables"
deployableRemoveLabel.TextScaled = true
deployableRemoveLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
deployableRemoveLabel.BorderSizePixel = 0
deployableRemoveLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
deployableRemoveLabel.Font = Enum.Font.Ubuntu

local deployableRemoveButton = Instance.new("TextButton")
deployableRemoveButton.Parent = worldfeatures
deployableRemoveButton.Size = UDim2.new(0.2, 0, 0.07, 0)
deployableRemoveButton.Position = UDim2.new(0.27, 0, 0.191, 0)
deployableRemoveButton.Text = "Apply"
deployableRemoveButton.TextScaled = true
deployableRemoveButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
deployableRemoveButton.BorderSizePixel = 0
deployableRemoveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deployableRemoveButton.Font = Enum.Font.Ubuntu

-- traffic detection removal button and label

local removeTDLabel = Instance.new("TextLabel")
removeTDLabel.Parent = worldfeatures
removeTDLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
removeTDLabel.Position = UDim2.new(0.07, 0, 0.274, 0)
removeTDLabel.Text = "Destroy Traffic Detection"
removeTDLabel.TextScaled = true
removeTDLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
removeTDLabel.BorderSizePixel = 0
removeTDLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
removeTDLabel.Font = Enum.Font.Ubuntu

local removeTDButton = Instance.new("TextButton")
removeTDButton.Parent = worldfeatures
removeTDButton.Size = UDim2.new(0.2, 0, 0.07, 0)
removeTDButton.Position = UDim2.new(0.27, 0, 0.274, 0)
removeTDButton.Text = "Apply"
removeTDButton.TextScaled = true
removeTDButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
removeTDButton.BorderSizePixel = 0
removeTDButton.TextColor3 = Color3.fromRGB(255, 255, 255)
removeTDButton.Font = Enum.Font.Ubuntu

local nofoglabel = Instance.new("TextLabel")
nofoglabel.Parent = worldfeatures
nofoglabel.Size = UDim2.new(0.2, 0, 0.07, 0)
nofoglabel.Position = UDim2.new(0.07, 0, 0.357, 0)
nofoglabel.Text = "No fog & Fullbright"
nofoglabel.TextScaled = true
nofoglabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
nofoglabel.BorderSizePixel = 0
nofoglabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nofoglabel.Font = Enum.Font.Ubuntu

local nofogbutton = Instance.new("TextButton")
nofogbutton.Parent = worldfeatures
nofogbutton.Size = UDim2.new(0.2, 0, 0.07, 0)
nofogbutton.Position = UDim2.new(0.27, 0, 0.357, 0)
nofogbutton.Text = "Apply"
nofogbutton.TextScaled = true
nofogbutton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
nofogbutton.BorderSizePixel = 0
nofogbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
nofogbutton.Font = Enum.Font.Ubuntu
----------------------------------------------
-- esp buttons below

local playeresplabel = Instance.new("TextLabel")
playeresplabel.Parent = espfeatures
playeresplabel.Size = UDim2.new(0.2, 0, 0.07, 0)
playeresplabel.Position = UDim2.new(0.07, 0, 0.025, 0)
playeresplabel.Text = "Player ESP"
playeresplabel.TextScaled = true
playeresplabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
playeresplabel.BorderSizePixel = 0
playeresplabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playeresplabel.Font = Enum.Font.Ubuntu

local playerespenablebutton = Instance.new("TextButton")
playerespenablebutton.Parent = espfeatures
playerespenablebutton.Size = UDim2.new(0.2, 0, 0.07, 0)
playerespenablebutton.Position = UDim2.new(0.27, 0, 0.025, 0)
playerespenablebutton.Text = "Enable"
playerespenablebutton.TextScaled = true
playerespenablebutton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
playerespenablebutton.BorderSizePixel = 0
playerespenablebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
playerespenablebutton.Font = Enum.Font.Ubuntu

local playerespdisablebutton = Instance.new("TextButton")
playerespdisablebutton.Parent = espfeatures
playerespdisablebutton.Size = UDim2.new(0.2, 0, 0.07, 0)
playerespdisablebutton.Position = UDim2.new(0.47, 0, 0.025, 0)
playerespdisablebutton.Text = "Disable"
playerespdisablebutton.TextScaled = true
playerespdisablebutton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
playerespdisablebutton.BorderSizePixel = 0
playerespdisablebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
playerespdisablebutton.Font = Enum.Font.Ubuntu

local atmesplabel = Instance.new("TextLabel")
atmesplabel.Parent = espfeatures
atmesplabel.Size = UDim2.new(0.2, 0, 0.07, 0)
atmesplabel.Position = UDim2.new(0.07, 0, 0.108, 0)
atmesplabel.Text = "ATM ESP"
atmesplabel.TextScaled = true
atmesplabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
atmesplabel.BorderSizePixel = 0
atmesplabel.TextColor3 = Color3.fromRGB(255, 255, 255)
atmesplabel.Font = Enum.Font.Ubuntu

local atmespbutton = Instance.new("TextButton")
atmespbutton.Parent = espfeatures
atmespbutton.Size = UDim2.new(0.2, 0, 0.07, 0)
atmespbutton.Position = UDim2.new(0.27, 0, 0.108, 0)
atmespbutton.Text = "Apply"
atmespbutton.TextScaled = true
atmespbutton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
atmespbutton.BorderSizePixel = 0
atmespbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
atmespbutton.Font = Enum.Font.Ubuntu

local vehicleesplabel = Instance.new("TextLabel")
vehicleesplabel.Parent = espfeatures
vehicleesplabel.Size = UDim2.new(0.2, 0, 0.07, 0)
vehicleesplabel.Position = UDim2.new(0.07, 0, 0.191, 0)
vehicleesplabel.Text = "Bounty Vehicle ESP"
vehicleesplabel.TextScaled = true
vehicleesplabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
vehicleesplabel.BorderSizePixel = 0
vehicleesplabel.TextColor3 = Color3.fromRGB(255, 255, 255)
vehicleesplabel.Font = Enum.Font.Ubuntu

local vehicleespbutton = Instance.new("TextButton")
vehicleespbutton.Parent = espfeatures
vehicleespbutton.Size = UDim2.new(0.2, 0, 0.07, 0)
vehicleespbutton.Position = UDim2.new(0.27, 0, 0.191, 0)
vehicleespbutton.Text = "Apply"
vehicleespbutton.TextScaled = true
vehicleespbutton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
vehicleespbutton.BorderSizePixel = 0
vehicleespbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
vehicleespbutton.Font = Enum.Font.Ubuntu

local safeesplabel = Instance.new("TextLabel")
safeesplabel.Parent = espfeatures
safeesplabel.Size = UDim2.new(0.2, 0, 0.07, 0)
safeesplabel.Position = UDim2.new(0.07, 0, 0.274, 0)
safeesplabel.Text = "Safes ESP"
safeesplabel.TextScaled = true
safeesplabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
safeesplabel.BorderSizePixel = 0
safeesplabel.TextColor3 = Color3.fromRGB(255, 255, 255)
safeesplabel.Font = Enum.Font.Ubuntu

local safeespbutton = Instance.new("TextButton")
safeespbutton.Parent = espfeatures
safeespbutton.Size = UDim2.new(0.2, 0, 0.07, 0)
safeespbutton.Position = UDim2.new(0.27, 0, 0.274, 0)
safeespbutton.Text = "Apply"
safeespbutton.TextScaled = true
safeespbutton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
safeespbutton.BorderSizePixel = 0
safeespbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
safeespbutton.Font = Enum.Font.Ubuntu
---------------------------------------------
------------------- car features below

-- nocollide textlabel and button
local noCollideLabel = Instance.new("TextLabel")
noCollideLabel.Parent = vehiclefeatures
noCollideLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
noCollideLabel.Position = UDim2.new(0.07, 0, 0.025, 0)
noCollideLabel.Text = "No Collide"
noCollideLabel.TextScaled = true
noCollideLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
noCollideLabel.BorderSizePixel = 0
noCollideLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
noCollideLabel.Font = Enum.Font.Ubuntu

local noCollideButton = Instance.new("TextButton")
noCollideButton.Parent = vehiclefeatures
noCollideButton.Size = UDim2.new(0.2, 0, 0.07, 0)
noCollideButton.Position = UDim2.new(0.27, 0, 0.025, 0)
noCollideButton.Text = "Apply"
noCollideButton.TextScaled = true
noCollideButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
noCollideButton.BorderSizePixel = 0
noCollideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noCollideButton.Font = Enum.Font.Ubuntu

-- inf fuel textlabel and button
local infiniteFuelLabel = Instance.new("TextLabel")
infiniteFuelLabel.Parent = vehiclefeatures
infiniteFuelLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
infiniteFuelLabel.Position = UDim2.new(0.07, 0, 0.108, 0)
infiniteFuelLabel.Text = "Infinite Fuel"
infiniteFuelLabel.TextScaled = true
infiniteFuelLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
infiniteFuelLabel.BorderSizePixel = 0
infiniteFuelLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
infiniteFuelLabel.Font = Enum.Font.Ubuntu

local infiniteFuelButton = Instance.new("TextButton")
infiniteFuelButton.Parent = vehiclefeatures
infiniteFuelButton.Size = UDim2.new(0.2, 0, 0.07, 0)
infiniteFuelButton.Position = UDim2.new(0.27, 0, 0.108, 0)
infiniteFuelButton.Text = "Apply"
infiniteFuelButton.TextScaled = true
infiniteFuelButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
infiniteFuelButton.BorderSizePixel = 0
infiniteFuelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
infiniteFuelButton.Font = Enum.Font.Ubuntu

-- health button and label
local healthLabel = Instance.new("TextLabel")
healthLabel.Parent = vehiclefeatures
healthLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
healthLabel.Position = UDim2.new(0.07, 0, 0.191, 0)
healthLabel.Text = "Max Health"
healthLabel.TextScaled = true
healthLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
healthLabel.BorderSizePixel = 0
healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
healthLabel.Font = Enum.Font.Ubuntu

local healthButton = Instance.new("TextButton")
healthButton.Parent = vehiclefeatures
healthButton.Size = UDim2.new(0.2, 0, 0.07, 0)
healthButton.Position = UDim2.new(0.27, 0, 0.191, 0)
healthButton.Text = "Apply"
healthButton.TextScaled = true
healthButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
healthButton.BorderSizePixel = 0
healthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
healthButton.Font = Enum.Font.Ubuntu

local carflingLabel = Instance.new("TextLabel")
carflingLabel.Parent = vehiclefeatures
carflingLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
carflingLabel.Position = UDim2.new(0.07, 0, 0.274, 0)
carflingLabel.Text = "Car Fling"
carflingLabel.TextScaled = true
carflingLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
carflingLabel.BorderSizePixel = 0
carflingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
carflingLabel.Font = Enum.Font.Ubuntu

local carflingButton = Instance.new("TextButton")
carflingButton.Parent = vehiclefeatures
carflingButton.Size = UDim2.new(0.2, 0, 0.07, 0)
carflingButton.Position = UDim2.new(0.27, 0, 0.274, 0)
carflingButton.Text = "Apply"
carflingButton.TextScaled = true
carflingButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
carflingButton.BorderSizePixel = 0
carflingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
carflingButton.Font = Enum.Font.Ubuntu

local carflingText = Instance.new("TextLabel")
carflingText.Parent = vehiclefeatures
carflingText.Size = UDim2.new(0.4, 0, 0.07, 0)
carflingText.Position = UDim2.new(0.47, 0, 0.274, 0)
carflingText.Text = "WARNING! YOU RISK BEING BANNED IF YOU PRESS THIS BUTTON OUTSIDE THE VEHICLE! PRESS IT ONLY ONCE WHEN YOURE INSIDE THE CAR."
carflingText.TextScaled = true
carflingText.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
carflingText.BorderSizePixel = 0
carflingText.TextColor3 = Color3.fromRGB(199, 26, 26)
carflingText.Font = Enum.Font.Ubuntu

------ player features

local DisbaleDmgLabel = Instance.new("TextLabel")
DisbaleDmgLabel.Parent = playerfeatures
DisbaleDmgLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
DisbaleDmgLabel.Position = UDim2.new(0.07, 0, 0.025, 0)
DisbaleDmgLabel.Text = "Disable DamageHandler"
DisbaleDmgLabel.TextScaled = true
DisbaleDmgLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
DisbaleDmgLabel.BorderSizePixel = 0
DisbaleDmgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DisbaleDmgLabel.Font = Enum.Font.Ubuntu

local DisbaleDmgButton = Instance.new("TextButton")
DisbaleDmgButton.Parent = playerfeatures
DisbaleDmgButton.Size = UDim2.new(0.2, 0, 0.07, 0)
DisbaleDmgButton.Position = UDim2.new(0.27, 0, 0.025, 0)
DisbaleDmgButton.Text = "Apply"
DisbaleDmgButton.TextScaled = true
DisbaleDmgButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
DisbaleDmgButton.BorderSizePixel = 0
DisbaleDmgButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DisbaleDmgButton.Font = Enum.Font.Ubuntu

local HipHeightLabel = Instance.new("TextBox")
HipHeightLabel.Parent = playerfeatures
HipHeightLabel.Size = UDim2.new(0.2, 0, 0.07, 0)
HipHeightLabel.Position = UDim2.new(0.07, 0, 0.108, 0)
HipHeightLabel.Text = "Disable DamageHandler"
HipHeightLabel.TextScaled = true
HipHeightLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
HipHeightLabel.BorderSizePixel = 0
HipHeightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HipHeightLabel.Font = Enum.Font.Ubuntu

local Hipheightextbox = Instance.new("TextBox")
Hipheightextbox.Parent = playerfeatures
Hipheightextbox.Size = UDim2.new(0.2, 0, 0.07, 0)
Hipheightextbox.Position = UDim2.new(0.27, 0, 0.108, 0)
Hipheightextbox.PlaceholderText = "Enter Value 0-999"
Hipheightextbox.Text = ""
Hipheightextbox.TextScaled = true
Hipheightextbox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Hipheightextbox.BorderSizePixel = 0
Hipheightextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
Hipheightextbox.Font = Enum.Font.Ubuntu
Hipheightextbox.ClearTextOnFocus = true

local HipHeightButton = Instance.new("TextButton")
HipHeightButton.Parent = playerfeatures
HipHeightButton.Size = UDim2.new(0.2, 0, 0.07, 0)
HipHeightButton.Position = UDim2.new(0.47, 0, 0.108, 0)
HipHeightButton.Text = "Apply"
HipHeightButton.TextScaled = true
HipHeightButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
HipHeightButton.BorderSizePixel = 0
HipHeightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HipHeightButton.Font = Enum.Font.Ubuntu

------------------ func

-- func collide
local function setCollisionOff(model)
	for _, part in pairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
			part.CanTouch = false
		end
	end
end

-- func inf fuel
local function setInfiniteFuel(vehicle)
	local controlValues = vehicle:FindFirstChild("Control_Values")
	if controlValues then
		local currentFuel = controlValues:FindFirstChild("CurrentFuel")
		if currentFuel then
			while true do
				currentFuel.Value = 350
				wait(2)
			end
		end
	end
end

-- func health
local function setHealthValue(vehicle)
	local controlValues = vehicle:FindFirstChild("Control_Values")
	if controlValues then
		local CurrentHealth = controlValues:FindFirstChild("Health")
		if CurrentHealth then
			while true do
				CurrentHealth.Value = 150
				wait(1)
			end
		end
	end
end

--objects destroy
local function destroyFolderContents(folderName)
	local folder = workspace:FindFirstChild(folderName)
	if folder then
		for _, child in pairs(folder:GetChildren()) do
			child:Destroy()
		end
	end
end

-- funcs for each
local function destroyFireHydrants()
	destroyFolderContents("FireHydrants")
end

local function destroyFences()
	destroyFolderContents("Fences")
end

local function destroyStreetLamps()
	destroyFolderContents("Street Lamps")
end

local function destroyTrafficDetections()
	destroyFolderContents("TrafficDetections")
end

local function destroyTrafficLights()
	destroyFolderContents("Traffic Lights")
end

local function destroyDeployables()
	destroyFolderContents("Deployables")
end

local function destroyTrees()
	destroyFolderContents("Trees")
end

-- car fly 🤣🤣🤣🤣🤣
local function carflings()
	local runsrv = game:GetService("RunService")
	local plr = Players.LocalPlayer
	local carflinges = nil
	if carflinges then 
		coroutine.close(carflinges)
		carflinges = nil
		return 
	end

	local humanoid = plr.Character:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		local brodied
		 brodied = humanoid.Died:Connect(function()
			coroutine.close(carflinges)
			carflinges = nil
			brodied:Disconnect()
		end)
	end

	carflinges = coroutine.create(function()
		repeat runsrv.Heartbeat:Wait()
			local char = plr.Character
			local root = char.PrimaryPart
			humanoid = char:FindFirstChildWhichIsA("Humanoid")
			local vel, movel = nil, 0.1

			vel = root.Velocity
			root.Velocity = vel * 1000000 + Vector3.new(0,1000000,0)

			runsrv.RenderStepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel
			end

			runsrv.Stepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		until not carflinges or not humanoid.Sit
	end)

	coroutine.resume(carflinges)

end

-- ez lockpick
local function ezlockpick()
	local lockpicktext = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Lockpick.InfoText
    local redLine = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Lockpick.Pick.RedLine
		    redLine.Size = UDim2.new(1, 0, 1, 0)
			redLine.BackgroundTransparency = 1
		lockpicktext.Text = "OBD ON TOP, Click until you successfully break into the house."
	end

-- ez crowbar
local function ezcrowbar()
	local crowbartext = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Crowbar.Main.GradientFrame.TextLabel
	local crowbar = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Crowbar.Main.Game.Target
		crowbar.Size = UDim2.new(3, 0, 0.96, 0)
		crowbartext.Text = "OBD ON TOP, Click until you successfully break into the car."
	end



-- damagehandler

local function disabledmg()
	game.Players.LocalPlayer.Character.DamageHandler:Destroy()
end



-- the fog is coming (skidded from infinite yield lmao)

local runsrv = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local brightLoop -- Store the connection outside the function

local function fullbrighted()
    if brightLoop then
        brightLoop:Disconnect()
        brightLoop = nil
    end

    local function brightFunc()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end

    brightLoop = runsrv.RenderStepped:Connect(brightFunc)
end


---------------- toilet

local function findDesc(part, name)
    for _, d in ipairs(part:GetDescendants()) do
        if d.Name == name then
            return d
        end
    end
    return nil
end

-------------------
-- car bounty esp
local function bountycaresp()
    local runsrv = game:GetService("RunService")
    local vfs = workspace:WaitForChild("BountyVehicles"):WaitForChild("Vehicles")

    local function applyToVehicle(v)
        if v:IsA("Model") and not v:FindFirstChildOfClass("Highlight") then
            local h = Instance.new("Highlight")
            h.Adornee = v
            h.Parent = v
            h.FillColor = Color3.fromRGB(0, 255, 255)
            h.FillTransparency = 0.8

            local fl = findDesc(v, "FL")
            if fl and fl:IsA("BasePart") and not fl:FindFirstChild("ModelNameDisplay") then
                local bb = Instance.new("BillboardGui")
                bb.Name = "ModelNameDisplay"
                bb.Adornee = fl
                bb.Size = UDim2.new(0, 200, 0, 25)
                bb.StudsOffset = Vector3.new(0, 2.5, 0)
                bb.AlwaysOnTop = true
                bb.Parent = fl
            end
        end
    end

    runsrv.Heartbeat:Connect(function()
        for _, v in ipairs(vfs:GetChildren()) do
            applyToVehicle(v)
        end
    end)
end

-- atm esp
local function atmmachineesp()
for _, obj in ipairs(workspace.ATMs:GetChildren()) do
    if obj:IsA("Model") and obj.Name == "ATM" then
        -- BillboardGui
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ATMLabel"
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = obj:FindFirstChildWhichIsA("BasePart") or obj.PrimaryPart

        -- TextLabel
        local label = Instance.new("TextLabel")
        label.Text = "ATM"
        label.Font = Enum.Font.Ubuntu
        label.TextScaled = false
        label.TextSize = 14
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 1, 0)
        label.TextStrokeTransparency = 0
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.Parent = billboard
        end
    end
end

-- player esp
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local ESPEnabled = false
local ESPholder = Instance.new("Folder", CoreGui)
ESPholder.Name = "ESP_Holder"

local connections = {}

-- get hrp
local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart")
end

-- round to closest decimal point
local function round(num, digits)
    local mult = 10 ^ digits
    return math.floor(num * mult + 0.5) / mult
end

local function createBoundingBox(part, color)
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = part
    box.Size = part.Size
    box.AlwaysOnTop = true
    box.ZIndex = 0
    box.Transparency = 0.5
    box.Color3 = color or Color3.new(0, 1, 0)
    box.Parent = ESPholder
    return box
end

local function getTeamColor(player)
    return player.TeamColor and player.TeamColor.Color or Color3.new(1, 1, 1) -- fallback to white
end

local function attachESP(plyr)
    local function onCharacterAdded(char)
        local head = char:WaitForChild("Head", 5)
        if not head then return end

        -- BillboardGui setup
        local BillboardGui = Instance.new("BillboardGui")
        local TextLabel = Instance.new("TextLabel")

        BillboardGui.Adornee = head
        BillboardGui.Name = plyr.Name .. "_Info"
        BillboardGui.Parent = ESPholder
        BillboardGui.Size = UDim2.new(0, 150, 0, 50)
        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
        BillboardGui.AlwaysOnTop = true

        TextLabel.Parent = BillboardGui
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.Font = Enum.Font.SourceSansBold
        TextLabel.TextSize = 14
        TextLabel.TextColor3 = Color3.new(1, 1, 1)
        TextLabel.TextStrokeTransparency = 0.5
        TextLabel.TextYAlignment = Enum.TextYAlignment.Center
        TextLabel.TextXAlignment = Enum.TextXAlignment.Center

        -- body parts
        local bodyParts = {
            "Head", "Torso", "UpperTorso", "LowerTorso",
            "LeftArm", "RightArm", "LeftLeg", "RightLeg",
            "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
            "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg"
        }

        local teamColor = getTeamColor(plyr)

        -- body parts
        for _, partName in ipairs(bodyParts) do
            local part = char:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                createBoundingBox(part, teamColor)
            end
        end

        -- update label text
        local conn = RunService.RenderStepped:Connect(function()
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            local root = getRoot(char)
            local localRoot = getRoot(Players.LocalPlayer.Character)

            if humanoid and root and localRoot then
                local dist = math.floor((localRoot.Position - root.Position).Magnitude)
                local health = round(humanoid.Health, 1)
                TextLabel.Text = string.format("Name: %s | Health: %.1f | Dist: %d", plyr.Name, health, dist)
            end
        end)

        table.insert(connections, conn)
    end

    if plyr.Character then
        onCharacterAdded(plyr.Character)
    end

    plyr.CharacterAdded:Connect(onCharacterAdded)
end

function enableESP()
    if ESPEnabled then return end
    ESPEnabled = true

    for _, plyr in pairs(Players:GetPlayers()) do
        if plyr ~= Players.LocalPlayer then
            attachESP(plyr)
        end
    end

    Players.PlayerAdded:Connect(function(plyr)
        if plyr ~= Players.LocalPlayer then
            attachESP(plyr)
        end
    end)
end

function disableESP()
    ESPEnabled = false
    ESPholder:ClearAllChildren()

    for _, conn in pairs(connections) do
        conn:Disconnect()
    end
    table.clear(connections)
end


-- safe esp
local function safeesp()
    for _, obj in ipairs(workspace.Safes:GetChildren()) do
        if obj:IsA("Model") and obj.Name == "Safe" then
            local goodPart = obj:FindFirstChild("Good")
            if goodPart and goodPart:IsA("BasePart") and goodPart.Transparency == 0 then
                -- Prevent duplicates
                if not obj:FindFirstChild("safeESPhighlight") then
                    -- Highlight
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "safeESPhighlight"
                    highlight.FillColor = Color3.fromRGB(152, 251, 152)
                    highlight.OutlineColor = Color3.fromRGB(100, 200, 100)
                    highlight.FillTransparency = 0.3
                    highlight.OutlineTransparency = 0.1
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Adornee = obj
                    highlight.Parent = obj
                end

                if not goodPart:FindFirstChild("SafeLabel") then
                    -- BillboardGui
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "SafeLabel"
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = goodPart

                    local label = Instance.new("TextLabel")
                    label.Text = "SAFE"
                    label.Font = Enum.Font.Ubuntu
                    label.TextScaled = false
                    label.TextSize = 14
                    label.TextColor3 = Color3.new(1, 1, 1)
                    label.BackgroundTransparency = 1
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.TextStrokeTransparency = 0
                    label.TextStrokeColor3 = Color3.new(0, 0, 0)
                    label.Parent = billboard
                end
            end
        end
    end
end

-------------------------------------------hideui

local allFeatures = {
    mainfeatures,
    worldfeatures,
    espfeatures,
    vehiclefeatures,
    playerfeatures,
    miscfeatures,
}

local function showOnly(targetFeature)
    for _, feature in ipairs(allFeatures) do
        feature.Visible = false
    end
    task.wait(0.02)
    targetFeature.Visible = true
end

-- function hipheight

local plr = game.Players.LocalPlayer

local tb = Hipheightextbox

local function applyhh()
    local char = plr.Character or plr.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local input = tonumber(tb.Text)
    if input then
        humanoid.HipHeight = math.clamp(input, 0, 999)
    else
        tb.Text = "Invaid input"
        wait(2)
        tb.Text = ""
    end
end















------ func above
------------ vehicles below

--check vehicles
local function checkVehiclesAndApplyActions(playerName, action, speedValue)
    for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
        local controlValues = vehicle:FindFirstChild("Control_Values")
        if controlValues then
            local owner = controlValues:FindFirstChild("Owner")
            if owner and owner.Value == playerName then
                if action == "NoCollide" then
                    setCollisionOff(vehicle.Body)
                    print("Collision turned off for vehicle owned by " .. playerName)
                elseif action == "InfiniteFuel" then
                    setInfiniteFuel(vehicle)
                elseif action == "SetHealth" then
                    setHealthValue(vehicle)
                end
            end
        end
    end
end



-- buttons
noCollideButton.MouseButton1Click:Connect(function()
	local playerName = playerNameBox.Text
	if playerName and playerName ~= "" then
		checkVehiclesAndApplyActions(playerName, "NoCollide")
	end
end)

infiniteFuelButton.MouseButton1Click:Connect(function()
	local playerName = playerNameBox.Text
	if playerName and playerName ~= "" then
		checkVehiclesAndApplyActions(playerName, "InfiniteFuel")
	end
end)

healthButton.MouseButton1Click:Connect(function()
	local playerName = playerNameBox.Text
	if playerName and playerName ~= "" then
		checkVehiclesAndApplyActions(playerName, "SetHealth")
	end
end)

brkObjectDestroyButton.MouseButton1Click:Connect(function()
	destroyFireHydrants()
	destroyFences()
	destroyStreetLamps()
end)

destroyTreesButton.MouseButton1Click:Connect(function()
	destroyFolderContents("Trees")
end)

removeTDButton.MouseButton1Click:Connect(function()
	destroyFolderContents("Traffic Lights")
	destroyFolderContents("TrafficDetections")
end)

deployableRemoveButton.MouseButton1Click:Connect(function()
	destroyFolderContents("Deployables")
end)

carflingButton.MouseButton1Click:Connect(function()
	carflings()
end)

ezLockPickButton.MouseButton1Click:Connect(function()
	ezlockpick()
end)

ezCrowbarButton.MouseButton1Click:Connect(function()
	ezcrowbar()
end)

DisbaleDmgButton.MouseButton1Click:Connect(function()
	disabledmg()
end)

nofogbutton.MouseButton1Click:Connect(function()
	fullbrighted()
end)

playerespenablebutton.MouseButton1Click:Connect(function()
    enableESP()
end)
playerespdisablebutton.MouseButton1Click:Connect(function()
	disableESP()
end)
atmespbutton.MouseButton1Click:Connect(function()
    atmmachineesp()
end)

vehicleespbutton.MouseButton1Click:Connect(function()
    bountycaresp()
end)

safeespbutton.MouseButton1Click:Connect(function()
    safeesp()
end)

HipHeightButton.MouseButton1Click:Connect(function()
    applyhh()
end)
---- func buttons ^
---- menu buttons v

mainmenu.MouseButton1Click:Connect(function()
    showOnly(mainfeatures)
end)

worldmenu.MouseButton1Click:Connect(function()
    showOnly(worldfeatures)
end)

espmenu.MouseButton1Click:Connect(function()
    showOnly(espfeatures)
end)

vehiclemenu.MouseButton1Click:Connect(function()
    showOnly(vehiclefeatures)
end)

playermenu.MouseButton1Click:Connect(function()
    showOnly(playerfeatures)
end)

miscmenu.MouseButton1Click:Connect(function()
 showOnly(miscfeatures)
end)


--logic and other values above
--color stuff below

local redLabel = Instance.new("TextLabel")
redLabel.Parent = miscfeatures
redLabel.Size = UDim2.new(0.1, 0, 0.07, 0)
redLabel.Position = UDim2.new(0.1, 0, 0.75, 0)
redLabel.Text = "Red"
redLabel.TextScaled = true
redLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
redLabel.BorderSizePixel = 0
redLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
redLabel.Font = Enum.Font.Ubuntu

local redBox = Instance.new("TextBox")
redBox.Parent = miscfeatures
redBox.Size = UDim2.new(0.1, 0, 0.07, 0)
redBox.Position = UDim2.new(0.2, 0, 0.75, 0)
redBox.PlaceholderText = "0-255"
redBox.Text = ""
redBox.TextScaled = true
redBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
redBox.BorderSizePixel = 0
redBox.TextColor3 = Color3.fromRGB(255, 255, 255)
redBox.Font = Enum.Font.Ubuntu

local greenLabel = Instance.new("TextLabel")
greenLabel.Parent = miscfeatures
greenLabel.Size = UDim2.new(0.1, 0, 0.07, 0)
greenLabel.Position = UDim2.new(0.1, 0, 0.82, 0)
greenLabel.Text = "Green"
greenLabel.TextScaled = true
greenLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
greenLabel.BorderSizePixel = 0
greenLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
greenLabel.Font = Enum.Font.Ubuntu

local greenBox = Instance.new("TextBox")
greenBox.Parent = miscfeatures
greenBox.Size = UDim2.new(0.1, 0, 0.07, 0)
greenBox.Position = UDim2.new(0.2, 0, 0.82, 0)
greenBox.PlaceholderText = "0-255"
greenBox.Text = ""
greenBox.TextScaled = true
greenBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
greenBox.BorderSizePixel = 0
greenBox.TextColor3 = Color3.fromRGB(255, 255, 255)
greenBox.Font = Enum.Font.Ubuntu

local blueLabel = Instance.new("TextLabel")
blueLabel.Parent = miscfeatures
blueLabel.Size = UDim2.new(0.1, 0, 0.07, 0)
blueLabel.Position = UDim2.new(0.1, 0, 0.89, 0)
blueLabel.Text = "Blue"
blueLabel.TextScaled = true
blueLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
blueLabel.BorderSizePixel = 0
blueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
blueLabel.Font = Enum.Font.Ubuntu

local blueBox = Instance.new("TextBox")
blueBox.Parent = miscfeatures
blueBox.Size = UDim2.new(0.1, 0, 0.07, 0)
blueBox.Position = UDim2.new(0.2, 0, 0.89, 0)
blueBox.PlaceholderText = "0-255"
blueBox.Text = ""
blueBox.TextScaled = true
blueBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
blueBox.BorderSizePixel = 0
blueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
blueBox.Font = Enum.Font.Ubuntu

local applyColorButton = Instance.new("TextButton")
applyColorButton.Parent = miscfeatures
applyColorButton.Size = UDim2.new(0.2, 0, 0.21, 0)
applyColorButton.Position = UDim2.new(0.3, 0, 0.75, 0)
applyColorButton.Text = "Apply Color"
applyColorButton.TextScaled = true
applyColorButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
applyColorButton.BorderSizePixel = 0
applyColorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
applyColorButton.Font = Enum.Font.Ubuntu

-- color fuction
local function applyColor()
	local red = tonumber(redBox.Text) or 0
	local green = tonumber(greenBox.Text) or 0
	local blue = tonumber(blueBox.Text) or 0

	-- rgb value clamp
	red = math.clamp(red, 0, 255)
	green = math.clamp(green, 0, 255)
	blue = math.clamp(blue, 0, 255)

	local newColor = Color3.fromRGB(red, green, blue)

	obdimage.BackgroundColor3 = newColor
	noCollideButton.BackgroundColor3 = newColor
	infiniteFuelButton.BackgroundColor3 = newColor
	healthButton.BackgroundColor3 = newColor
	applyColorButton.BackgroundColor3 = newColor
	brkObjectDestroyButton.BackgroundColor3 = newColor
	deployableRemoveButton.BackgroundColor3 = newColor
	destroyTreesButton.BackgroundColor3 = newColor
	removeTDButton.BackgroundColor3 = newColor
	carflingButton.BackgroundColor3 = newColor
	ezLockPickButton.BackgroundColor3 = newColor
	ezCrowbarButton.BackgroundColor3 = newColor
	DisbaleDmgButton.BackgroundColor3 = newColor
    nofogbutton.BackgroundColor3 = newColor
    playerespenablebutton.BackgroundColor3 = newColor
    playerespdisablebutton.BackgroundColor3 = newColor
    atmespbutton.BackgroundColor3 = newColor
    vehicleespbutton.BackgroundColor3 = newColor
    safeespbutton.BackgroundColor3 = newColor
    HipHeightButton.BackgroundColor3 = newColor
end

applyColorButton.MouseButton1Click:Connect(applyColor)

