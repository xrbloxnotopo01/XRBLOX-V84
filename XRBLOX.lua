local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

local old = PlayerGui:FindFirstChild("XRBLOX_HUB")
if old then old:Destroy() end

local Config = {
	Enabled = true, ESP = true, Distance = true, Chams = false,
	ChamsColor = Color3.fromRGB(255,45,55), ChamsTransparency = 0.45,
	Health = false, Tracers = false, TracerColor = Color3.fromRGB(255,45,55),
	TracerThickness = 1.5, BigHead = false, BigHeadSize = 5,
	BigHeadTransparency = 0.15, Crosshair = false, RGB = false,
	FOV = false, FOVValue = 80, FPS = true, Ping = true, Speed = false,
	CameraEffect = false, TeamESP = true, WantedESP = true,
	HubColor = Color3.fromRGB(255,45,55), ESPColor = Color3.fromRGB(255,45,55),
	CrosshairColor = Color3.fromRGB(255,255,255)
}
local OriginalFOV = Camera.FieldOfView

local COLORS = {
	RED = Color3.fromRGB(255,45,55), PURPLE = Color3.fromRGB(150,60,255),
	BLUE = Color3.fromRGB(50,130,255), CYAN = Color3.fromRGB(0,220,255),
	GREEN = Color3.fromRGB(0,255,120), ORANGE = Color3.fromRGB(255,130,30),
	YELLOW = Color3.fromRGB(255,210,40), WHITE = Color3.fromRGB(240,240,245),
	PINK = Color3.fromRGB(255,60,180), POLICE = Color3.fromRGB(0,120,255),
	MEDIC = Color3.fromRGB(255,255,255), FIRE = Color3.fromRGB(255,80,0),
	CITIZEN = Color3.fromRGB(180,180,180), WANTED = Color3.fromRGB(255,0,0)
}

local BG = Color3.fromRGB(3,4,7)
local PANEL = Color3.fromRGB(7,9,13)
local PANEL2 = Color3.fromRGB(11,13,18)
local PANEL3 = Color3.fromRGB(17,19,26)
local TEXT = Color3.fromRGB(240,240,245)
local SUBTEXT = Color3.fromRGB(130,133,145)
local OFF = Color3.fromRGB(30,32,40)

local Gui = Instance.new("ScreenGui")
Gui.Name = "XRBLOX_HUB"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(720,570)
Main.Position = UDim2.new(0.5,-360,0.5,-285)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui
Instance.new("UICorner",Main).CornerRadius = UDim.new(0,16)

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Config.HubColor
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.1
MainStroke.Parent = Main

local BackgroundLines = Instance.new("Frame")
BackgroundLines.Name = "BackgroundLines"
BackgroundLines.Size = UDim2.fromScale(1,1)
BackgroundLines.BackgroundTransparency = 1
BackgroundLines.ZIndex = 0
BackgroundLines.Parent = Main
for i = 1,18 do
	local line = Instance.new("Frame")
	line.Size = UDim2.new(0,1,1,0)
	line.Position = UDim2.new(0,(i/18)*720,0,0)
	line.BackgroundColor3 = COLORS.RED
	line.BackgroundTransparency = 0.96
	line.BorderSizePixel = 0
	line.Parent = BackgroundLines
end
for i = 1,14 do
	local line = Instance.new("Frame")
	line.Size = UDim2.new(1,0,0,1)
	line.Position = UDim2.new(0,0,(i/14),0)
	line.BackgroundColor3 = COLORS.RED
	line.BackgroundTransparency = 0.97
	line.BorderSizePixel = 0
	line.Parent = BackgroundLines
end

local Top = Instance.new("Frame")
Top.Name = "Top"
Top.Size = UDim2.new(1,0,0,72)
Top.BackgroundColor3 = PANEL
Top.BorderSizePixel = 0
Top.ZIndex = 5
Top.Parent = Main
Instance.new("UICorner",Top).CornerRadius = UDim.new(0,16)

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1,-24,0,1)
TopLine.Position = UDim2.fromOffset(12,71)
TopLine.BackgroundColor3 = Config.HubColor
TopLine.BackgroundTransparency = 0.55
TopLine.BorderSizePixel = 0
TopLine.Parent = Top

local Logo = Instance.new("TextLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.fromOffset(50,50)
Logo.Position = UDim2.fromOffset(11,10)
Logo.BackgroundColor3 = PANEL3
Logo.Text = "XR"
Logo.TextColor3 = Config.HubColor
Logo.TextSize = 18
Logo.Font = Enum.Font.GothamBlack
Logo.ZIndex = 6
Logo.Parent = Top
Instance.new("UICorner",Logo).CornerRadius = UDim.new(0,12)
local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Config.HubColor
LogoStroke.Transparency = 0.3
LogoStroke.Parent = Logo

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.fromOffset(420,30)
Title.Position = UDim2.fromOffset(74,7)
Title.BackgroundTransparency = 1
Title.Text = "XRBLOX // SAN AURIE"
Title.TextColor3 = TEXT
Title.TextSize = 21
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 6
Title.Parent = Top

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.fromOffset(420,20)
Subtitle.Position = UDim2.fromOffset(75,39)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "VISUAL CONTROL HUB // V8.4"
Subtitle.TextColor3 = Config.HubColor
Subtitle.TextSize = 9
Subtitle.Font = Enum.Font.Code
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 6
Subtitle.Parent = Top

local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.fromOffset(110,25)
StatusFrame.Position = UDim2.new(1,-190,0,8)
StatusFrame.BackgroundColor3 = PANEL2
StatusFrame.BorderSizePixel = 0
StatusFrame.ZIndex = 6
StatusFrame.Parent = Top
Instance.new("UICorner",StatusFrame).CornerRadius = UDim.new(0,6)

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.fromOffset(7,7)
StatusDot.Position = UDim2.fromOffset(9,9)
StatusDot.BackgroundColor3 = COLORS.RED
StatusDot.BorderSizePixel = 0
StatusDot.ZIndex = 7
StatusDot.Parent = StatusFrame
Instance.new("UICorner",StatusDot).CornerRadius = UDim.new(1,0)

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1,-25,1,0)
StatusText.Position = UDim2.fromOffset(22,0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "SYSTEM ONLINE"
StatusText.TextColor3 = COLORS.RED
StatusText.TextSize = 8
StatusText.Font = Enum.Font.Code
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.ZIndex = 7
StatusText.Parent = StatusFrame

local Minimize = Instance.new("TextButton")
Minimize.Name = "Minimize"
Minimize.Size = UDim2.fromOffset(34,30)
Minimize.Position = UDim2.new(1,-80,0,35)
Minimize.BackgroundColor3 = PANEL2
Minimize.Text = "—"
Minimize.TextColor3 = TEXT
Minimize.TextSize = 16
Minimize.Font = Enum.Font.GothamBold
Minimize.AutoButtonColor = false
Minimize.ZIndex = 7
Minimize.Parent = Top
Instance.new("UICorner",Minimize).CornerRadius = UDim.new(0,7)
local MinStroke = Instance.new("UIStroke")
MinStroke.Color = Color3.fromRGB(60,62,70)
MinStroke.Transparency = 0.3
MinStroke.Parent = Minimize

local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Size = UDim2.fromOffset(34,30)
Close.Position = UDim2.new(1,-40,0,35)
Close.BackgroundColor3 = PANEL2
Close.Text = "×"
Close.TextColor3 = COLORS.RED
Close.TextSize = 18
Close.Font = Enum.Font.GothamBold
Close.AutoButtonColor = false
Close.ZIndex = 7
Close.Parent = Top
Instance.new("UICorner",Close).CornerRadius = UDim.new(0,7)
local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = COLORS.RED
CloseStroke.Transparency = 0.35
CloseStroke.Parent = Close

local Body = Instance.new("Frame")
Body.Name = "Body"
Body.Size = UDim2.new(1,-20,1,-82)
Body.Position = UDim2.fromOffset(10,77)
Body.BackgroundTransparency = 1
Body.ZIndex = 2
Body.Parent = Main

local Menu = Instance.new("Frame")
Menu.Name = "Menu"
Menu.Size = UDim2.fromOffset(140,483)
Menu.BackgroundColor3 = PANEL
Menu.BorderSizePixel = 0
Menu.ZIndex = 3
Menu.Parent = Body
Instance.new("UICorner",Menu).CornerRadius = UDim.new(0,11)

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Color = COLORS.RED
MenuStroke.Transparency = 0.78
MenuStroke.Parent = Menu

local MenuTitle = Instance.new("TextLabel")
MenuTitle.Name = "MenuTitle"
MenuTitle.Size = UDim2.new(1,-20,0,25)
MenuTitle.Position = UDim2.fromOffset(10,8)
MenuTitle.BackgroundTransparency = 1
MenuTitle.Text = "// COMMAND MENU"
MenuTitle.TextColor3 = Config.HubColor
MenuTitle.TextSize = 9
MenuTitle.Font = Enum.Font.Code
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.ZIndex = 4
MenuTitle.Parent = Menu

local MenuLine = Instance.new("Frame")
MenuLine.Size = UDim2.new(1,-20,0,1)
MenuLine.Position = UDim2.fromOffset(10,34)
MenuLine.BackgroundColor3 = Config.HubColor
MenuLine.BackgroundTransparency = 0.75
MenuLine.BorderSizePixel = 0
MenuLine.Parent = Menu

local MenuStatus = Instance.new("TextLabel")
MenuStatus.Size = UDim2.new(1,-20,0,20)
MenuStatus.Position = UDim2.fromOffset(10,440)
MenuStatus.BackgroundTransparency = 1
MenuStatus.Text = "● LINK ACTIVE"
MenuStatus.TextColor3 = COLORS.RED
MenuStatus.TextSize = 8
MenuStatus.Font = Enum.Font.Code
MenuStatus.TextXAlignment = Enum.TextXAlignment.Left
MenuStatus.ZIndex = 4
MenuStatus.Parent = Menu

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1,-150,1,0)
Content.Position = UDim2.fromOffset(150,0)
Content.BackgroundTransparency = 1
Content.ZIndex = 2
Content.Parent = Body

