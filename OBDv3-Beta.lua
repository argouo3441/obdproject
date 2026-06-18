-- Services (defined at the top for global access)
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

local Theme = {
	Primary = Color3.fromRGB(0, 0, 0),
	Text = Color3.fromRGB(255, 255, 255),
	Background = Color3.fromRGB(60, 60, 60),
	TabLight = Color3.fromRGB(100, 100, 100),
	ImageColor = Color3.fromRGB(255, 255, 255),
	Transparency = 0,
	CornerRadius = 8,
	OutlineThickness = 1.5,
	OutlineColor = Color3.fromRGB(0, 0, 0),
	Font = Enum.Font.Gotham,
	MinTextSize = 16,
	MaxTextSize = 24
}

local function styleElement(element, color, cornerOverride, applyTransparency, noStroke)
	element.BackgroundColor3 = color
	element.BackgroundTransparency = applyTransparency and Theme.Transparency or 0

	local corner = element:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", element)
	corner.CornerRadius = cornerOverride or UDim.new(0, Theme.CornerRadius)

	if noStroke then
		local existingStroke = element:FindFirstChildOfClass("UIStroke")
		if existingStroke then existingStroke:Destroy() end
	else
		local stroke = element:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke", element)
		stroke.Thickness = Theme.OutlineThickness
		stroke.Color = Theme.OutlineColor
		stroke.Transparency = 0
	end

	if element:IsA("TextLabel") or element:IsA("TextButton") or element:IsA("TextBox") then
		element.Font = Theme.Font
		element.TextSize = Theme.MinTextSize
	end

end

-- robloxgui injection ez detection bypass
local coreGui = game:GetService("CoreGui")
local robloxGui = coreGui.RobloxGui

--[[ DO NOT UNCOMMENT THIS OR YOU WILL GET BANNED FOR MAKING GUIS IN PLAYERGUI, THIS IS ONLY FOR TESTING IN STUDIO
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui) ]]
local screenGui = Instance.new("ScreenGui", robloxGui)
screenGui.Name = "aabfc322999332c8e4fc1a3a9a719643d60caef7670499cd290cb9c1c756aef9"

local MainFrame = Instance.new("Frame", screenGui)
MainFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.Active = true
styleElement(MainFrame, Theme.Background, nil, true)

local HelpText = Instance.new("TextLabel", MainFrame)
HelpText.Text = "Right-shift to toggle UI visibility"
HelpText.Size = UDim2.new(0.2, 0, 0.05, 0)
HelpText.Position = UDim2.new(0.79, 0, 0.95, 0)
HelpText.TextScaled = true
HelpText.BackgroundTransparency = 1
HelpText.Font = Enum.Font.Gotham
HelpText.TextColor3 = Theme.Text

local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 30)
styleElement(Header, Theme.Background, nil, true)
Header.Active = true

local isDragging = false
local dragStartPos
local frameStartPos

Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isDragging = true
		dragStartPos = input.Position
		frameStartPos = MainFrame.Position
	end
end)

Header.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isDragging = false
	end
end)
local UIS = game:GetService("UserInputService")
UIS.InputChanged:Connect(function(input)
	if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStartPos
		MainFrame.Position = UDim2.new(
			frameStartPos.X.Scale,
			frameStartPos.X.Offset + delta.X,
			frameStartPos.Y.Scale,
			frameStartPos.Y.Offset + delta.Y
		)
	end
end)

local HeaderImage = Instance.new("ImageLabel", Header)
HeaderImage.Size = UDim2.new(0.03, 0, 1, 0)
HeaderImage.Position = UDim2.new(0, 5, 0, 0)
HeaderImage.BackgroundTransparency = 1
HeaderImage.Image = "rbxassetid://84235374004078"
HeaderImage.ScaleType = Enum.ScaleType.Fit
HeaderImage.ImageColor3 = Theme.ImageColor

local SearchBox = Instance.new("TextBox", Header)
SearchBox.Size = UDim2.new(0.5, 0, 0.8, 0)
SearchBox.Position = UDim2.new(0.25, 0, 0.1, 0)
SearchBox.PlaceholderText = "Search..."
SearchBox.Text = ""
SearchBox.TextColor3 = Theme.Text
SearchBox.TextScaled = true
styleElement(SearchBox, Theme.TabLight, nil, false)

local MinimizeButton = Instance.new("TextButton", Header)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 0)
MinimizeButton.Text = "-"
MinimizeButton.TextScaled = true
MinimizeButton.TextColor3 = Color3.fromRGB(245, 180, 61)
styleElement(MinimizeButton, Theme.TabLight, nil, false)
MinimizeButton.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gp)
	if input.KeyCode == Enum.KeyCode.RightShift then
		MainFrame.Visible = not MainFrame.Visible
	end
end)

local CloseButton = Instance.new("TextButton", Header)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 0)
CloseButton.Text = "X"
CloseButton.TextScaled = true
CloseButton.TextColor3 = Color3.fromRGB(252, 87, 83)
styleElement(CloseButton, Theme.TabLight, nil, false)
CloseButton.MouseButton1Click:Connect(function() screenGui:Destroy() end)

local Categories = {}
for i = 1, 6 do
	local frame = Instance.new("ScrollingFrame", MainFrame)
	frame.Size = UDim2.new(0.8, -15, 0.95, -40)
	frame.Position = UDim2.new(0.2, 10, 0, 40)
	frame.ScrollBarThickness = 6
	frame.CanvasSize = UDim2.new(0, 0, 0, 0)
	styleElement(frame, Theme.Background, nil, true)
	frame.Visible = false

	local layout = Instance.new("UIListLayout", frame)
	layout.Padding = UDim.new(0, 10)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		frame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
	end)

	Categories[i] = frame
end

local TabFrame = Instance.new("ScrollingFrame", MainFrame)
TabFrame.Size = UDim2.new(0.2, -10, 0.95, -40)
TabFrame.Position = UDim2.new(0, 5, 0, 40)
TabFrame.ScrollBarThickness = 6
styleElement(TabFrame, Theme.Background, nil, true)

local UIListLayout = Instance.new("UIListLayout", TabFrame)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.Padding = UDim.new(0, 10)

