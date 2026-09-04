local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

local function createGui()
	local targetParent = (gethui and gethui()) or game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "Sadzep0SepolariaHub"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = targetParent

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 450, 0, 350)
	MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	MainFrame.BorderSizePixel = 0
	MainFrame.ClipsDescendants = true
	MainFrame.Visible = true
	MainFrame.Parent = ScreenGui

	local MainCorner = Instance.new("UICorner")
	MainCorner.CornerRadius = UDim.new(0, 8)
	MainCorner.Parent = MainFrame

	local MainStroke = Instance.new("UIStroke")
	MainStroke.Color = Color3.fromRGB(0, 255, 0)
	MainStroke.Thickness = 1.5
	MainStroke.Parent = MainFrame

	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Size = UDim2.new(1, 0, 0, 35)
	TopBar.BackgroundTransparency = 1
	TopBar.ZIndex = 2
	TopBar.Parent = MainFrame

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Text = "sadzep0team sepolaria"
	TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	TitleLabel.Font = Enum.Font.SourceSansBold
	TitleLabel.TextSize = 18
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Position = UDim2.new(0.03, 0, 0, 0)
	TitleLabel.Size = UDim2.new(0.6, 0, 1, 0)
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TitleLabel.Parent = TopBar

	local ControlHolder = Instance.new("Frame")
	ControlHolder.Size = UDim2.new(0, 70, 0, 35)
	ControlHolder.Position = UDim2.new(1, -75, 0, 0)
	ControlHolder.BackgroundTransparency = 1
	ControlHolder.Parent = TopBar

	local MinBtn = Instance.new("TextButton")
	MinBtn.Text = "—"
	MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	MinBtn.Font = Enum.Font.SourceSansBold
	MinBtn.TextSize = 20
	MinBtn.BackgroundTransparency = 1
	MinBtn.Size = UDim2.new(0, 30, 0, 30)
	MinBtn.Position = UDim2.new(0, 0, 0, 2)
	MinBtn.Parent = ControlHolder

	local CloseBtn = Instance.new("TextButton")
	CloseBtn.Text = "X"
	CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
	CloseBtn.Font = Enum.Font.SourceSansBold
	CloseBtn.TextSize = 20
	CloseBtn.BackgroundTransparency = 1
	CloseBtn.Size = UDim2.new(0, 30, 0, 30)
	CloseBtn.Position = UDim2.new(0, 35, 0, 2)
	CloseBtn.Parent = ControlHolder

	local TabBar = Instance.new("Frame")
	TabBar.Position = UDim2.new(0, 0, 0, 35)
	TabBar.Size = UDim2.new(1, 0, 0, 30)
	TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TabBar.BorderSizePixel = 0
	TabBar.Parent = MainFrame

	local TabPadding = Instance.new("UIPadding")
	TabPadding.PaddingLeft = UDim.new(0, 10)
	TabPadding.Parent = TabBar

	local TabList = Instance.new("UIListLayout")
	TabList.FillDirection = Enum.FillDirection.Horizontal
	TabList.Padding = UDim.new(0, 5)
	TabList.Parent = TabBar

	local function createTabBtn(name, text)
		local Btn = Instance.new("TextButton")
		Btn.Name = name .. "Btn"
		Btn.Text = text:upper()
		Btn.Font = Enum.Font.SourceSansBold
		Btn.TextSize = 14
		Btn.BackgroundTransparency = 1
		Btn.Size = UDim2.new(0, 100, 1, 0)
		Btn.TextColor3 = (text == "Home") and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(180, 180, 180)
		Btn.Parent = TabBar
		return Btn
	end

	local HomeBtn = createTabBtn("Home", "Home")
	local HubBtn = createTabBtn("Hub", "Hub")
	local ExecBtn = createTabBtn("Exec", "Executor")

	local Container = Instance.new("Frame")
	Container.Name = "Container"
	Container.BackgroundTransparency = 1
	Container.Position = UDim2.new(0, 0, 0, 65)
	Container.Size = UDim2.new(1, 0, 1, -65)
	Container.Parent = MainFrame

	local function createPage(name, isVisible)
		local Page = Instance.new("Frame")
		Page.Name = name .. "Page"
		Page.BackgroundTransparency = 1
		Page.Size = UDim2.new(1, 0, 1, 0)
		Page.Visible = isVisible
		Page.Parent = Container
		return Page
	end

	local HomePage = createPage("Home", true)
	local HubPage = createPage("Hub", false)
	local ExecPage = createPage("Exec", false)

	local ProfileFrame = Instance.new("Frame")
	ProfileFrame.Position = UDim2.new(0, 15, 0, 15)
	ProfileFrame.Size = UDim2.new(0, 100, 0, 140)
	ProfileFrame.BackgroundTransparency = 1
	ProfileFrame.Parent = HomePage

	local AvatarImage = Instance.new("ImageLabel")
	AvatarImage.Size = UDim2.new(0, 100, 0, 100)
	AvatarImage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	AvatarImage.BorderSizePixel = 0
	AvatarImage.Parent = ProfileFrame

	local AvatarCorner = Instance.new("UICorner")
	AvatarCorner.CornerRadius = UDim.new(0, 8)
	AvatarCorner.Parent = AvatarImage

	local AvatarStroke = Instance.new("UIStroke")
	AvatarStroke.Color = Color3.fromRGB(0, 255, 0)
	AvatarStroke.Thickness = 1
	AvatarStroke.Parent = AvatarImage

	task.spawn(function()
		local content, isReady = Players:GetUserThumbnailAsync(
			LocalPlayer.UserId,
			Enum.ThumbnailType.HeadShot,
			Enum.ThumbnailSize.Size100x100
		)
		AvatarImage.Image = isReady and content or "rbxasset://textures/ui/GuiImagePlaceholder.png"
	end)

	local DisplayNameLabel = Instance.new("TextLabel")
	DisplayNameLabel.Text = "Name: " .. LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")"
	DisplayNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	DisplayNameLabel.Font = Enum.Font.SourceSansBold
	DisplayNameLabel.TextSize = 15
	DisplayNameLabel.BackgroundTransparency = 1
	DisplayNameLabel.Position = UDim2.new(0, 120, 0, 15)
	DisplayNameLabel.Size = UDim2.new(0, 280, 0, 25)
	DisplayNameLabel.TextXAlignment = Enum.TextXAlignment.Left
	DisplayNameLabel.Parent = HomePage

	local CountryLabel = Instance.new("TextLabel")
	CountryLabel.Name = "CountryLabel"
	CountryLabel.Text = "ประเทศ: กำลังโหลด..."
	CountryLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	CountryLabel.Font = Enum.Font.SourceSans
	CountryLabel.TextSize = 15
	CountryLabel.BackgroundTransparency = 1
	CountryLabel.Position = UDim2.new(0, 120, 0, 45)
	CountryLabel.Size = UDim2.new(0, 280, 0, 25)
	CountryLabel.TextXAlignment = Enum.TextXAlignment.Left
	CountryLabel.Parent = HomePage

	task.spawn(function()
		local success, response = pcall(function()
			return game:HttpGet("http://ip-api.com/json/")
		end)
		if success and response then
			local data = HttpService:JSONDecode(response)
			if data and data.country then
				CountryLabel.Text = "ประเทศ: " .. data.country
			else
				CountryLabel.Text = "ประเทศ: ไม่ทราบ"
			end
		else
			CountryLabel.Text = "ประเทศ: N/A"
		end
	end)

	local HubScroll = Instance.new("ScrollingFrame")
	HubScroll.Name = "HubScroll"
	HubScroll.Position = UDim2.new(0, 15, 0, 15)
	HubScroll.Size = UDim2.new(1, -30, 1, -30)
	HubScroll.BackgroundTransparency = 1
	HubScroll.BorderSizePixel = 0
	HubScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	HubScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	HubScroll.ScrollBarThickness = 6
	HubScroll.Parent = HubPage

	local HubList = Instance.new("UIListLayout")
	HubList.SortOrder = Enum.SortOrder.LayoutOrder
	HubList.Padding = UDim.new(0, 8)
	HubList.Parent = HubScroll

	local HubPadding = Instance.new("UIPadding")
	HubPadding.PaddingRight = UDim.new(0, 5)
	HubPadding.Parent = HubScroll

	local scriptList = {
		{Title = "project broken spawn", URL = "https://pastebin.com/raw/NyJfL0ey"},
		{Title = "ssp", URL = "https://pastefy.app/XHqVeb0d/raw"},
		{Title = "BiPolaria", URL = "https://pastebin.com/raw/8qFWEtWY"},
		{Title = "Polaria", URL = "https://pastefy.app/agqEB2qs/raw"},
		{Title = "KlausGui ss", URL = "https://pastebin.com/raw/Y0CYLJ6z"},
		{Title = "luau x ss v3", URL = "https://raw.githubusercontent.com/gojohdkaisenkt2/Gojohdkaisenkt-/refs/heads/main/L"},
		{Title = "luau x ss v5", URL = "https://rawscripts.net/raw/Universal-Script-Luau-X-SS-V5-rework-50365"},
		{Title = "c00lgui", URL = "https://raw.githubusercontent.com/MiRw3b/c00lgui-v3rx/main/c00lguiv3rx.lua"},
		{Title = "ExSer", URL = "https://pastefy.app/7sO8ckTL/raw"},
		{Title = "stigma ultimate", URL = "https://raw.githubusercontent.com/C-Dr1ve/Executor-Remakes-In-Lua/refs/heads/main/Remakes/Stigma_Revision_0.lua"},
		{Title = "venguim", URL = "https://pastefy.app/j3yyullx/raw"},
		{Title = "Ro Xploit tiny", URL = "https://raw.githubusercontent.com/Kroostal/Ro-Xploittinyhub/refs/heads/main/RoXploit%20TinyHub"},
		{Title = "Ro Xploit", URL = "https://pastebin.com/raw/0hryQeGw"},
		{Title = "SF", URL = "https://raw.githubusercontent.com/g00byd0lanxdd/SF-1.5-MOBILE/refs/heads/main/SF%201.5%20MOBILE"},
		{Title = "Rc7 blue", URL = "https://pastebin.com/raw/zkeLwfT6"},
		{Title = "Rc7 back", URL = "https://pastebin.com/raw/b787QKMQ"},
		{Title = "Project Primalia SS", URL = "https://rawscripts.net/raw/Universal-Script-Project-Primalia-SS-63706"}
	}

	for _, item in ipairs(scriptList) do
		local ScriptBtn = Instance.new("TextButton")
		ScriptBtn.Name = item.Title .. "Btn"
		ScriptBtn.Text = item.Title
		ScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		ScriptBtn.Font = Enum.Font.SourceSansBold
		ScriptBtn.TextSize = 14
		ScriptBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		ScriptBtn.Size = UDim2.new(1, 0, 0, 35)
		ScriptBtn.Parent = HubScroll

		local BtnCorner = Instance.new("UICorner")
		BtnCorner.CornerRadius = UDim.new(0, 6)
		BtnCorner.Parent = ScriptBtn

		local BtnStroke = Instance.new("UIStroke")
		BtnStroke.Color = Color3.fromRGB(50, 50, 50)
		BtnStroke.Thickness = 1
		BtnStroke.Parent = ScriptBtn

		ScriptBtn.MouseButton1Click:Connect(function()
			task.spawn(function()
				local success, res = pcall(function()
					return game:HttpGet(item.URL)
				end)
				if success and res then
					local func, err = loadstring(res)
					if func then
						task.spawn(func)
					else
						warn("Execution Error: " .. tostring(err))
					end
				else
					warn("Failed to fetch script from URL")
				end
			end)
		end)
	end

	local ScriptBoxHolder = Instance.new("ScrollingFrame")
	ScriptBoxHolder.Name = "ScriptBoxHolder"
	ScriptBoxHolder.Position = UDim2.new(0, 15, 0, 15)
	ScriptBoxHolder.Size = UDim2.new(1, -30, 0, 210)
	ScriptBoxHolder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ScriptBoxHolder.BorderSizePixel = 0
	ScriptBoxHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScriptBoxHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ScriptBoxHolder.ScrollBarThickness = 6
	ScriptBoxHolder.Parent = ExecPage

	local BoxCorner = Instance.new("UICorner")
	BoxCorner.CornerRadius = UDim.new(0, 6)
	BoxCorner.Parent = ScriptBoxHolder

	local BoxStroke = Instance.new("UIStroke")
	BoxStroke.Color = Color3.fromRGB(50, 50, 50)
	BoxStroke.Thickness = 1
	BoxStroke.Parent = ScriptBoxHolder

	local ScriptTextBox = Instance.new("TextBox")
	ScriptTextBox.Name = "ScriptTextBox"
	ScriptTextBox.Size = UDim2.new(1, -10, 1, -10)
	ScriptTextBox.Position = UDim2.new(0, 5, 0, 5)
	ScriptTextBox.BackgroundTransparency = 1
	ScriptTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	ScriptTextBox.Text = ""
	ScriptTextBox.PlaceholderText = "-- วางสคริปต์ที่นี่..."
	ScriptTextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
	ScriptTextBox.Font = Enum.Font.Code
	ScriptTextBox.TextSize = 14
	ScriptTextBox.TextXAlignment = Enum.TextXAlignment.Left
	ScriptTextBox.TextYAlignment = Enum.TextYAlignment.Top
	ScriptTextBox.MultiLine = true
	ScriptTextBox.ClearTextOnFocus = false
	ScriptTextBox.Parent = ScriptBoxHolder

	local ExecuteBtn = Instance.new("TextButton")
	ExecuteBtn.Name = "ExecuteBtn"
	ExecuteBtn.Text = "EXECUTE"
	ExecuteBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
	ExecuteBtn.Font = Enum.Font.SourceSansBold
	ExecuteBtn.TextSize = 14
	ExecuteBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ExecuteBtn.Position = UDim2.new(0, 15, 0, 235)
	ExecuteBtn.Size = UDim2.new(0, 120, 0, 35)
	ExecuteBtn.Parent = ExecPage

	local ExecCorner = Instance.new("UICorner")
	ExecCorner.CornerRadius = UDim.new(0, 6)
	ExecCorner.Parent = ExecuteBtn

	local ExecStroke = Instance.new("UIStroke")
	ExecStroke.Color = Color3.fromRGB(0, 255, 0)
	ExecStroke.Thickness = 1
	ExecStroke.Parent = ExecuteBtn

	local ClearBtn = Instance.new("TextButton")
	ClearBtn.Name = "ClearBtn"
	ClearBtn.Text = "CLEAR"
	ClearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	ClearBtn.Font = Enum.Font.SourceSansBold
	ClearBtn.TextSize = 14
	ClearBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ClearBtn.Position = UDim2.new(0, 145, 0, 235)
	ClearBtn.Size = UDim2.new(0, 120, 0, 35)
	ClearBtn.Parent = ExecPage

	local ClearCorner = Instance.new("UICorner")
	ClearCorner.CornerRadius = UDim.new(0, 6)
	ClearCorner.Parent = ClearBtn

	local ClearStroke = Instance.new("UIStroke")
	ClearStroke.Color = Color3.fromRGB(100, 100, 100)
	ClearStroke.Thickness = 1
	ClearStroke.Parent = ClearBtn

	local OpenBtn = Instance.new("TextButton")
	OpenBtn.Text = "Open Hub"
	OpenBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
	OpenBtn.Font = Enum.Font.SourceSansBold
	OpenBtn.TextSize = 14
	OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	OpenBtn.Size = UDim2.new(0, 100, 0, 30)
	OpenBtn.Position = UDim2.new(0.5, -50, 1, -40)
	OpenBtn.Visible = false
	OpenBtn.Parent = ScreenGui

	local OpenCorner = Instance.new("UICorner")
	OpenCorner.CornerRadius = UDim.new(0, 5)
	OpenCorner.Parent = OpenBtn

	local OpenStroke = Instance.new("UIStroke")
	OpenStroke.Color = Color3.fromRGB(0, 255, 0)
	OpenStroke.Thickness = 1
	OpenStroke.Parent = OpenBtn

	ExecuteBtn.MouseButton1Click:Connect(function()
		local code = ScriptTextBox.Text
		if code and code ~= "" then
			local func, err = loadstring(code)
			if func then
				task.spawn(func)
			else
				warn("Script Execution Error: " .. tostring(err))
			end
		end
	end)

	ClearBtn.MouseButton1Click:Connect(function()
		ScriptTextBox.Text = ""
	end)

	local currentTabBtn = HomeBtn
	local currentPage = HomePage

	local function switchTab(selectedBtn, selectedPage)
		if selectedBtn == currentTabBtn then return end
		currentTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
		currentPage.Visible = false

		selectedBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
		selectedPage.Visible = true

		currentTabBtn = selectedBtn
		currentPage = selectedPage
	end

	HomeBtn.MouseButton1Click:Connect(function() switchTab(HomeBtn, HomePage) end)
	HubBtn.MouseButton1Click:Connect(function() switchTab(HubBtn, HubPage) end)
	ExecBtn.MouseButton1Click:Connect(function() switchTab(ExecBtn, ExecPage) end)

	local isMinimized = false
	MinBtn.MouseButton1Click:Connect(function()
		if isMinimized then return end
		isMinimized = true
		MainFrame.Visible = false
		OpenBtn.Visible = true
	end)

	OpenBtn.MouseButton1Click:Connect(function()
		if not isMinimized then return end
		isMinimized = false
		OpenBtn.Visible = false
		MainFrame.Visible = true
	end)

	CloseBtn.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
	end)

	local dragging, dragInput, dragStart, startPos
	local function update(input)
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end

	TopBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = MainFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	TopBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

createGui()