local Pages = {}
local function newPage(name)
	local page = Instance.new("ScrollingFrame")
	page.Name = name
	page.Size = UDim2.fromScale(1,1)
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 3
	page.ScrollBarImageColor3 = Config.HubColor
	page.ScrollBarImageTransparency = 0.15
	page.CanvasSize = UDim2.new(0,0,0,0)
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	page.Visible = false
	page.ZIndex = 2
	page.Parent = Content
	Pages[name] = page
	return page
end

local VisualPage = newPage("VISUAL")
local BigHeadPage = newPage("BIG_HEAD")
local PlayerPage = newPage("PLAYER")
local SettingsPage = newPage("SETTINGS")
local SanAuriePage = newPage("SAN_AURIE")
VisualPage.Visible = true

local function createSection(parent,title,height)
	local box = Instance.new("Frame")
	box.Size = UDim2.new(1,-5,0,height)
	box.BackgroundColor3 = PANEL
	box.BorderSizePixel = 0
	box.Parent = parent
	Instance.new("UICorner",box).CornerRadius = UDim.new(0,11)
	local line = Instance.new("UIStroke")
	line.Color = Config.HubColor
	line.Transparency = 0.75
	line.Thickness = 1
	line.Parent = box
	local labelTitle = Instance.new("TextLabel")
	labelTitle.Size = UDim2.new(1,-20,0,28)
	labelTitle.Position = UDim2.fromOffset(10,5)
	labelTitle.BackgroundTransparency = 1
	labelTitle.Text = "> "..title
	labelTitle.TextColor3 = Config.HubColor
	labelTitle.TextSize = 11
	labelTitle.Font = Enum.Font.Code
	labelTitle.TextXAlignment = Enum.TextXAlignment.Left
	labelTitle.Parent = box
	return box
end

local function label(parent,text,y,size)
	local l = Instance.new("TextLabel")
	l.Size = UDim2.new(1,-20,0,size or 25)
	l.Position = UDim2.fromOffset(10,y)
	l.BackgroundTransparency = 1
	l.Text = text
	l.TextColor3 = TEXT
	l.TextSize = 11
	l.Font = Enum.Font.Code
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.Parent = parent
	return l
end

local function button(parent,text,y,height)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1,-20,0,height or 38)
	b.Position = UDim2.fromOffset(10,y)
	b.BackgroundColor3 = PANEL2
	b.BorderSizePixel = 0
	b.Text = text
	b.TextColor3 = TEXT
	b.TextSize = 10
	b.Font = Enum.Font.GothamBold
	b.AutoButtonColor = false
	b.Parent = parent
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,7)
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(45,47,55)
	stroke.Transparency = 0.35
	stroke.Parent = b
	b.MouseEnter:Connect(function()
		TweenService:Create(b,TweenInfo.new(0.12),{BackgroundColor3=PANEL3}):Play()
		if stroke then stroke.Color = Config.HubColor stroke.Transparency = 0.25 end
	end)
	b.MouseLeave:Connect(function()
		TweenService:Create(b,TweenInfo.new(0.12),{BackgroundColor3=PANEL2}):Play()
		if stroke then stroke.Color = Color3.fromRGB(45,47,55) stroke.Transparency = 0.35 end
	end)
	return b
end

local function toggle(parent,text,y,initial,callback)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1,-20,0,36)
	row.Position = UDim2.fromOffset(10,y)
	row.BackgroundTransparency = 1
	row.Parent = parent
	local txt = Instance.new("TextLabel")
	txt.Size = UDim2.new(1,-70,1,0)
	txt.BackgroundTransparency = 1
	txt.Text = text
	txt.TextColor3 = TEXT
	txt.TextSize = 10
	txt.Font = Enum.Font.Code
	txt.TextXAlignment = Enum.TextXAlignment.Left
	txt.Parent = row
	local sw = Instance.new("TextButton")
	sw.Size = UDim2.fromOffset(44,21)
	sw.Position = UDim2.new(1,-44,0.5,-10)
	sw.BackgroundColor3 = initial and Config.HubColor or OFF
	sw.Text = ""
	sw.AutoButtonColor = false
	sw.Parent = row
	Instance.new("UICorner",sw).CornerRadius = UDim.new(1,0)
	local switchStroke = Instance.new("UIStroke")
	switchStroke.Color = initial and Config.HubColor or Color3.fromRGB(55,57,65)
	switchStroke.Transparency = 0.2
	switchStroke.Parent = sw
	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(17,17)
	knob.Position = initial and UDim2.new(1,-19,0,2) or UDim2.fromOffset(2,2)
	knob.BackgroundColor3 = Color3.new(1,1,1)
	knob.BorderSizePixel = 0
	knob.Parent = sw
	Instance.new("UICorner",knob).CornerRadius = UDim.new(1,0)
	local value = initial
	local function redraw()
		sw.BackgroundColor3 = value and Config.HubColor or OFF
		switchStroke.Color = value and Config.HubColor or Color3.fromRGB(55,57,65)
		TweenService:Create(knob,TweenInfo.new(0.12),{Position=value and UDim2.new(1,-19,0,2) or UDim2.fromOffset(2,2)}):Play()
	end
	sw.MouseEnter:Connect(function() TweenService:Create(switchStroke,TweenInfo.new(0.12),{Transparency=0}):Play() end)
	sw.MouseLeave:Connect(function() TweenService:Create(switchStroke,TweenInfo.new(0.12),{Transparency=0.2}):Play() end)
	sw.MouseButton1Click:Connect(function()
		value = not value
		redraw()
		if callback then callback(value) end
	end)
	return {Get = function() return value end, Set = function(v) value = v redraw() if callback then callback(value) end end}
end

local navButtons = {}
local function nav(text,y,page)
	local b = button(Menu,text,y,38)
	table.insert(navButtons,b)
	b.MouseButton1Click:Connect(function()
		for _,p in pairs(Pages) do p.Visible = false end
		page.Visible = true
		for _,x in ipairs(navButtons) do x.BackgroundColor3 = PANEL2 x.TextColor3 = SUBTEXT end
		b.BackgroundColor3 = Config.HubColor
		b.TextColor3 = Color3.new(1,1,1)
	end)
	return b
end

local NV = nav("◈ VISUAL",42,VisualPage)
local NB = nav("◈ BIG HEAD",85,BigHeadPage)
local NP = nav("◈ PLAYER",128,PlayerPage)
local NS = nav("◈ SAN AURIE",171,SanAuriePage)
local NSET = nav("◈ SETTINGS",214,SettingsPage)
NV.BackgroundColor3 = Config.HubColor
NV.TextColor3 = Color3.new(1,1,1)