local Tabs = {}
local function createTab(name, categoryFrame)
	local tab = Instance.new("TextButton", TabFrame)
	tab.Size = UDim2.new(1, -10, 0, 40)
	tab.Text = name
	tab.TextColor3 = Theme.Text
	styleElement(tab, Theme.TabLight, nil, false)

	tab.MouseButton1Click:Connect(function()
		for _, t in pairs(Tabs) do
			styleElement(t.Button, Theme.TabLight, nil, false)
			t.Frame.Visible = false
		end
		styleElement(tab, Theme.Primary, nil, false)
		categoryFrame.Visible = true
	end)

	table.insert(Tabs, {Button = tab, Frame = categoryFrame})
	return tab
end

createTab("Main 💰", Categories[1])
createTab("World 🌐", Categories[2])
createTab("ESP 👁️", Categories[3])
createTab("Vehicle 🚗", Categories[4])
createTab("Player 💪", Categories[5])
createTab("Misc ⚙️", Categories[6])
styleElement(Tabs[1].Button, Theme.Primary, nil, false)
Categories[1].Visible = true

local PlayerInputContainer = Instance.new("Frame", TabFrame)
PlayerInputContainer.Size = UDim2.new(1, -10, 0, 35)
PlayerInputContainer.Position = UDim2.new(0, 5, 1, -40)
PlayerInputContainer.BackgroundTransparency = 1

local PlayerNameBox = Instance.new("TextBox", PlayerInputContainer)
PlayerNameBox.Size = UDim2.new(0.7, -5, 1, 0)
PlayerNameBox.Position = UDim2.new(0, 0, 0, 0)
PlayerNameBox.PlaceholderText = "Player Name"
PlayerNameBox.Text = game.Players.LocalPlayer.Name
PlayerNameBox.TextScaled = true
PlayerNameBox.BackgroundColor3 = Theme.TabLight
PlayerNameBox.TextColor3 = Theme.Text
PlayerNameBox.Font = Theme.Font
PlayerNameBox.ClearTextOnFocus = false
styleElement(PlayerNameBox, Theme.TabLight, nil, false)

local ResetButton = Instance.new("ImageButton", PlayerInputContainer)
ResetButton.Size = UDim2.new(0.3, -5, 1, 0)
ResetButton.Position = UDim2.new(0.7, 5, 0, 0)
ResetButton.Image = "rbxassetid://97937752266117" 
ResetButton.BackgroundColor3 = Theme.TabLight
ResetButton.ImageColor3 = Theme.Text
ResetButton.ScaleType = Enum.ScaleType.Fit
styleElement(ResetButton, Theme.TabLight, nil, false)

ResetButton.MouseButton1Click:Connect(function()
	PlayerNameBox.Text = game.Players.LocalPlayer.Name
end)

local function getTargetPlayerName()
	return PlayerNameBox.Text
end

local function getList(parentFrame)
	local list = parentFrame:FindFirstChild("FunctionList")
	if not list then
		list = Instance.new("ScrollingFrame", parentFrame)
		list.Name = "FunctionList"
		list.Size = UDim2.new(1, -10, 1, -10)
		list.Position = UDim2.new(0, 5, 0, 5)
		list.BackgroundTransparency = 1
		list.ScrollBarThickness = 6
		local layout = Instance.new("UIListLayout", list)
		layout.Padding = UDim.new(0, 10)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			list.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
		end)

		local padding = Instance.new("UIPadding", list)
		padding.PaddingLeft = UDim.new(0, 10)
		padding.PaddingRight = UDim.new(0, 10)
		padding.PaddingTop = UDim.new(0, 10)
		padding.PaddingBottom = UDim.new(0, 10)
	end
	return list
end

local allToggleKnobs = {}

local function getBrightness(color)
	return (color.R * 0.299 + color.G * 0.587 + color.B * 0.114)
end

local function darkenColor(color, factor)
	return Color3.new(color.R * factor, color.G * factor, color.B * factor)
end

local function refreshButtons()
	for _, t in pairs(Tabs) do
		styleElement(t.Button, t.Frame.Visible and Theme.Primary or Theme.TabLight, nil, false)
	end
	for _, category in pairs(Categories) do
		styleElement(category, Theme.Background, nil, true)
		local list = category:FindFirstChild("FunctionList")
		if list then
			for _, item in pairs(list:GetChildren()) do
				if item:IsA("Frame") then
					local sliderBar = item:FindFirstChild("Frame")
					if sliderBar and sliderBar:FindFirstChild("Frame") and sliderBar:FindFirstChild("Frame"):FindFirstChildOfClass("TextLabel") then
						styleElement(sliderBar, Theme.TabLight, nil, false)
						local thumb = sliderBar:FindFirstChild("Frame")
						if thumb then
							styleElement(thumb, Theme.Primary, UDim.new(0, 12), false)
							local valueLabel = thumb:FindFirstChildOfClass("TextLabel")
							if valueLabel then
								valueLabel.TextColor3 = getBrightness(thumb.BackgroundColor3) > 0.5 and Color3.new(0,0,0) or Color3.new(1,1,1)
							end
						end
					elseif item:FindFirstChild("Frame") and item:FindFirstChild("TextLabel") then
						local switchFrame = item:FindFirstChild("Frame")
						if switchFrame and switchFrame:FindFirstChild("Frame") and not switchFrame:FindFirstChild("Frame"):FindFirstChildOfClass("TextLabel") then
							styleElement(switchFrame, Theme.TabLight, UDim.new(1, 0), false)
							local knob = switchFrame:FindFirstChild("Frame")
							if knob then
								styleElement(knob, Theme.Primary, UDim.new(1, 0), false)
							end
						end
					elseif item:FindFirstChild("TextButton") then
						local button = item:FindFirstChild("TextButton")
						if button then
							styleElement(button, Theme.Primary, nil, false, true)
							local isLightBg = getBrightness(Theme.Primary) > 0.5
							button.TextColor3 = isLightBg and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
							button.TextStrokeColor3 = isLightBg and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
						end
					end
				end
			end
		end
	end
	for _, toggleData in pairs(allToggleKnobs) do
		styleElement(toggleData.switchFrame, Theme.TabLight, UDim.new(1, 0), false)
		styleElement(toggleData.knob, Theme.Primary, UDim.new(1, 0), false)
		toggleData.label.TextColor3 = Theme.Text
	end
end