local HackerStage = Instance.new("Frame")
HackerStage.Name = "HackerCommandCenter"
HackerStage.Size = UDim2.new(1,-5,0,132)
HackerStage.Position = UDim2.fromOffset(0,0)
HackerStage.BackgroundColor3 = Color3.fromRGB(4,5,8)
HackerStage.BorderSizePixel = 0
HackerStage.ClipsDescendants = true
HackerStage.Parent = VisualPage
Instance.new("UICorner",HackerStage).CornerRadius = UDim.new(0,12)

local HackerStageStroke = Instance.new("UIStroke")
HackerStageStroke.Color = Config.HubColor
HackerStageStroke.Transparency = 0.45
HackerStageStroke.Thickness = 1
HackerStageStroke.Parent = HackerStage

local StageTopLine = Instance.new("Frame")
StageTopLine.Size = UDim2.new(1,-20,0,1)
StageTopLine.Position = UDim2.fromOffset(10,29)
StageTopLine.BackgroundColor3 = Config.HubColor
StageTopLine.BackgroundTransparency = 0.55
StageTopLine.BorderSizePixel = 0
StageTopLine.Parent = HackerStage

local StageTitle = Instance.new("TextLabel")
StageTitle.Size = UDim2.new(1,-180,0,22)
StageTitle.Position = UDim2.fromOffset(12,5)
StageTitle.BackgroundTransparency = 1
StageTitle.Text = "XRBLOX // CYBER COMMAND CENTER"
StageTitle.TextColor3 = TEXT
StageTitle.TextSize = 10
StageTitle.Font = Enum.Font.GothamBlack
StageTitle.TextXAlignment = Enum.TextXAlignment.Left
StageTitle.Parent = HackerStage

local StageStatus = Instance.new("TextLabel")
StageStatus.Size = UDim2.fromOffset(150,20)
StageStatus.Position = UDim2.new(1,-162,0,5)
StageStatus.BackgroundTransparency = 1
StageStatus.Text = "● 3 OPERATORS ONLINE"
StageStatus.TextColor3 = Config.HubColor
StageStatus.TextSize = 7
StageStatus.Font = Enum.Font.Code
StageStatus.TextXAlignment = Enum.TextXAlignment.Right
StageStatus.Parent = HackerStage

local HackerAnimations = {}
local function createHacker(parent,index,xScale,nameText)
	local card = Instance.new("Frame")
	card.Name = "Hacker_"..index
	card.Size = UDim2.new(0.31,0,0,88)
	card.Position = UDim2.new(xScale,0,0,38)
	card.BackgroundColor3 = Color3.fromRGB(7,8,12)
	card.BorderSizePixel = 0
	card.ClipsDescendants = true
	card.Parent = parent
	Instance.new("UICorner",card).CornerRadius = UDim.new(0,8)

	local cardStroke = Instance.new("UIStroke")
	cardStroke.Color = COLORS.RED
	cardStroke.Transparency = 0.72
	cardStroke.Parent = card

	local indicator = Instance.new("Frame")
	indicator.Size = UDim2.fromOffset(5,5)
	indicator.Position = UDim2.fromOffset(7,7)
	indicator.BackgroundColor3 = COLORS.RED
	indicator.BorderSizePixel = 0
	indicator.Parent = card
	Instance.new("UICorner",indicator).CornerRadius = UDim.new(1,0)

	local name = Instance.new("TextLabel")
	name.Size = UDim2.new(1,-22,0,14)
	name.Position = UDim2.fromOffset(17,3)
	name.BackgroundTransparency = 1
	name.Text = nameText
	name.TextColor3 = SUBTEXT
	name.TextSize = 6
	name.Font = Enum.Font.Code
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Parent = card

	local hacker = Instance.new("Frame")
	hacker.Name = "Hacker"
	hacker.Size = UDim2.fromOffset(54,68)
	hacker.Position = UDim2.fromOffset(8,17)
	hacker.BackgroundTransparency = 1
	hacker.Parent = card

	local hood = Instance.new("Frame")
	hood.Size = UDim2.fromOffset(29,29)
	hood.Position = UDim2.fromOffset(9,1)
	hood.BackgroundColor3 = Color3.fromRGB(18,18,23)
	hood.BorderSizePixel = 0
	hood.Parent = hacker
	Instance.new("UICorner",hood).CornerRadius = UDim.new(1,0)

	local hoodStroke = Instance.new("UIStroke")
	hoodStroke.Color = Color3.fromRGB(45,45,52)
	hoodStroke.Transparency = 0.3
	hoodStroke.Parent = hood

	local head = Instance.new("Frame")
	head.Size = UDim2.fromOffset(18,20)
	head.Position = UDim2.fromOffset(15,6)
	head.BackgroundColor3 = Color3.fromRGB(34,34,40)
	head.BorderSizePixel = 0
	head.Parent = hacker
	Instance.new("UICorner",head).CornerRadius = UDim.new(1,0)

	local visor = Instance.new("Frame")
	visor.Size = UDim2.fromOffset(15,4)
	visor.Position = UDim2.fromOffset(2,8)
	visor.BackgroundColor3 = COLORS.RED
	visor.BorderSizePixel = 0
	visor.Parent = head
	Instance.new("UICorner",visor).CornerRadius = UDim.new(1,0)

	local visorGlow = Instance.new("UIStroke")
	visorGlow.Color = COLORS.RED
	visorGlow.Transparency = 0.15
	visorGlow.Parent = visor

	local body = Instance.new("Frame")
	body.Size = UDim2.fromOffset(29,28)
	body.Position = UDim2.fromOffset(9,25)
	body.BackgroundColor3 = Color3.fromRGB(15,16,21)
	body.BorderSizePixel = 0
	body.Parent = hacker
	Instance.new("UICorner",body).CornerRadius = UDim.new(0,7)

	local symbol = Instance.new("TextLabel")
	symbol.Size = UDim2.fromScale(1,1)
	symbol.BackgroundTransparency = 1
	symbol.Text = "X"
	symbol.TextColor3 = Color3.fromRGB(75,75,83)
	symbol.TextSize = 13
	symbol.Font = Enum.Font.GothamBlack
	symbol.Parent = body

	local armL = Instance.new("Frame")
	armL.Size = UDim2.fromOffset(7,24)
	armL.Position = UDim2.fromOffset(3,28)
	armL.BackgroundColor3 = Color3.fromRGB(19,20,25)
	armL.BorderSizePixel = 0
	armL.AnchorPoint = Vector2.new(0.5,0)
	armL.Parent = hacker
	Instance.new("UICorner",armL).CornerRadius = UDim.new(0,4)

	local armR = Instance.new("Frame")
	armR.Size = UDim2.fromOffset(7,24)
	armR.Position = UDim2.fromOffset(36,28)
	armR.BackgroundColor3 = Color3.fromRGB(19,20,25)
	armR.BorderSizePixel = 0
	armR.AnchorPoint = Vector2.new(0.5,0)
	armR.Parent = hacker
	Instance.new("UICorner",armR).CornerRadius = UDim.new(0,4)

	local monitor = Instance.new("Frame")
	monitor.Name = "Monitor"
	monitor.Size = UDim2.fromOffset(62,43)
	monitor.Position = UDim2.new(1,-72,0,27)
	monitor.BackgroundColor3 = Color3.fromRGB(5,6,9)
	monitor.BorderSizePixel = 0
	monitor.Parent = card
	Instance.new("UICorner",monitor).CornerRadius = UDim.new(0,5)

	local monitorStroke = Instance.new("UIStroke")
	monitorStroke.Color = COLORS.RED
	monitorStroke.Transparency = 0.25
	monitorStroke.Parent = monitor

	local screen = Instance.new("Frame")
	screen.Name = "Screen"
	screen.Size = UDim2.new(1,-8,1,-8)
	screen.Position = UDim2.fromOffset(4,4)
	screen.BackgroundColor3 = Color3.fromRGB(4,7,8)
	screen.BorderSizePixel = 0
	screen.ClipsDescendants = true
	screen.Parent = monitor
	Instance.new("UICorner",screen).CornerRadius = UDim.new(0,3)

	local terminalLines = {}
	for i = 1,4 do
		local terminal = Instance.new("TextLabel")
		terminal.Size = UDim2.new(1,-6,0,7)
		terminal.Position = UDim2.fromOffset(3,2+(i-1)*8)
		terminal.BackgroundTransparency = 1
		terminal.Text = i == 1 and "> CONNECTING..." or "> ..."
		terminal.TextColor3 = COLORS.RED
		terminal.TextSize = 5
		terminal.Font = Enum.Font.Code
		terminal.TextXAlignment = Enum.TextXAlignment.Left
		terminal.Parent = screen
		table.insert(terminalLines,terminal)
	end

	local cursor = Instance.new("Frame")
	cursor.Size = UDim2.fromOffset(3,6)
	cursor.Position = UDim2.fromOffset(4,34)
	cursor.BackgroundColor3 = COLORS.RED
	cursor.BorderSizePixel = 0
	cursor.Parent = screen

	local stand = Instance.new("Frame")
	stand.Size = UDim2.fromOffset(3,9)
	stand.Position = UDim2.new(0.5,-1,1,0)
	stand.BackgroundColor3 = Color3.fromRGB(40,40,46)
	stand.BorderSizePixel = 0
	stand.Parent = monitor

	local base = Instance.new("Frame")
	base.Size = UDim2.fromOffset(22,3)
	base.Position = UDim2.new(0.5,-11,1,7)
	base.BackgroundColor3 = Color3.fromRGB(40,40,46)
	base.BorderSizePixel = 0
	base.Parent = monitor

	local phase = index * 0.7
	table.insert(HackerAnimations,{
		hacker=hacker,head=head,armL=armL,armR=armR,
		visor=visor,indicator=indicator,cursor=cursor,lines=terminalLines,
		phase=phase,index=index
	})
end

createHacker(HackerStage,1,0.01,"OPERATOR // 01")
createHacker(HackerStage,2,0.345,"OPERATOR // 02")
createHacker(HackerStage,3,0.68,"OPERATOR // 03")

local Scanline = Instance.new("Frame")
Scanline.Name = "Scanline"
Scanline.Size = UDim2.new(1,0,0,2)
Scanline.Position = UDim2.fromOffset(0,32)
Scanline.BackgroundColor3 = COLORS.RED
Scanline.BackgroundTransparency = 0.82
Scanline.BorderSizePixel = 0
Scanline.ZIndex = 10
Scanline.Parent = HackerStage

local function normalizeName(value)
	if typeof(value) ~= "string" then return "" end
	return string.lower(value)
end
local function getRoleInfo(player)
	if not player then return "CIDADÃO",COLORS.CITIZEN end
	if player.Team then
		local teamName = normalizeName(player.Team.Name)
		if teamName:find("policia") or teamName:find("police") or teamName:find("pm") or teamName:find("law") then return "POLÍCIA",COLORS.POLICE end
		if teamName:find("medico") or teamName:find("medic") or teamName:find("hospital") or teamName:find("paramedic") then return "MÉDICO",COLORS.MEDIC end
		if teamName:find("bombeiro") or teamName:find("fire") or teamName:find("firefighter") then return "BOMBEIRO",COLORS.FIRE end
	end
	return "CIDADÃO",COLORS.CITIZEN
end

local function convertNumber(value)
	if typeof(value) == "number" then return value end
	if typeof(value) == "string" then
		local number = tonumber(value)
		if number then return number end
		local stars = value:match("([1-5])")
		if stars then return tonumber(stars) end
	end
	return nil
end
local function isTrueValue(value)
	if typeof(value) == "boolean" then return value end
	if typeof(value) == "number" then return value > 0 end
	if typeof(value) == "string" then
		local v = string.lower(value)
		if v == "true" or v == "yes" or v == "sim" or v == "wanted" or v == "procurado" then return true end
		if v == "false" or v == "no" or v == "nao" or v == "não" or v == "clean" or v == "limpo" then return false end
		local number = tonumber(v)
		if number then return number > 0 end
	end
	return false
end
local function getObjectValue(obj)
	if not obj then return nil end
	if obj:IsA("BoolValue") or obj:IsA("NumberValue") or obj:IsA("IntValue") or obj:IsA("StringValue") then return obj.Value end
	return nil
end

local function checkWanted(player)
	if not player then return false,0 end
	local starAttributeNames = {"WantedStars","WantedLevel","WantedLvl","Stars","Star","Estrelas","Estrela","PoliceStars","CrimeStars"}
	for _,attributeName in ipairs(starAttributeNames) do
		local value = player:GetAttribute(attributeName)
		if value ~= nil then
			local number = convertNumber(value)
			if number and number >= 1 then return true, math.clamp(math.floor(number),1,5) end
		end
	end
	local wantedAttributeNames = {"Wanted","IsWanted","Procurado","procurado","IsProcurado"}
	for _,attributeName in ipairs(wantedAttributeNames) do
		local value = player:GetAttribute(attributeName)
		if value ~= nil and isTrueValue(value) then
			for _,starName in ipairs(starAttributeNames) do
				local starValue = player:GetAttribute(starName)
				local number = convertNumber(starValue)
				if number and number >= 1 then return true, math.clamp(math.floor(number),1,5) end
			end
			return true,1
		end
	end
	local containers = {player:FindFirstChild("Status"),player:FindFirstChild("Data"),player:FindFirstChild("leaderstats")}
	for _,container in ipairs(containers) do
		if container then
			for _,starName in ipairs(starAttributeNames) do
				local obj = container:FindFirstChild(starName)
				if obj then
					local value = getObjectValue(obj)
					local number = convertNumber(value)
					if number and number >= 1 then return true, math.clamp(math.floor(number),1,5) end
				end
			end
			for _,wantedName in ipairs(wantedAttributeNames) do
				local obj = container:FindFirstChild(wantedName)
				if obj then
					local value = getObjectValue(obj)
					if value ~= nil and isTrueValue(value) then return true,1 end
				end
			end
		end
	end
	local character = player.Character
	if character then
		for _,starName in ipairs(starAttributeNames) do
			local value = character:GetAttribute(starName)
			if value ~= nil then
				local number = convertNumber(value)
				if number and number >= 1 then return true, math.clamp(math.floor(number),1,5) end
			end
			local obj = character:FindFirstChild(starName)
			if obj then
				local objectValue = getObjectValue(obj)
				local number = convertNumber(objectValue)
				if number and number >= 1 then return true, math.clamp(math.floor(number),1,5) end
			end
		end
		for _,wantedName in ipairs(wantedAttributeNames) do
			local value = character:GetAttribute(wantedName)
			if value ~= nil and isTrueValue(value) then return true,1 end
			local obj = character:FindFirstChild(wantedName)
			if obj then
				local objectValue = getObjectValue(obj)
				if objectValue ~= nil and isTrueValue(objectValue) then return true,1 end
			end
		end
	end
	return false,0
end
local function getStarsText(stars)
	stars = math.clamp(math.floor(tonumber(stars) or 1),1,5)
	local result = ""
	for i = 1,5 do if i <= stars then result = result.."★" else result = result.."☆" end end
	return result
end

local function removeESP(player)
	local char = player.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	local obj = head:FindFirstChild("XRBLOX_ESP")
	if obj then obj:Destroy() end
end