local function CreateFunctionSlider(name, description, minVal, maxVal, categoryIndex, formatStr, callback)
	local list = getList(Categories[categoryIndex])
	local itemFrame = Instance.new("Frame", list)
	itemFrame.Size = UDim2.new(1, -10, 0, 90)
	itemFrame.BackgroundTransparency = 1

	local label = Instance.new("TextLabel", itemFrame)
	label.Size = UDim2.new(1, 0, 0.3, 0)
	label.Text = name .. " - " .. description
	label.TextSize = 16
	label.TextColor3 = Theme.Text
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Font = Theme.Font

	local sliderBar = Instance.new("Frame", itemFrame)
	sliderBar.Size = UDim2.new(0.8, 0, 0.2, 0)
	sliderBar.Position = UDim2.new(0, 0, 0.5, 0)
	styleElement(sliderBar, Theme.TabLight, nil, false)

	local thumb = Instance.new("Frame", sliderBar)
	thumb.Size = UDim2.new(0, 24, 0, 24)
	thumb.Position = UDim2.new(0, 0, 0.5, -12)
	styleElement(thumb, Theme.Primary, UDim.new(0, 12), false)

	local valueLabel = Instance.new("TextLabel", thumb)
	valueLabel.Size = UDim2.new(1, 0, 1, 0)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Font = Theme.Font
	valueLabel.TextScaled = true
	valueLabel.TextStrokeTransparency = 0.8
	valueLabel.Text = string.format(formatStr, minVal)
	valueLabel.TextColor3 = getBrightness(thumb.BackgroundColor3) > 0.5 and Color3.new(0,0,0) or Color3.new(1,1,1)

	local dragging = false
	thumb.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
	end)
	thumb.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
	end)

	UserInputService.InputChanged:Connect(function(moveInput)
		if dragging and moveInput.UserInputType == Enum.UserInputType.MouseMovement then
			local maxRange = math.max(1, sliderBar.AbsoluteSize.X - thumb.Size.X.Offset)
			local relativeX = math.clamp(moveInput.Position.X - sliderBar.AbsolutePosition.X, 0, maxRange)
			thumb.Position = UDim2.new(0, relativeX, 0.5, -12)
			local value = minVal + (relativeX / maxRange) * (maxVal - minVal)
			valueLabel.Text = string.format(formatStr, value)
			valueLabel.TextColor3 = getBrightness(thumb.BackgroundColor3) > 0.5 and Color3.new(0,0,0) or Color3.new(1,1,1)
			callback(value)
		end
	end)

	-- function to set slider value
	local function setValue(value)
		value = math.clamp(value, minVal, maxVal)
		local maxRange = math.max(1, sliderBar.AbsoluteSize.X - thumb.Size.X.Offset)
		local relativeX = ((value - minVal) / (maxVal - minVal)) * maxRange
		thumb.Position = UDim2.new(0, relativeX, 0.5, -12)
		valueLabel.Text = string.format(formatStr, value)
		valueLabel.TextColor3 = getBrightness(thumb.BackgroundColor3) > 0.5 and Color3.new(0,0,0) or Color3.new(1,1,1)
		callback(value)
	end

	return setValue
end


local function tweenColors(startColors, endColors, duration)
	local startTime = tick()
	local elapsed = 0

	while elapsed < duration do
		elapsed = tick() - startTime
		local alpha = math.min(elapsed / duration, 1)
		local easedAlpha = alpha * alpha * (3 - 2 * alpha)

		Theme.Background = Color3.new(
			startColors.Background.R + (endColors.Background.R - startColors.Background.R) * easedAlpha,
			startColors.Background.G + (endColors.Background.G - startColors.Background.G) * easedAlpha,
			startColors.Background.B + (endColors.Background.B - startColors.Background.B) * easedAlpha
		)
		Theme.TabLight = Color3.new(
			startColors.TabLight.R + (endColors.TabLight.R - startColors.TabLight.R) * easedAlpha,
			startColors.TabLight.G + (endColors.TabLight.G - startColors.TabLight.G) * easedAlpha,
			startColors.TabLight.B + (endColors.TabLight.B - startColors.TabLight.B) * easedAlpha
		)
		Theme.Text = Color3.new(
			startColors.Text.R + (endColors.Text.R - startColors.Text.R) * easedAlpha,
			startColors.Text.G + (endColors.Text.G - startColors.Text.G) * easedAlpha,
			startColors.Text.B + (endColors.Text.B - startColors.Text.B) * easedAlpha
		)
		Theme.ImageColor = Color3.new(
			startColors.ImageColor.R + (endColors.ImageColor.R - startColors.ImageColor.R) * easedAlpha,
			startColors.ImageColor.G + (endColors.ImageColor.G - startColors.ImageColor.G) * easedAlpha,
			startColors.ImageColor.B + (endColors.ImageColor.B - startColors.ImageColor.B) * easedAlpha
		)

		styleElement(MainFrame, Theme.Background, nil, true)
		styleElement(Header, Theme.Background, nil, true)
		styleElement(TabFrame, Theme.Background, nil, true)
		HeaderImage.ImageColor3 = Theme.ImageColor
		HelpText.TextColor3 = Theme.Text

		for _, t in pairs(Tabs) do
			styleElement(t.Button, t.Frame.Visible and Theme.Primary or Theme.TabLight, nil, false)
		end

		styleElement(SearchBox, Theme.TabLight, nil, false)
		styleElement(MinimizeButton, Theme.TabLight, nil, false)
		styleElement(CloseButton, Theme.TabLight, nil, false)

		for _, category in pairs(Categories) do
			styleElement(category, Theme.Background, nil, true)
			local list = category:FindFirstChild("FunctionList")
			if list then
				for _, item in pairs(list:GetChildren()) do
					if item:IsA("Frame") then
						local sliderBar = item:FindFirstChild("Frame")
						if sliderBar and sliderBar:FindFirstChild("Frame") and sliderBar:FindFirstChild("Frame"):FindFirstChildOfClass("TextLabel") then

							styleElement(sliderBar, Theme.TabLight, nil, false)
							local thumb = sliderBar:FindFirstChild("Frame")
							if thumb then
								styleElement(thumb, Theme.Primary, UDim.new(0, 12), false)
								local valueLabel = thumb:FindFirstChildOfClass("TextLabel")
								if valueLabel then
									valueLabel.TextColor3 = getBrightness(thumb.BackgroundColor3) > 0.5 and Color3.new(0,0,0) or Color3.new(1,1,1)
								end
							end

							local label = item:FindFirstChildOfClass("TextLabel")
							if label then
								label.TextColor3 = Theme.Text
							end
						elseif item:FindFirstChild("Frame") and item:FindFirstChild("TextLabel") then
							local switchFrame = item:FindFirstChild("Frame")
							if switchFrame and switchFrame:FindFirstChild("Frame") and not switchFrame:FindFirstChild("Frame"):FindFirstChildOfClass("TextLabel") then

								styleElement(switchFrame, Theme.TabLight, UDim.new(1, 0), false)
								local knob = switchFrame:FindFirstChild("Frame")
								if knob then
									styleElement(knob, Theme.Primary, UDim.new(1, 0), false)
								end

								local label = item:FindFirstChildOfClass("TextLabel")
								if label then
									label.TextColor3 = Theme.Text
								end
							end
						elseif item:FindFirstChild("TextButton") then

							local button = item:FindFirstChild("TextButton")
							if button then
								styleElement(button, Theme.Primary, nil, false)
								local isLightBg = getBrightness(Theme.Primary) > 0.5
								button.TextColor3 = isLightBg and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
								button.TextStrokeColor3 = isLightBg and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
							end

							local descLabel = item:FindFirstChildOfClass("TextLabel")
							if descLabel then
								descLabel.TextColor3 = Theme.Text
							end
						end
					end
				end
			end
		end

		task.wait()
	end

	Theme.Background = endColors.Background
	Theme.TabLight = endColors.TabLight
	Theme.Text = endColors.Text
	Theme.ImageColor = endColors.ImageColor