local function updateESP(player)
	if player == LocalPlayer then return end
	local char = player.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	local root = char:FindFirstChild("HumanoidRootPart")
	if not head or not root then return end
	if not Config.Enabled or not Config.ESP then removeESP(player) return end
	local gui = head:FindFirstChild("XRBLOX_ESP")
	if not gui then
		gui = Instance.new("BillboardGui")
		gui.Name = "XRBLOX_ESP"
		gui.Adornee = head
		gui.Size = UDim2.fromOffset(220,100)
		gui.StudsOffset = Vector3.new(0,3,0)
		gui.AlwaysOnTop = true
		gui.MaxDistance = 1000
		gui.Parent = head
		local name = Instance.new("TextLabel")
		name.Name = "Name"
		name.Size = UDim2.new(1,0,0.25,0)
		name.BackgroundTransparency = 1
		name.TextSize = 13
		name.Font = Enum.Font.GothamBold
		name.TextStrokeTransparency = 0.3
		name.Parent = gui
		local role = Instance.new("TextLabel")
		role.Name = "Role"
		role.Size = UDim2.new(1,0,0.22,0)
		role.Position = UDim2.new(0,0,0.25,0)
		role.BackgroundTransparency = 1
		role.TextSize = 10
		role.Font = Enum.Font.Code
		role.TextStrokeTransparency = 0.4
		role.Parent = gui
		local distance = Instance.new("TextLabel")
		distance.Name = "Distance"
		distance.Size = UDim2.new(1,0,0.20,0)
		distance.Position = UDim2.new(0,0,0.47,0)
		distance.BackgroundTransparency = 1
		distance.TextSize = 10
		distance.Font = Enum.Font.Code
		distance.TextColor3 = Config.ESPColor
		distance.TextStrokeTransparency = 0.4
		distance.Parent = gui
		local wanted = Instance.new("TextLabel")
		wanted.Name = "Wanted"
		wanted.Size = UDim2.new(1,0,0.33,0)
		wanted.Position = UDim2.new(0,0,0.67,0)
		wanted.BackgroundTransparency = 1
		wanted.TextSize = 11
		wanted.Font = Enum.Font.GothamBlack
		wanted.TextColor3 = COLORS.WANTED
		wanted.TextStrokeTransparency = 0.2
		wanted.Visible = false
		wanted.Parent = gui
	end
	local name = gui:FindFirstChild("Name")
	local role = gui:FindFirstChild("Role")
	local distance = gui:FindFirstChild("Distance")
	local wanted = gui:FindFirstChild("Wanted")
	if name then name.Text = player.DisplayName ~= "" and player.DisplayName or player.Name name.TextColor3 = Config.ESPColor end
	if role then
		if Config.TeamESP then
			local roleName,roleColor = getRoleInfo(player)
			role.Text = "["..roleName.."]"
			role.TextColor3 = roleColor
		else
			role.Text = ""
		end
	end
	if distance then
		distance.Visible = Config.Distance
		if Config.Distance then
			local localCharacter = LocalPlayer.Character
			local localRoot = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart")
			if localRoot then
				local studs = (localRoot.Position-root.Position).Magnitude
				distance.Text = "DISTÂNCIA: "..math.floor(studs).." m"
			else
				distance.Text = ""
			end
		else
			distance.Text = ""
		end
	end
	if wanted then
		if Config.WantedESP then
			local isWanted,stars = checkWanted(player)
			if isWanted and stars > 0 then
				wanted.Visible = true
				wanted.Text = "⚠ PROCURADO "..getStarsText(stars)
			else
				wanted.Visible = false
				wanted.Text = ""
			end
		else
			wanted.Visible = false
			wanted.Text = ""
		end
	end
end

local function removeChams(player)
	local char = player.Character
	if not char then return end
	local cham = char:FindFirstChild("XRBLOX_CHAMS")
	if cham then cham:Destroy() end
end

local function updateChams(player)
	if player == LocalPlayer then return end
	local char = player.Character
	if not char then return end
	if not Config.Enabled or not Config.Chams then removeChams(player) return end
	local cham = char:FindFirstChild("XRBLOX_CHAMS")
	if not cham then
		cham = Instance.new("Highlight")
		cham.Name = "XRBLOX_CHAMS"
		cham.Adornee = char
		cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		cham.Parent = char
	end
	cham.FillColor = Config.ChamsColor
	cham.OutlineColor = Config.ChamsColor
	cham.FillTransparency = Config.ChamsTransparency
	cham.OutlineTransparency = 0
	cham.Enabled = true
end

local function removeHealth(player)
	local char = player.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	local old = head:FindFirstChild("XRBLOX_HEALTH")
	if old then old:Destroy() end
end

local function updateHealth(player)
	if player == LocalPlayer then return end
	local char = player.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not head or not humanoid then return end
	local old = head:FindFirstChild("XRBLOX_HEALTH")
	if not Config.Enabled or not Config.Health then
		if old then old:Destroy() end
		return
	end
	local gui = old
	if not gui then
		gui = Instance.new("BillboardGui")
		gui.Name = "XRBLOX_HEALTH"
		gui.Adornee = head
		gui.Size = UDim2.fromOffset(100,7)
		gui.StudsOffset = Vector3.new(0,2.1,0)
		gui.AlwaysOnTop = true
		gui.Parent = head
		local bg = Instance.new("Frame")
		bg.Name = "Background"
		bg.Size = UDim2.fromScale(1,1)
		bg.BackgroundColor3 = Color3.fromRGB(30,30,30)
		bg.BorderSizePixel = 0
		bg.Parent = gui
		Instance.new("UICorner",bg).CornerRadius = UDim.new(1,0)
		local bar = Instance.new("Frame")
		bar.Name = "Bar"
		bar.Size = UDim2.fromScale(1,1)
		bar.BackgroundColor3 = COLORS.GREEN
		bar.BorderSizePixel = 0
		bar.Parent = bg
		Instance.new("UICorner",bar).CornerRadius = UDim.new(1,0)
	end
	local bg = gui:FindFirstChild("Background")
	if not bg then return end
	local bar = bg:FindFirstChild("Bar")
	if not bar then return end
	local hp = math.clamp(humanoid.Health/math.max(humanoid.MaxHealth,1),0,1)
	bar.Size = UDim2.new(hp,0,1,0)
	if hp > 0.6 then bar.BackgroundColor3 = COLORS.GREEN
	elseif hp > 0.3 then bar.BackgroundColor3 = COLORS.YELLOW
	else bar.BackgroundColor3 = COLORS.RED end
end

local function removeTracers(player)
	local char = player.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local beam = root:FindFirstChild("XRBLOX_TRACER")
	if beam then beam:Destroy() end
	local attachment = root:FindFirstChild("XRBLOX_TRACER_ATTACHMENT")
	if attachment then attachment:Destroy() end
end

local function updateTracer(player)
	if player == LocalPlayer then return end
	local char = player.Character
	local localChar = LocalPlayer.Character
	if not char or not localChar then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	local localRoot = localChar:FindFirstChild("HumanoidRootPart")
	if not root or not localRoot then return end
	if not Config.Enabled or not Config.Tracers then removeTracers(player) return end
	local targetAttachment = root:FindFirstChild("XRBLOX_TRACER_ATTACHMENT")
	if not targetAttachment then
		targetAttachment = Instance.new("Attachment")
		targetAttachment.Name = "XRBLOX_TRACER_ATTACHMENT"
		targetAttachment.Position = Vector3.new(0,0,0)
		targetAttachment.Parent = root
	end
	local localAttachment = localRoot:FindFirstChild("XRBLOX_LOCAL_TRACER_ATTACHMENT")
	if not localAttachment then
		localAttachment = Instance.new("Attachment")
		localAttachment.Name = "XRBLOX_LOCAL_TRACER_ATTACHMENT"
		localAttachment.Position = Vector3.new(0,-1,0)
		localAttachment.Parent = localRoot
	end
	local beam = root:FindFirstChild("XRBLOX_TRACER")
	if not beam then
		beam = Instance.new("Beam")
		beam.Name = "XRBLOX_TRACER"
		beam.Attachment0 = localAttachment
		beam.Attachment1 = targetAttachment
		beam.FaceCamera = true
		beam.LightEmission = 1
		beam.LightInfluence = 0
		beam.Segments = 1
		beam.Parent = root
	end
	beam.Attachment0 = localAttachment
	beam.Attachment1 = targetAttachment
	beam.Color = ColorSequence.new(Config.TracerColor)
	beam.Width0 = Config.TracerThickness
	beam.Width1 = Config.TracerThickness
	beam.Transparency = NumberSequence.new(0)
	beam.Enabled = true
end

local function updateAllTracers()
	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then updateTracer(player) end
	end
end

local function removeAllTracers()
	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then removeTracers(player) end
	end
end

local BigHeadOriginals = {}
local function restoreBigHead(player)
	local char = player.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	local original = BigHeadOriginals[player]
	if original then
		pcall(function() head.Size = original.Size end)
		pcall(function() head.Transparency = original.Transparency end)
		pcall(function() head.CanCollide = original.CanCollide end)
		pcall(function() head.Massless = original.Massless end)
		pcall(function() head.CastShadow = original.CastShadow end)
		BigHeadOriginals[player] = nil
	end
end

local function updateBigHead(player)
	if player == LocalPlayer then return end
	local char = player.Character
	if not char then return end
	local head = char:FindFirstChild("Head")
	if not head then return end
	if not Config.Enabled or not Config.BigHead then restoreBigHead(player) return end
	if not BigHeadOriginals[player] then
		BigHeadOriginals[player] = {Size = head.Size, Transparency = head.Transparency, CanCollide = head.CanCollide, Massless = head.Massless, CastShadow = head.CastShadow}
	end
	local size = math.clamp(tonumber(Config.BigHeadSize) or 5,1,10)
	head.Size = Vector3.new(size,size,size)
	head.Transparency = math.clamp(Config.BigHeadTransparency,0,1)
	head.CanCollide = false
	head.Massless = true
	head.CastShadow = false
end

local function updateAllBigHeads()
	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then updateBigHead(player) end
	end
end

local function restoreAllBigHeads()
	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then restoreBigHead(player) end
	end
end

local Crosshair = Instance.new("Frame")
Crosshair.Size = UDim2.fromOffset(60,60)
Crosshair.Position = UDim2.new(0.5,-30,0.5,-30)
Crosshair.BackgroundTransparency = 1
Crosshair.Visible = false
Crosshair.ZIndex = 100
Crosshair.Parent = Gui

local CrossLines = {}
local function makeCrossLine(size,pos)
	local line = Instance.new("Frame")
	line.Size = size
	line.Position = pos
	line.BackgroundColor3 = Config.CrosshairColor
	line.BorderSizePixel = 0
	line.Parent = Crosshair
	table.insert(CrossLines,line)
end
makeCrossLine(UDim2.fromOffset(2,12),UDim2.new(0.5,-1,0,2))
makeCrossLine(UDim2.fromOffset(2,12),UDim2.new(0.5,-1,1,-14))
makeCrossLine(UDim2.fromOffset(12,2),UDim2.new(0,2,0.5,-1))
makeCrossLine(UDim2.fromOffset(12,2),UDim2.new(1,-14,0.5,-1))

local function updateCrosshair()
	Crosshair.Visible = Config.Enabled and Config.Crosshair
	for _,line in ipairs(CrossLines) do line.BackgroundColor3 = Config.CrosshairColor end
end

local VisualBox = createSection(VisualPage,"VISUAL ESP / CHAMS",520)
VisualBox.Position = UDim2.fromOffset(0,140)

toggle(VisualBox,"◈ NOME / ESP",40,Config.ESP,function(v)
	Config.ESP = v
	for _,player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then updateESP(player) end end
end)

toggle(VisualBox,"◈ DISTÂNCIA",76,Config.Distance,function(v)
	Config.Distance = v
	for _,player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then updateESP(player) end end
end)

toggle(VisualBox,"◈ CHAMS / DESTAQUE",112,Config.Chams,function(v)
	Config.Chams = v
	for _,player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then updateChams(player) end end
end)

toggle(VisualBox,"◈ BARRA DE VIDA",148,Config.Health,function(v)
	Config.Health = v
	for _,player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then updateHealth(player) end end
end)

toggle(VisualBox,"◈ TRACERS",184,Config.Tracers,function(v)
	Config.Tracers = v
	if v then updateAllTracers() else removeAllTracers() end
end)

label(VisualBox,"◈ COR DO ESP",230)
local espColors = {{"VERMELHO",COLORS.RED},{"ROXO",COLORS.PURPLE},{"AZUL",COLORS.BLUE},{"CIANO",COLORS.CYAN},{"VERDE",COLORS.GREEN},{"LARANJA",COLORS.ORANGE},{"AMARELO",COLORS.YELLOW},{"ROSA",COLORS.PINK}}
for i,data in ipairs(espColors) do
	local b = Instance.new("TextButton")
	b.Size = UDim2.fromOffset(78,28)
	b.Position = UDim2.fromOffset(10+((i-1)%4)*85,260+math.floor((i-1)/4)*34)
	b.BackgroundColor3 = data[2]
	b.Text = data[1]
	b.TextColor3 = Color3.new(0,0,0)
	b.TextSize = 7
	b.Font = Enum.Font.GothamBold
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Parent = VisualBox
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)
	b.MouseButton1Click:Connect(function()
		Config.ESPColor = data[2]
		for _,player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then updateESP(player) end end
	end)
end

label(VisualBox,"◈ COR DO CHAMS",345)
local chamsColors = {{"VERMELHO",COLORS.RED},{"ROXO",COLORS.PURPLE},{"AZUL",COLORS.BLUE},{"CIANO",COLORS.CYAN},{"VERDE",COLORS.GREEN},{"LARANJA",COLORS.ORANGE},{"AMARELO",COLORS.YELLOW},{"ROSA",COLORS.PINK}}
for i,data in ipairs(chamsColors) do
	local b = Instance.new("TextButton")
	b.Size = UDim2.fromOffset(78,28)
	b.Position = UDim2.fromOffset(10+((i-1)%4)*85,375+math.floor((i-1)/4)*34)
	b.BackgroundColor3 = data[2]
	b.Text = data[1]
	b.TextColor3 = Color3.new(0,0,0)
	b.TextSize = 7
	b.Font = Enum.Font.GothamBold
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Parent = VisualBox
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)
	b.MouseButton1Click:Connect(function()
		Config.ChamsColor = data[2]
		for _,player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer then updateChams(player) end end
	end)
end

label(VisualBox,"◈ COR DO TRACER",450)
local tracerColors = {{"R",COLORS.RED},{"P",COLORS.PURPLE},{"B",COLORS.BLUE},{"C",COLORS.CYAN},{"G",COLORS.GREEN},{"O",COLORS.ORANGE},{"Y",COLORS.YELLOW},{"P",COLORS.PINK}}
for i,data in ipairs(tracerColors) do
	local b = Instance.new("TextButton")
	b.Size = UDim2.fromOffset(42,28)
	b.Position = UDim2.fromOffset(10+(i-1)*47,480)
	b.BackgroundColor3 = data[2]
	b.Text = data[1]
	b.TextSize = 10
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Parent = VisualBox
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)
	b.MouseButton1Click:Connect(function()
		Config.TracerColor = data[2]
		updateAllTracers()
	end)
end

local BigBox = createSection(BigHeadPage,"BIG HEAD",420)
toggle(BigBox,"◈ BIG HEAD",40,Config.BigHead,function(v)
	Config.BigHead = v
	if v then updateAllBigHeads() else restoreAllBigHeads() end
end)
label(BigBox,"TAMANHO DA CABEÇA",90)
local SizeValue = label(BigBox,"TAMANHO ATUAL: "..Config.BigHeadSize,120,30)
local MinusSize = button(BigBox,"− DIMINUIR",155,38)
local PlusSize = button(BigBox,"+ AUMENTAR",200,38)
MinusSize.MouseButton1Click:Connect(function()
	Config.BigHeadSize = math.clamp(Config.BigHeadSize-1,1,10)
	SizeValue.Text = "TAMANHO ATUAL: "..Config.BigHeadSize
	updateAllBigHeads()
end)
PlusSize.MouseButton1Click:Connect(function()
	Config.BigHeadSize = math.clamp(Config.BigHeadSize+1,1,10)
	SizeValue.Text = "TAMANHO ATUAL: "..Config.BigHeadSize
	updateAllBigHeads()
end)
label(BigBox,"TRANSPARÊNCIA DA CABEÇA",255)
local TransparencyValue = label(BigBox,"TRANSPARÊNCIA: "..math.floor(Config.BigHeadTransparency*100).."%",285,30)
local LessTransparency = button(BigBox,"− MENOS TRANSPARÊNCIA",320,38)
local MoreTransparency = button(BigBox,"+ MAIS TRANSPARÊNCIA",365,38)
LessTransparency.MouseButton1Click:Connect(function()
	Config.BigHeadTransparency = math.clamp(Config.BigHeadTransparency-0.05,0,1)
	TransparencyValue.Text = "TRANSPARÊNCIA: "..math.floor(Config.BigHeadTransparency*100).."%"
	updateAllBigHeads()
end)
MoreTransparency.MouseButton1Click:Connect(function()
	Config.BigHeadTransparency = math.clamp(Config.BigHeadTransparency+0.05,0,1)
	TransparencyValue.Text = "TRANSPARÊNCIA: "..math.floor(Config.BigHeadTransparency*100).."%"
	updateAllBigHeads()
end)

local PlayerBox = createSection(PlayerPage,"PLAYER / HUD",350)
toggle(PlayerBox,"MIRA / CROSSHAIR",40,Config.Crosshair,function(v) Config.Crosshair = v updateCrosshair() end)
toggle(PlayerBox,"RGB MODE",76,Config.RGB,function(v) Config.RGB = v end)
toggle(PlayerBox,"FOV VISUAL",112,Config.FOV,function(v) Config.FOV = v end)
toggle(PlayerBox,"FPS",148,Config.FPS,function(v) Config.FPS = v end)
toggle(PlayerBox,"PING",184,Config.Ping,function(v) Config.Ping = v end)
toggle(PlayerBox,"SPEED",220,Config.Speed,function(v) Config.Speed = v end)
toggle(PlayerBox,"EFEITO DE CÂMERA",256,Config.CameraEffect,function(v) Config.CameraEffect = v end)