end

local function CreateFunctionToggle(name, description, categoryIndex, callback)
	local list = getList(Categories[categoryIndex])
	local itemFrame = Instance.new("Frame", list)
	itemFrame.Size = UDim2.new(1, -10, 0, 40)
	itemFrame.BackgroundTransparency = 1

	local switchFrame = Instance.new("Frame", itemFrame)
	switchFrame.Size = UDim2.new(0, 60, 1, -4)
	switchFrame.Position = UDim2.new(0, 0, 0, 2)
	styleElement(switchFrame, Theme.TabLight, UDim.new(1, 0), false)

	local knob = Instance.new("Frame", switchFrame)
	knob.Size = UDim2.new(0, 24, 0, 24)
	knob.Position = UDim2.new(0, 4, 0.5, -12)
	styleElement(knob, Theme.Primary, UDim.new(1, 0), false)

	local label = Instance.new("TextLabel", itemFrame)
	label.Size = UDim2.new(1, -70, 1, 0)
	label.Position = UDim2.new(0, 70, 0, 0)
	label.Text = name .. " - " .. description
	label.TextSize = 16
	label.TextColor3 = Theme.Text
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Font = Theme.Font

	local state = false

	table.insert(allToggleKnobs, {
		knob = knob,
		switchFrame = switchFrame,
		label = label,
		getState = function() return state end
	})

	switchFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			state = not state
			local goalPos = state and UDim2.new(0, 32, 0.5, -12) or UDim2.new(0, 4, 0.5, -12)
			TweenService:Create(knob, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = goalPos
			}):Play()
			callback(state)
		end
	end)
end

local function CreateFunctionButton(name, description, func, categoryIndex)
	local list = getList(Categories[categoryIndex])
	local itemFrame = Instance.new("Frame", list)
	itemFrame.Size = UDim2.new(1, -10, 0, 50)
	itemFrame.BackgroundTransparency = 1

	local button = Instance.new("TextButton", itemFrame)
	button.Size = UDim2.new(0.4, 0, 1, 0)
	button.Text = name
	local isLightBg = getBrightness(Theme.Primary) > 0.5
	button.TextColor3 = isLightBg and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
	button.TextStrokeColor3 = isLightBg and Color3.new(1, 1, 1) or Color3.new(0, 0, 0)
	button.TextStrokeTransparency = 1
	styleElement(button, Theme.Primary)

	local descLabel = Instance.new("TextLabel", itemFrame)
	descLabel.Size = UDim2.new(0.6, -5, 1, 0)
	descLabel.Position = UDim2.new(0.4, 5, 0, 0)
	descLabel.Text = description
	descLabel.TextColor3 = Theme.Text
	descLabel.TextSize = 16
	descLabel.BackgroundTransparency = 1
	descLabel.TextXAlignment = Enum.TextXAlignment.Left
	descLabel.Font = Theme.Font

	button.MouseButton1Click:Connect(func)
end

CreateFunctionSlider("Transparency", "adjust UI transparency", 0, 1, 6, "%.2f", function(val)
	Theme.Transparency = val
	styleElement(MainFrame, Theme.Background, nil, true)
	styleElement(Header, Theme.Background, nil, true)
	styleElement(TabFrame, Theme.Background, nil, true)
	HelpText.TextColor3 = Theme.Text
	for _, category in pairs(Categories) do
		styleElement(category, Theme.Background, nil, true)
	end
end)

CreateFunctionSlider("Red", "adjust red channel", 0, 255, 6, "%d", function(val)
	Theme.Primary = Color3.fromRGB(math.floor(val), math.floor(Theme.Primary.G * 255), math.floor(Theme.Primary.B * 255))
	refreshButtons()
end)

CreateFunctionSlider("Green", "adjust green channel", 0, 255, 6, "%d", function(val)
	Theme.Primary = Color3.fromRGB(math.floor(Theme.Primary.R * 255), math.floor(val), math.floor(Theme.Primary.B * 255))
	refreshButtons()
end)

CreateFunctionSlider("Blue", "adjust blue channel", 0, 255, 6, "%d", function(val)
	Theme.Primary = Color3.fromRGB(math.floor(Theme.Primary.R * 255), math.floor(Theme.Primary.G * 255), math.floor(val))
	refreshButtons()
end)

CreateFunctionToggle("Light/Dark Mode", "switch between light and dark mode", 6, function(state)
	local startColors = {
		Background = Theme.Background,
		TabLight = Theme.TabLight,
		Text = Theme.Text,
		ImageColor = Theme.ImageColor
	}

	local endColors
	if state then
		endColors = {
			Background = Color3.fromRGB(230,230,230),
			TabLight = Color3.fromRGB(200,200,200),
			Text = Color3.fromRGB(0, 0, 0),
			ImageColor = Color3.fromRGB(0, 0, 0)
		}
	else
		endColors = {
			Background = Color3.fromRGB(60,60,60),
			TabLight = Color3.fromRGB(100,100,100),
			Text = Color3.fromRGB(255, 255, 255),
			ImageColor = Color3.fromRGB(255, 255, 255)
		}
	end

	tweenColors(startColors, endColors, 0.4)
end)


SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	local query = SearchBox.Text:lower()
	for _, category in pairs(Categories) do
		local list = category:FindFirstChild("FunctionList")
		if list then
			for _, item in pairs(list:GetChildren()) do
				if item:IsA("Frame") then
					local label = item:FindFirstChildOfClass("TextLabel")
					item.Visible = (query == "") or (label and string.find(label.Text:lower(), query))
				end
			end
		end
	end
end)


--[[
=======================================================================
                            ⇧ USER INTERFACE ⇧
                            ⇩ FUNCTIONS      ⇩ 
=======================================================================
]]

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
local infiniteFuelLoops = {}

local function toggleInfiniteFuel(vehicle, state)
	local vehicleId = vehicle.Name

	if state then
		local controlValues = vehicle:FindFirstChild("Control_Values")
		if controlValues then
			local currentFuel = controlValues:FindFirstChild("CurrentFuel")
			if currentFuel then
				infiniteFuelLoops[vehicleId] = true
				task.spawn(function()
					while infiniteFuelLoops[vehicleId] do
						currentFuel.Value = 150
						task.wait(2)
					end
				end)
			end
		end
	else
		infiniteFuelLoops[vehicleId] = nil
	end
end

local vehicleHealthLoops = {}

local function toggleVehicleGod(vehicle, state)
	local vehicleId = vehicle.Name

	if state then
		local controlValues = vehicle:FindFirstChild("Control_Values")
		if controlValues then
			local CurrentHealth = controlValues:FindFirstChild("Health")
			if CurrentHealth then
				vehicleHealthLoops[vehicleId] = true
				task.spawn(function()
					while vehicleHealthLoops[vehicleId] do
						CurrentHealth.Value = 150
						task.wait(1)
					end
				end)
			end
		end
	else
		vehicleHealthLoops[vehicleId] = nil
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
local carflingCoroutine = nil

local function carflings()
	local runsrv = game:GetService("RunService")
	local Players = game.Players
	local plr = Players.LocalPlayer

	-- stop if running
	if carflingCoroutine then 
		coroutine.close(carflingCoroutine)
		carflingCoroutine = nil
		return 
	end

	local humanoid = plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then return end

	local diedConnection
	diedConnection = humanoid.Died:Connect(function()
		if carflingCoroutine then
			coroutine.close(carflingCoroutine)
			carflingCoroutine = nil
		end
		diedConnection:Disconnect()
	end)

	carflingCoroutine = coroutine.create(function()
		repeat runsrv.Heartbeat:Wait()
			local char = plr.Character
			local root = char and char.PrimaryPart
			humanoid = char and char:FindFirstChildWhichIsA("Humanoid")

			if not root or not humanoid then break end

			local vel, movel = root.Velocity, 0.1

			root.Velocity = vel * 1000000 + Vector3.new(0, 1000000, 0)

			runsrv.RenderStepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel
			end

			runsrv.Stepped:Wait()
			if char and char.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		until not carflingCoroutine or not humanoid.Sit

		carflingCoroutine = nil
		diedConnection:Disconnect()
	end)

	coroutine.resume(carflingCoroutine)
end

-- ez lockpick
local function ezlockpick()
	local lockpicktext = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Lockpick.InfoText
	local redLine = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Lockpick.Pick.RedLine
	redLine.Size = UDim2.new(1, 0, 1, 0)
	redLine.BackgroundTransparency = 1
	lockpicktext.Text = "OBD ON TOP, Click until you successfully break into the house."
	wait(5)
	lockpicktext.Text = "off"
end

-- ez crowbar
local function ezcrowbar()
	local crowbartext = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Crowbar.Main.GradientFrame.TextLabel
	local crowbar = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.Crowbar.Main.Game.Target
	crowbar.Size = UDim2.new(3, 0, 0.96, 0)
	crowbartext.Text = "OBD ON TOP, Click until you successfully break into the car."
	wait(5)
	crowbartext.Text = "off"
end



-- damagehandler
local function disabledmg()
	game.Players.LocalPlayer.Character.DamageHandler:Destroy()
end

-- the fog is NOT coming (skidded from infinite yield lmao)

local brightLoop

local function toggleFullbright(state)
	if state then
		if brightLoop then brightLoop:Disconnect() end
		local function brightFunc()
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end
		brightLoop = RunService.RenderStepped:Connect(brightFunc)
	else
		if brightLoop then
			brightLoop:Disconnect()
			brightLoop = nil
		end
		Lighting.Brightness = 1
		Lighting.ClockTime = 12
		Lighting.FogEnd = 1000
		Lighting.GlobalShadows = true
		Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end
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
local BountyESPEnabled = false
local BountyESPholder = Instance.new("Folder", game:GetService("CoreGui"))
BountyESPholder.Name = "BountyESP_Holder"

local bountyESPConnection = nil
local trackedBountyVehicles = {}

local function removeBountyESP(vehicleName)
	local billboard = BountyESPholder:FindFirstChild(vehicleName .. "_BountyLabel")
	if billboard then billboard:Destroy() end

	trackedBountyVehicles[vehicleName] = nil
end

local function applyBountyESPToVehicle(vehicle)
	if not vehicle or vehicle.Parent == nil then return end
	if not vehicle:IsA("Model") then return end

	removeBountyESP(vehicle.Name)

	local highlight = Instance.new("Highlight")
	highlight.Name = vehicle.Name .. "_BountyHighlight"
	highlight.Adornee = vehicle
	highlight.Parent = BountyESPholder
	highlight.FillColor = Color3.fromRGB(0, 255, 255)
	highlight.FillTransparency = 0.8
	highlight.OutlineColor = Color3.fromRGB(0, 200, 200)
	highlight.OutlineTransparency = 0

	local fl = findDesc(vehicle, "FL")
	local billboard

	if fl and fl:IsA("BasePart") then
		billboard = Instance.new("BillboardGui")
		billboard.Name = vehicle.Name .. "_BountyLabel"
		billboard.Adornee = fl
		billboard.Size = UDim2.new(0, 200, 0, 25)
		billboard.StudsOffset = Vector3.new(0, 2.5, 0)
		billboard.AlwaysOnTop = true
		billboard.Parent = BountyESPholder

		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.Text = vehicle.Name
		label.Font = Enum.Font.SourceSansBold
		label.TextSize = 14
		label.TextColor3 = Color3.fromRGB(0, 255, 255)
		label.TextStrokeTransparency = 0.5
		label.TextStrokeColor3 = Color3.new(0, 0, 0)
		label.Parent = billboard
	end

	trackedBountyVehicles[vehicle.Name] = {
		vehicle = vehicle,
		highlight = highlight,
		billboard = billboard
	}