local SanBox = createSection(SanAuriePage,"SAN AURIE SPECIALS",250)
toggle(SanBox,"MOSTRAR EQUIPE / CARGO",40,Config.TeamESP,function(v) Config.TeamESP = v end)
toggle(SanBox,"MOSTRAR PROCURADOS",76,Config.WantedESP,function(v) Config.WantedESP = v end)
label(SanBox,"PROCURADO: 1-5 ESTRELAS",125)
label(SanBox,"Detecta Wanted / Procurado / Stars / WantedLevel",150,45)

local SettingsBox = createSection(SettingsPage,"CONFIGURAÇÕES",400)
label(SettingsBox,"COR DA INTERFACE",40)

local interfaceColors = {{"VERMELHO",COLORS.RED},{"ROXO",COLORS.PURPLE},{"AZUL",COLORS.BLUE},{"CIANO",COLORS.CYAN},{"VERDE",COLORS.GREEN},{"LARANJA",COLORS.ORANGE},{"BRANCO",COLORS.WHITE},{"ROSA",COLORS.PINK}}

local HUD = Instance.new("Frame")
HUD.Size = UDim2.fromOffset(180,76)
HUD.Position = UDim2.new(0,15,1,-94)
HUD.BackgroundColor3 = BG
HUD.BackgroundTransparency = 0.08
HUD.BorderSizePixel = 0
HUD.ZIndex = 50
HUD.Parent = Gui
Instance.new("UICorner",HUD).CornerRadius = UDim.new(0,10)

local HUDStroke = Instance.new("UIStroke")
HUDStroke.Color = Config.HubColor
HUDStroke.Transparency = 0.25
HUDStroke.Parent = HUD

local HUDTitle = Instance.new("TextLabel")
HUDTitle.Size = UDim2.new(1,-20,0,13)
HUDTitle.Position = UDim2.fromOffset(10,3)
HUDTitle.BackgroundTransparency = 1
HUDTitle.Text = "// SYSTEM MONITOR"
HUDTitle.TextColor3 = Config.HubColor
HUDTitle.TextSize = 7
HUDTitle.Font = Enum.Font.Code
HUDTitle.TextXAlignment = Enum.TextXAlignment.Left
HUDTitle.Parent = HUD

local FPSLabel = label(HUD,"FPS: --",18)
FPSLabel.Position = UDim2.fromOffset(10,18)
FPSLabel.Size = UDim2.new(1,-20,0,15)
local PingLabel = label(HUD,"PING: --",35)
PingLabel.Position = UDim2.fromOffset(10,35)
PingLabel.Size = UDim2.new(1,-20,0,15)
local SpeedLabel = label(HUD,"SPEED: --",52)
SpeedLabel.Position = UDim2.fromOffset(10,52)
SpeedLabel.Size = UDim2.new(1,-20,0,15)

local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.fromOffset(60,60)
OpenButton.Position = UDim2.new(0,20,0.5,-30)
OpenButton.BackgroundColor3 = BG
OpenButton.Text = "XR"
OpenButton.TextColor3 = Config.HubColor
OpenButton.TextSize = 17
OpenButton.Font = Enum.Font.GothamBlack
OpenButton.Visible = false
OpenButton.AutoButtonColor = false
OpenButton.ZIndex = 100
OpenButton.Parent = Gui
Instance.new("UICorner",OpenButton).CornerRadius = UDim.new(1,0)

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = Config.HubColor
OpenStroke.Thickness = 1.5
OpenStroke.Parent = OpenButton

local function updateHubColor(color)
	Config.HubColor = color
	MainStroke.Color = color
	Logo.TextColor3 = color
	LogoStroke.Color = color
	Subtitle.TextColor3 = color
	MenuTitle.TextColor3 = color
	MenuLine.BackgroundColor3 = color
	StatusDot.BackgroundColor3 = color
	StatusText.TextColor3 = color
	StageStatus.TextColor3 = color
	StageTopLine.BackgroundColor3 = color
	HackerStageStroke.Color = color
	HUDStroke.Color = color
	HUDTitle.TextColor3 = color
	OpenButton.TextColor3 = color
	OpenStroke.Color = color
	for _,b in ipairs(navButtons) do
		if b.BackgroundColor3 ~= PANEL2 then b.BackgroundColor3 = color end
	end
	for _,page in pairs(Pages) do page.ScrollBarImageColor3 = color end
end

for i,data in ipairs(interfaceColors) do
	local b = Instance.new("TextButton")
	b.Size = UDim2.fromOffset(78,28)
	b.Position = UDim2.fromOffset(10+((i-1)%4)*85,75+math.floor((i-1)/4)*34)
	b.BackgroundColor3 = data[2]
	b.Text = data[1]
	b.TextColor3 = Color3.new(0,0,0)
	b.TextSize = 7
	b.Font = Enum.Font.GothamBold
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Parent = SettingsBox
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)
	b.MouseButton1Click:Connect(function() updateHubColor(data[2]) end)
end

local DisableButton = button(SettingsBox,"DESATIVAR HUB",155,42)
local function disableAllVisuals()
	Config.Enabled = false
	updateCrosshair()
	removeAllTracers()
	restoreAllBigHeads()
	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then removeESP(player) removeChams(player) removeHealth(player) end
	end
	Camera.FieldOfView = OriginalFOV
end
local function enableAllVisuals()
	Config.Enabled = true
	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then updateESP(player) updateChams(player) updateHealth(player) updateTracer(player) updateBigHead(player) end
	end
	updateCrosshair()
end
DisableButton.MouseButton1Click:Connect(function()
	if Config.Enabled then
		disableAllVisuals()
		DisableButton.Text = "ATIVAR HUB"
	else
		enableAllVisuals()
		DisableButton.Text = "DESATIVAR HUB"
	end
end)

local ResetButton = button(SettingsBox,"RESETAR CONFIGURAÇÃO",210,42)
ResetButton.MouseButton1Click:Connect(function()
	Config.Enabled = true
	Config.ESP = true
	Config.Distance = true
	Config.Chams = false
	Config.ChamsColor = COLORS.RED
	Config.ChamsTransparency = 0.45
	Config.Health = false
	Config.Tracers = false
	Config.TracerColor = COLORS.RED
	Config.TracerThickness = 1.5
	Config.BigHead = false
	Config.BigHeadSize = 5
	Config.BigHeadTransparency = 0.15
	Config.Crosshair = false
	Config.RGB = false
	Config.FOV = false
	Config.FOVValue = 80
	Config.FPS = true
	Config.Ping = true
	Config.Speed = false
	Config.CameraEffect = false
	Config.ESPColor = COLORS.RED
	Config.CrosshairColor = COLORS.WHITE
	Config.TeamESP = true
	Config.WantedESP = true
	Camera.FieldOfView = OriginalFOV
	removeAllTracers()
	restoreAllBigHeads()
	for _,player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then removeESP(player) removeChams(player) removeHealth(player) end
	end
	updateCrosshair()
	DisableButton.Text = "DESATIVAR HUB"
	SizeValue.Text = "TAMANHO ATUAL: 5"
	TransparencyValue.Text = "TRANSPARÊNCIA: 15%"
end)

local minimized = false
Minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	Body.Visible = not minimized
	Main.Size = minimized and UDim2.fromOffset(720,72) or UDim2.fromOffset(720,570)
	Minimize.Text = minimized and "+" or "—"
end)

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
	Main.Visible = true
	OpenButton.Visible = false
end)

local dragging = false
local dragStart
local startPos
Top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

local function setupPlayer(player)
	if player == LocalPlayer then return end
	player.CharacterAdded:Connect(function()
		task.wait(0.5)
		BigHeadOriginals[player] = nil
		if Config.Enabled then
			updateESP(player)
			updateChams(player)
			updateHealth(player)
			updateTracer(player)
			updateBigHead(player)
		end
	end)
	player.CharacterRemoving:Connect(function()
		removeTracers(player)
		BigHeadOriginals[player] = nil
	end)
end
for _,player in ipairs(Players:GetPlayers()) do setupPlayer(player) end
Players.PlayerAdded:Connect(setupPlayer)
Players.PlayerRemoving:Connect(function(player)
	removeESP(player)
	removeChams(player)
	removeHealth(player)
	removeTracers(player)
	BigHeadOriginals[player] = nil
end)