end

local function startBountyESPUpdate()
	if bountyESPConnection then return end

	local vfs = workspace:FindFirstChild("BountyVehicles")
	if not vfs then return end
	local vehiclesFolder = vfs:FindFirstChild("Vehicles")
	if not vehiclesFolder then return end

	bountyESPConnection = RunService.RenderStepped:Connect(function()
		if not BountyESPEnabled then return end

		for _, vehicle in pairs(vehiclesFolder:GetChildren()) do
			if vehicle:IsA("Model") then
				local tracked = trackedBountyVehicles[vehicle.Name]

				if vehicle.Parent and (not tracked or tracked.vehicle ~= vehicle) then
					applyBountyESPToVehicle(vehicle)
				end

			elseif trackedBountyVehicles[vehicle.Name] and (not vehicle or vehicle.Parent == nil) then
				removeBountyESP(vehicle.Name)
			end
		end

		for vehicleName, data in pairs(trackedBountyVehicles) do
			if not vehiclesFolder:FindFirstChild(vehicleName) then
				removeBountyESP(vehicleName)
			end
		end
	end)
end

local function stopBountyESPUpdate()
	if bountyESPConnection then
		bountyESPConnection:Disconnect()
		bountyESPConnection = nil
	end
end

function enableBountyESP()
	if BountyESPEnabled then return end
	BountyESPEnabled = true

	local vfs = workspace:FindFirstChild("BountyVehicles")
	if vfs then
		local vehiclesFolder = vfs:FindFirstChild("Vehicles")
		if vehiclesFolder then
			for _, vehicle in pairs(vehiclesFolder:GetChildren()) do
				if vehicle:IsA("Model") then
					applyBountyESPToVehicle(vehicle)
				end
			end
		end
	end

	startBountyESPUpdate()
end

function disableBountyESP()
	BountyESPEnabled = false

	stopBountyESPUpdate()

	BountyESPholder:ClearAllChildren()
	trackedBountyVehicles = {}
end

-- atm esp
local ATMESPEnabled = false
local ATMESPholder = Instance.new("Folder", CoreGui)
ATMESPholder.Name = "ATMESP_Holder"

local atmESPConnection = nil
local trackedATMs = {} 
local atmCounter = 0

local function removeATMESP(atmInstance)
	local data = trackedATMs[atmInstance]
	if not data then return end

	if data.box then data.box:Destroy() end
	if data.billboard then data.billboard:Destroy() end

	trackedATMs[atmInstance] = nil
end

local function applyATMESP(obj)
	if not obj or obj.Parent == nil then return end
	if not obj:IsA("Model") then return end

	removeATMESP(obj)

	local mainPart = obj:FindFirstChildWhichIsA("BasePart") or obj.PrimaryPart
	if not mainPart then return end

	atmCounter = atmCounter + 1
	local uniqueId = "ATM_" .. atmCounter

	local box = Instance.new("BoxHandleAdornment")
	box.Name = uniqueId .. "_Box"
	box.Adornee = obj
	box.Size = obj:GetExtentsSize()
	box.AlwaysOnTop = true
	box.ZIndex = 0
	box.Transparency = 0.5
	box.Color3 = Color3.fromRGB(0, 255, 100)
	box.Parent = ATMESPholder

	local billboard = Instance.new("BillboardGui")
	billboard.Name = uniqueId .. "_Label"
	billboard.Adornee = mainPart
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = ATMESPholder

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

	trackedATMs[obj] = {
		atm = obj,
		box = box,
		billboard = billboard
	}
end

local function startATMESPUpdate()
	if atmESPConnection then return end

	local atmsFolder = workspace:FindFirstChild("ATMs")
	if not atmsFolder then return end

	atmESPConnection = RunService.RenderStepped:Connect(function()
		if not ATMESPEnabled then return end

		for _, obj in pairs(atmsFolder:GetChildren()) do
			if obj:IsA("Model") and obj.Name == "ATM" then
				if not trackedATMs[obj] then
					applyATMESP(obj)
				end
			end
		end

		for atmInstance, data in pairs(trackedATMs) do
			if not atmInstance or atmInstance.Parent == nil or atmInstance.Parent ~= atmsFolder then
				removeATMESP(atmInstance)
			end
		end
	end)
end

local function stopATMESPUpdate()
	if atmESPConnection then
		atmESPConnection:Disconnect()
		atmESPConnection = nil
	end
end

function enableATMESP()
	if ATMESPEnabled then return end
	ATMESPEnabled = true

	local atmsFolder = workspace:FindFirstChild("ATMs")
	if atmsFolder then
		for _, obj in pairs(atmsFolder:GetChildren()) do
			if obj:IsA("Model") and obj.Name == "ATM" then
				applyATMESP(obj)
			end
		end
	end

	startATMESPUpdate()
end

function disableATMESP()
	ATMESPEnabled = false
	stopATMESPUpdate()
	ATMESPholder:ClearAllChildren()
	trackedATMs = {}
end

local ESPEnabled = false
local ESPholder = Instance.new("Folder", CoreGui)
ESPholder.Name = "ESP_Holder"

local espUpdateConnection = nil
local trackedPlayers = {}

local function getRoot(char)
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function round(num, digits)
	local mult = 10 ^ digits
	return math.floor(num * mult + 0.5) / mult
end

local function getTeamColor(player)
	return player.TeamColor and player.TeamColor.Color or Color3.new(1, 1, 1)
end