local frames = 0
local fps = 60
local lastFPS = os.clock()
RunService.RenderStepped:Connect(function()
	frames = frames + 1
	local now = os.clock()
	if now - lastFPS >= 1 then
		fps = frames
		frames = 0
		lastFPS = now
	end

	local scanY = 34 + ((now * 35) % 96)
	Scanline.Position = UDim2.fromOffset(0, scanY)

	local pulse = (math.sin(now * 4) + 1) / 2
	StatusDot.BackgroundTransparency = 0.05 + pulse * 0.45

	for _,data in ipairs(HackerAnimations) do
		local wave = math.sin(now * 2.2 + data.phase)
		local wave2 = math.sin(now * 3 + data.phase)
		data.hacker.Position = UDim2.fromOffset(8, 17 + wave * 2)
		data.head.Rotation = wave * 2
		data.armL.Rotation = -8 + wave2 * 7
		data.armR.Rotation = 8 - wave2 * 7
		data.visor.BackgroundTransparency = 0.05 + ((math.sin(now * 5 + data.phase) + 1) / 2) * 0.35
		data.indicator.BackgroundTransparency = 0.1 + ((math.sin(now * 4 + data.phase) + 1) / 2) * 0.5
		data.cursor.Visible = math.floor(now * 4) % 2 == 0
	end
end)

local hackerTextTimer = 0
local hackerTextIndex = 1
local terminalMessages = {"> SYSTEM LINK...", "> ACCESS NODE...", "> VISUAL ENGINE...", "> SCANNING...", "> TARGET DATA...", "> XRBLOX ONLINE...", "> CONNECTION OK...", "> MONITORING..."}
RunService.RenderStepped:Connect(function(dt)
	hackerTextTimer = hackerTextTimer + dt
	if hackerTextTimer >= 0.65 then
		hackerTextTimer = 0
		hackerTextIndex = hackerTextIndex + 1
		if hackerTextIndex > #terminalMessages then hackerTextIndex = 1 end
		for _,data in ipairs(HackerAnimations) do
			for lineIndex,line in ipairs(data.lines) do
				local messageIndex = ((hackerTextIndex + lineIndex + data.index) % #terminalMessages) + 1
				line.Text = terminalMessages[messageIndex]
				line.TextColor3 = lineIndex == 1 and COLORS.RED or Color3.fromRGB(120, 35, 42)
			end
		end
	end
end)

local updateTimer = 0
RunService.Heartbeat:Connect(function(dt)
	if not Config.Enabled then return end
	updateTimer = updateTimer + dt

	if Config.RGB then
		local rgb = Color3.fromHSV((os.clock() % 5) / 5, 1, 1)
		MainStroke.Color = rgb
		Logo.TextColor3 = rgb
		LogoStroke.Color = rgb
		Subtitle.TextColor3 = rgb
		MenuTitle.TextColor3 = rgb
		MenuLine.BackgroundColor3 = rgb
		StatusDot.BackgroundColor3 = rgb
		StatusText.TextColor3 = rgb
		StageStatus.TextColor3 = rgb
		StageTopLine.BackgroundColor3 = rgb
		HackerStageStroke.Color = rgb
		HUDStroke.Color = rgb
		HUDTitle.TextColor3 = rgb
		OpenButton.TextColor3 = rgb
		OpenStroke.Color = rgb
	end

	if updateTimer >= 0.20 then
		updateTimer = 0
		for _,player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer then
				updateESP(player)
				updateChams(player)
				updateHealth(player)
				updateTracer(player)
				updateBigHead(player)
			end
		end

		FPSLabel.Visible = Config.FPS
		PingLabel.Visible = Config.Ping
		SpeedLabel.Visible = Config.Speed
		FPSLabel.Text = "FPS: " .. fps

		local ping = "--"
		pcall(function()
			local network = Stats:FindFirstChild("Network")
			if network then
				local server = network:FindFirstChild("ServerStatsItem")
				if server then
					local data = server:FindFirstChild("Data Ping")
					if data then ping = tostring(math.floor(data:GetValue())) end
				end
			end
		end)
		PingLabel.Text = "PING: " .. ping .. " ms"

		local char = LocalPlayer.Character
		if char then
			local root = char:FindFirstChild("HumanoidRootPart")
			if root then
				SpeedLabel.Text = "SPEED: " .. math.floor(root.AssemblyLinearVelocity.Magnitude)
			end
		end
	end

	if Config.FOV then
		Camera.FieldOfView = Config.FOVValue
	elseif Config.CameraEffect then
		local char = LocalPlayer.Character
		if char then
			local humanoid = char:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local movement = humanoid.MoveDirection.Magnitude
				local target = OriginalFOV + movement * 5
				Camera.FieldOfView = Camera.FieldOfView + (target - Camera.FieldOfView) * 0.08
			else
				Camera.FieldOfView = Camera.FieldOfView + (OriginalFOV - Camera.FieldOfView) * 0.08
			end
		end
	end
end)

Main.BackgroundTransparency = 1
Top.BackgroundTransparency = 1
Menu.BackgroundTransparency = 1
TweenService:Create(Main, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(Top, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
TweenService:Create(Menu, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

Minimize.MouseEnter:Connect(function() TweenService:Create(Minimize, TweenInfo.new(0.12), {BackgroundColor3 = PANEL3}):Play() end)
Minimize.MouseLeave:Connect(function() TweenService:Create(Minimize, TweenInfo.new(0.12), {BackgroundColor3 = PANEL2}):Play() end)
Close.MouseEnter:Connect(function() TweenService:Create(Close, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(45,10,14)}):Play() end)
Close.MouseLeave:Connect(function() TweenService:Create(Close, TweenInfo.new(0.12), {BackgroundColor3 = PANEL2}):Play() end)

Gui.Destroying:Connect(function()
	removeAllTracers()
	restoreAllBigHeads()
	Camera.FieldOfView = OriginalFOV
end)

updateCrosshair()
print("======================================")
print("XRBLOX VISUAL HUB v8.4")
print("SAN AURIE EDITION")
print("CYBER COMMAND CENTER")
print("STATUS: ONLINE")
print("3 HACKERS: ACTIVE")
print("ANIMATIONS: ACTIVE")
print("ESP: READY")
print("DISTANCE: READY")
print("CHAMS: READY")
print("HEALTH: READY")
print("TRACERS: READY")
print("BIG HEAD: READY")
print("BIG HEAD SIZE: 1-10")
print("BIG HEAD TRANSPARENCY: 0-100%")
print("TEAMS ESP: READY")
print("WANTED ESP: READY")
print("WANTED STARS: 1-5")
print("======================================")

-- ========================================================
-- MUNIÇÃO INFINITA (código original - funcionando)
-- ========================================================
local PlayersM = game:GetService("Players")
local playerM = PlayersM.LocalPlayer
local TARGET_AMMO = 999
local trackedValues = {}
local isUpdating = false

local function processInstance(inst)
	if not inst then return end
	if inst.Name == "_TeamWhitelisted" then
		pcall(function() inst:Destroy() end)
		return
	end
	if inst:IsA("ValueBase") and (inst.Name == "Ammo" or inst.Name == "Clip" or inst.Name == "StoredAmmo") then
		if not trackedValues[inst] then
			trackedValues[inst] = true
			pcall(function() inst.Value = TARGET_AMMO end)
			inst.Changed:Connect(function(newVal)
				if isUpdating then return end
				if newVal ~= TARGET_AMMO then
					isUpdating = true
					pcall(function() inst.Value = TARGET_AMMO end)
					isUpdating = false
				end
			end)
		end
	end
end

local function scanContainer(container)
	if not container then return end
	for _, item in ipairs(container:GetDescendants()) do processInstance(item) end
	container.DescendantAdded:Connect(function(descendant)
		task.defer(function() processInstance(descendant) end)
	end)
end

local backpack = playerM:WaitForChild("Backpack")
scanContainer(backpack)
if playerM.Character then scanContainer(playerM.Character) end
playerM.CharacterAdded:Connect(function(char) scanContainer(char) end)

local function safeGCScan()
	if not getgc then return end
	local gc = getgc(false)
	for i = 1, #gc do
		local obj = gc[i]
		if type(obj) == "table" then
			if rawget(obj, "Ammo") ~= nil or rawget(obj, "AmmoInClip") ~= nil then
				pcall(function()
					if rawget(obj, "Ammo") then rawset(obj, "Ammo", TARGET_AMMO) end
					if rawget(obj, "AmmoInClip") then rawset(obj, "AmmoInClip", TARGET_AMMO) end
					if rawget(obj, "StoredAmmo") then rawset(obj, "StoredAmmo", TARGET_AMMO) end
				end)
			end
		end
		if i % 2000 == 0 then task.wait() end
	end
end

task.spawn(function()
	while true do
		task.wait(5)
		pcall(safeGCScan)
	end
end)