local function removePlayerESP(plyrName)
	local billboard = ESPholder:FindFirstChild(plyrName .. "_Info")
	if billboard then billboard:Destroy() end

	for _, item in pairs(ESPholder:GetChildren()) do
		if item:IsA("BoxHandleAdornment") and item.Name:sub(1, #plyrName) == plyrName then
			item:Destroy()
		end
	end

	trackedPlayers[plyrName] = nil
end

local function applyESPToCharacter(plyr, char)
	if not char or char.Parent == nil then return end

	local head = char:FindFirstChild("Head")
	if not head then return end

	removePlayerESP(plyr.Name)

	local teamColor = getTeamColor(plyr)

	local BillboardGui = Instance.new("BillboardGui")
	BillboardGui.Adornee = head
	BillboardGui.Name = plyr.Name .. "_Info"
	BillboardGui.Parent = ESPholder
	BillboardGui.Size = UDim2.new(0, 150, 0, 50)
	BillboardGui.StudsOffset = Vector3.new(0, 4, 0)
	BillboardGui.AlwaysOnTop = true

	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = BillboardGui
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.TextSize = 14
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0.5
	TextLabel.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel.TextXAlignment = Enum.TextXAlignment.Center


	local bodyParts = {
		"Head", "Torso", "UpperTorso", "LowerTorso",
		"LeftArm", "RightArm", "LeftLeg", "RightLeg",
		"LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm",
		"LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg"
	}

	for _, partName in ipairs(bodyParts) do
		local part = char:FindFirstChild(partName)
		if part and part:IsA("BasePart") then
			local box = Instance.new("BoxHandleAdornment")
			box.Name = plyr.Name .. "_Box_" .. partName
			box.Adornee = part
			box.Size = part.Size
			box.AlwaysOnTop = true
			box.ZIndex = 0
			box.Transparency = 0.5
			box.Color3 = teamColor
			box.Parent = ESPholder
		end
	end

	trackedPlayers[plyr.Name] = {
		character = char,
		label = TextLabel,
		billboard = BillboardGui
	}
end

-- continuous update loop
local function startESPUpdate()
	if espUpdateConnection then return end

	espUpdateConnection = RunService.RenderStepped:Connect(function()
		if not ESPEnabled then return end

		for _, plyr in pairs(Players:GetPlayers()) do
			if plyr ~= Players.LocalPlayer then
				local char = plyr.Character
				local tracked = trackedPlayers[plyr.Name]

				if char and (not tracked or tracked.character ~= char) then
					applyESPToCharacter(plyr, char)
					tracked = trackedPlayers[plyr.Name]
				end

				if tracked and tracked.character and tracked.character.Parent then
					local humanoid = tracked.character:FindFirstChildOfClass("Humanoid")
					local root = getRoot(tracked.character)
					local localRoot = getRoot(Players.LocalPlayer.Character)

					if humanoid and root and localRoot then
						local dist = math.floor((localRoot.Position - root.Position).Magnitude)
						local health = round(humanoid.Health, 1)
						tracked.label.Text = string.format("Name: %s | Health: %.1f | Dist: %d", plyr.Name, health, dist)
					end
				elseif tracked and (not tracked.character or tracked.character.Parent == nil) then
					removePlayerESP(plyr.Name)
				end
			end
		end

		for plyrName, _ in pairs(trackedPlayers) do
			if not Players:FindFirstChild(plyrName) then
				removePlayerESP(plyrName)
			end
		end
	end)
end

local function stopESPUpdate()
	if espUpdateConnection then
		espUpdateConnection:Disconnect()
		espUpdateConnection = nil
	end
end

function enableESP()
	if ESPEnabled then return end
	ESPEnabled = true

	for _, plyr in pairs(Players:GetPlayers()) do
		if plyr ~= Players.LocalPlayer and plyr.Character then
			applyESPToCharacter(plyr, plyr.Character)
		end
	end

	startESPUpdate()
end

function disableESP()
	ESPEnabled = false

	stopESPUpdate()

	ESPholder:ClearAllChildren()
	trackedPlayers = {}
end

-- safe esp
local SafeESPEnabled = false
local SafeESPholder = Instance.new("Folder", CoreGui)
SafeESPholder.Name = "SafeESP_Holder"

local safeESPConnection = nil
local trackedSafes = {}

local function removeSafeESP(safeName)
	local highlight = SafeESPholder:FindFirstChild(safeName .. "_Highlight")
	if highlight then highlight:Destroy() end

	local billboard = SafeESPholder:FindFirstChild(safeName .. "_Label")
	if billboard then billboard:Destroy() end

	trackedSafes[safeName] = nil
end

local function applySafeESP(obj)
	if not obj or obj.Parent == nil then return end
	if not obj:IsA("Model") then return end

	local goodPart = obj:FindFirstChild("Good")
	if not goodPart or not goodPart:IsA("BasePart") or goodPart.Transparency ~= 0 then return end

	removeSafeESP(obj.Name)

	local highlight = Instance.new("Highlight")
	highlight.Name = obj.Name .. "_Highlight"
	highlight.FillColor = Color3.fromRGB(152, 251, 152)
	highlight.OutlineColor = Color3.fromRGB(100, 200, 100)
	highlight.FillTransparency = 0.3
	highlight.OutlineTransparency = 0.1
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	highlight.Adornee = obj
	highlight.Parent = SafeESPholder

	local billboard = Instance.new("BillboardGui")
	billboard.Name = obj.Name .. "_Label"
	billboard.Adornee = goodPart
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = SafeESPholder

	local label = Instance.new("TextLabel")
	label.Text = "Unopened Safe"
	label.Font = Enum.Font.Ubuntu
	label.TextScaled = false
	label.TextSize = 14
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1, 0, 1, 0)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.new(0, 0, 0)
	label.Parent = billboard

	trackedSafes[obj.Name] = {
		safe = obj,
		highlight = highlight,
		billboard = billboard
	}
end

local function startSafeESPUpdate()
	if safeESPConnection then return end

	local safesFolder = workspace:FindFirstChild("Safes")
	if not safesFolder then return end

	safeESPConnection = RunService.RenderStepped:Connect(function()
		if not SafeESPEnabled then return end

		for _, obj in pairs(safesFolder:GetChildren()) do
			if obj:IsA("Model") and obj.Name == "Safe" then
				local goodPart = obj:FindFirstChild("Good")
				local tracked = trackedSafes[obj.Name]

				if goodPart and goodPart:IsA("BasePart") and goodPart.Transparency == 0 then
					if obj.Parent and (not tracked or tracked.safe ~= obj) then
						applySafeESP(obj)
					end
				else
					if tracked then
						removeSafeESP(obj.Name)
					end
				end
			elseif trackedSafes[obj.Name] and (not obj or obj.Parent == nil) then
				removeSafeESP(obj.Name)
			end
		end

		for safeName, data in pairs(trackedSafes) do
			if not safesFolder:FindFirstChild(safeName) then
				removeSafeESP(safeName)
			end
		end
	end)
end

local function stopSafeESPUpdate()
	if safeESPConnection then
		safeESPConnection:Disconnect()
		safeESPConnection = nil
	end
end

function enableSafeESP()
	if SafeESPEnabled then return end
	SafeESPEnabled = true

	local safesFolder = workspace:FindFirstChild("Safes")
	if safesFolder then
		for _, obj in pairs(safesFolder:GetChildren()) do
			if obj:IsA("Model") and obj.Name == "Safe" then
				local goodPart = obj:FindFirstChild("Good")
				if goodPart and goodPart:IsA("BasePart") and goodPart.Transparency == 0 then
					applySafeESP(obj)
				end
			end
		end
	end

	startSafeESPUpdate()
end

function disableSafeESP()
	SafeESPEnabled = false
	stopSafeESPUpdate()
	SafeESPholder:ClearAllChildren()
	trackedSafes = {}
end

local plr = game.Players.LocalPlayer
local currentHipHeight = 0
local setHipHeightSlider = nil 

local function applyHipHeight(value)
	currentHipHeight = value
	local char = plr.Character
	if not char then return end
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.HipHeight = value
	end
end

plr.CharacterAdded:Connect(function(char)
	char:WaitForChild("Humanoid", 5)
	task.wait(0.1)
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if humanoid and currentHipHeight > 0 then
		humanoid.HipHeight = currentHipHeight
		if setHipHeightSlider then
			setHipHeightSlider(currentHipHeight)
		end
	end
end)

--cwalk
local runsrv = game:GetService("RunService")
local plr = game.Players.LocalPlayer

local cwalkConnection = nil
local cwalkActive = false
local cwalkSpeed = 0 

local function updateCFrameWalk()
    if cwalkConnection then
        cwalkConnection:Disconnect()
        cwalkConnection = nil
    end

    if cwalkActive and cwalkSpeed > 0 then
        cwalkConnection = runsrv.Stepped:Connect(function()
            local character = plr.Character
            if not character then return end
            
            local h = character:FindFirstChildWhichIsA("Humanoid")
            if h and h.MoveDirection ~= Vector3.new(0, 0, 0) and character.PrimaryPart then
                local amplification = Vector3.new(cwalkSpeed, cwalkSpeed, cwalkSpeed) * h.MoveDirection
                character:MoveTo(character.PrimaryPart.Position + amplification)
            end
        end)
    end
end

-- car speed

--[[
=======================================================================
                            ⇧ FUNCTIONS      ⇧
                            ⇩ VEHICLES       ⇩ 
=======================================================================
]]


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
					toggleInfiniteFuel(vehicle)
				elseif action == "SetHealth" then
					toggleVehicleGod(vehicle)
				end
			end
		end
	end
end

-- ============================================
-- BUTTON WIRING BELOW
-- ============================================

CreateFunctionButton("Destroy Fire Hydrants", "removes all fire hydrants", destroyFireHydrants, 2)
CreateFunctionButton("Destroy Fences", "removes all fences", destroyFences, 2)
CreateFunctionButton("Destroy Street Lamps", "removes all street lamps", destroyStreetLamps, 2)
CreateFunctionButton("Destroy Traffic Detections", "removes traffic detections", destroyTrafficDetections, 2)
CreateFunctionButton("Destroy Traffic Lights", "removes all traffic lights", destroyTrafficLights, 2)
CreateFunctionButton("Destroy Deployables", "removes deployables", destroyDeployables, 2)
CreateFunctionButton("Destroy Trees", "removes all trees", destroyTrees, 2)
CreateFunctionToggle("Fullbright", "removes fog and shadows", 2, toggleFullbright)

CreateFunctionToggle("Bounty Car ESP", "highlights bounty vehicles", 3, function(state)
	if state then enableBountyESP() else disableBountyESP() end
end)
CreateFunctionToggle("ATM ESP", "shows all ATMs with bounding box", 3, function(state)
	if state then enableATMESP() else disableATMESP() end
end)
CreateFunctionToggle("Safe ESP", "highlights unopened safes", 3, function(state)
	if state then enableSafeESP() else disableSafeESP() end
end)
CreateFunctionToggle("Player ESP", "shows players through walls", 3, function(state)
	if state then enableESP() else disableESP() end
end)

CreateFunctionButton("Car Fling", "makes your car fling others (get out of car to stop)", carflings, 4)
CreateFunctionButton("Vehicle No Collide", "disables collision on target vehicle", function() checkVehiclesAndApplyActions(getTargetPlayerName(), "NoCollide") end, 4)
CreateFunctionToggle("Infinite Fuel", "unlimited vehicle fuel", 4, function(state)
	for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
		local controlValues = vehicle:FindFirstChild("Control_Values")
		if controlValues then
			local owner = controlValues:FindFirstChild("Owner")
			if owner and owner.Value == getTargetPlayerName() then
				toggleInfiniteFuel(vehicle, state)
			end
		end
	end
end)
CreateFunctionToggle("Vehicle God Mode", "sets vehicle health to max", 4, function(state)
	for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
		local controlValues = vehicle:FindFirstChild("Control_Values")
		if controlValues then
			local owner = controlValues:FindFirstChild("Owner")
			if owner and owner.Value == getTargetPlayerName() then
				toggleVehicleGod(vehicle, state)
			end
		end
	end
end)

CreateFunctionButton("Disable DamageHandler", "removes damage handler", disabledmg, 5)
CreateFunctionButton("Reset Hip Height", "resets to 2", function()
	currentHipHeight = 2
	local char = plr.Character
	if char then
		local humanoid = char:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.HipHeight = 2
		end
	end
	if setHipHeightSlider then
		setHipHeightSlider(2)
	end
end, 5)

setHipHeightSlider = CreateFunctionSlider("Hip Height", "set character hip height", 0, 1000, 5, "%.1f", function(value)
	applyHipHeight(value)
end)

CreateFunctionSlider("CFrameWalk", "adjust cwalkspeed", 0, 50, 5, "%.1f", function(value)
    cwalkSpeed = value
    updateCFrameWalk()
end)

CreateFunctionToggle("CFrameWalk", "walkspeed but with cframe to avoid detection", 5, function(state)
    cwalkActive = state
    updateCFrameWalk()
end)

CreateFunctionButton("Easy Lockpick", "guaranteed lockpick", ezlockpick, 1)
CreateFunctionButton("Easy Crowbar", "guaranteed crowbar", ezcrowbar, 1)
