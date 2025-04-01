if getgenv then
	if getgenv().loading3 or getgenv().loaded3 then
		return
	end
	getgenv().loading3 = true
end

function XOREncode(code, key)
	local encoded = {}
	for i = 1, #code do
		local m = string.byte(code, i)
		local a = string.byte(key, (i - 1) % #key + 1)
		table.insert(encoded, string.char(bit32.bxor(m, a)))
	end
	return table.concat(encoded)
end

local cache = nil
local a, keycache = pcall(function() return readfile("keycache") end)

if a then
	cache = game:HttpGet("https://raw.githubusercontent.com/rthdssdfs/InfJump/main/Encoded.lua", true)
	local load = loadstring(decode(cache,keycache))
	if load then
		load()
		return
	end
end

local version_ = game:HttpGet("https://raw.githubusercontent.com/rthdssdfs/InfJump/main/Version.lua", true)
version_ = game:GetService("HttpService"):JSONDecode(version_)

local function createUI()
	local nameH = "Nexus"

	local TS = game:GetService("TweenService")
	local Players = game:GetService("Players")
	local uis = game:GetService("UserInputService");

	local lastw = Color3.new(0.9, 0.9, 0.9)
	local whitew = Color3.new(0.7, 0.7, 0.7)
	local black = Color3.new(0.03, 0.03, 0.03)
	local white = Color3.new(0.04, 0.04, 0.04)
	local red = Color3.new(1, 0, 0)

	local classicFont = nil
	local classicFontFaceBold = nil
	local classicFontFaceSemiBold = nil
	local classicFontFaceExtraBold = nil

	pcall(function()
		classicFont = Enum.Font.Nunito
		classicFontFaceBold = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold)
		classicFontFaceSemiBold = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.SemiBold)
		classicFontFaceExtraBold = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.ExtraBold)
	end)

	local function setFontFace(label, face)
		pcall(function()
			label.FontFace = face
		end)
	end

	local devicetype = "None"
	local keyboard = uis.KeyboardEnabled
	local touch = uis.TouchEnabled
	local success, platform = pcall(function() return uis:GetPlatform() end)

	if success then
		if platform == Enum.Platform.Windows then
			devicetype = "PC"
		elseif platform == Enum.Platform.IOS then
			devicetype = "IOS"
		elseif platform == Enum.Platform.Android then
			devicetype = "Android"
		elseif platform == Enum.Platform.XBoxOne then
			devicetype = "XBox"
		elseif platform == Enum.Platform.PS4 then
			devicetype = "PS"
		end
	else
		if touch then
			devicetype = "Android"
		else
			devicetype = "PC"
		end
	end

	local fsize = UDim2.new(0, 440, 0, 360)

	if devicetype == "Android" or devicetype == "IOS" then
		fsize = UDim2.new(0, 400, 0, 300)
	end

	local plr = game:GetService("Players").LocalPlayer;
	local gameui = plr.PlayerGui;
	local coreui = gameui;
	local successcoreui, checkcoreui = pcall(function() return game.CoreGui:FindFirstChild("RobloxGui").Parent end)
	local xtimeout = 0.2
	local aeroY = 24
	local mobilecursorposition = Vector2.new(0, 0)

	if successcoreui == true then
		coreui = checkcoreui
	elseif checkcoreui == true then
		coreui = successcoreui
	end

	local ui = Instance.new("ScreenGui", coreui)
	ui.Name = "MainFrame"

	local mainframe = Instance.new("Frame", ui);
	mainframe.BorderSizePixel = 0
	pcall(function() Instance.new("UICorner", mainframe).CornerRadius = UDim.new(0, 3); end)

	mainframe.Size = fsize
	mainframe.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)

	local title = Instance.new("TextLabel", mainframe);

	local uiPadding43 = Instance.new("UIPadding", title)
	title.Text = version_.Version..nameH.."HUB FE "..devicetype
	title.BackgroundColor3 = black
	title.TextColor3 = lastw
	title.Size = UDim2.new(1, -4, 0, aeroY - 4)
	title.Position = UDim2.new(0, 4, 0, 4)
	title.TextSize = 20
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.ZIndex = 2
	title.BorderSizePixel = 0
	setFontFace(title, classicFontFaceBold)

	local xs = title.AbsoluteSize.Y / title.AbsoluteSize.X
	uiPadding43.PaddingLeft = UDim.new(xs)

	local border = Instance.new("Frame", mainframe)
	border.Size = UDim2.new(1, 0, 0, 2)
	border.Position = UDim2.new(0, 0, 0, aeroY)
	border.BorderSizePixel = 0
	border.BackgroundColor3 = Color3.new(1, 0, 0)
	border.ZIndex = 2
	border.Name = "Border"

	local Content = Instance.new("Frame")
	local Key = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Box = Instance.new("TextBox")
	local UIPadding = Instance.new("UIPadding")
	local Title2 = Instance.new("TextLabel")
	local UIPadding_2 = Instance.new("UIPadding")
	local Next = Instance.new("TextButton")
	local UICorner_2 = Instance.new("UICorner")
	local UIPadding_3 = Instance.new("UIPadding")
	local Cancel = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local UIPadding_4 = Instance.new("UIPadding")
	local UIStroke = Instance.new("UIStroke")

	Content.Name = "Content"
	Content.Parent = mainframe
	Content.BackgroundColor3 = black
	Content.BorderSizePixel = 0
	Content.Position = UDim2.new(0, 0, 0, 26)
	Content.Size = UDim2.new(1, 0, 1, -28)

	Key.Name = "Key"
	Key.Parent = Content
	Key.BackgroundColor3 = Color3.fromRGB(2, 2, 2)
	Key.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Key.BorderSizePixel = 0
	Key.Position = UDim2.new(0.5, -100, 0.5, -12)
	Key.Size = UDim2.new(0, 200, 0, 25)

	UIStroke.Parent = Key
	UIStroke.Thickness = 1
	UIStroke.Color = lastw

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Key

	Box.Name = "Box"
	Box.Parent = Key
	Box.BackgroundTransparency = 1
	Box.BorderSizePixel = 0
	Box.Size = UDim2.new(1, 0, 1, 0)
	Box.ClearTextOnFocus = false
	Box.Font = Enum.Font.Nunito
	Box.Text = ""
	Box.TextColor3 = whitew
	Box.TextSize = 20
	Box.TextXAlignment = Enum.TextXAlignment.Left
	Box.ZIndex = 3

	UIPadding.Parent = Box
	UIPadding.PaddingLeft = UDim.new(0, 10)

	Title2.Name = "Title"
	Title2.Parent = Key
	Title2.BackgroundTransparency = 1
	Title2.BorderSizePixel = 0
	Title2.Size = UDim2.new(1, 0, 1, 0)
	Title2.Font = Enum.Font.Nunito
	Title2.Text = "Key"
	Title2.TextColor3 = whitew
	Title2.TextSize = 20
	Title2.TextXAlignment = Enum.TextXAlignment.Left
	Title2.ZIndex = 3

	UIPadding_2.Parent = Title2
	UIPadding_2.PaddingLeft = UDim.new(0, 10)

	Next.Name = "Next"
	Next.Parent = Content
	Next.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	Next.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Next.BorderSizePixel = 0
	Next.Position = UDim2.new(0.5, 4, 0.5, 20)
	Next.Size = UDim2.new(0, 96, 0, 25)
	Next.Font = Enum.Font.Nunito
	Next.Text = "Next"
	Next.TextColor3 = Color3.fromRGB(220, 220, 220)
	Next.TextSize = 20
	Next.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Next

	UIPadding_3.Parent = Next
	UIPadding_3.PaddingLeft = UDim.new(0, 10)

	Cancel.Name = "Cancel"
	Cancel.Parent = Content
	Cancel.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
	Cancel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Cancel.BorderSizePixel = 0
	Cancel.Position = UDim2.new(0.5, -100, 0.5, 20)
	Cancel.Size = UDim2.new(0, 96, 0, 25)
	Cancel.Font = Enum.Font.Nunito
	Cancel.Text = "Cancel"
	Cancel.TextColor3 = Color3.fromRGB(10, 10, 10)
	Cancel.TextSize = 20
	Cancel.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = Cancel

	UIPadding_4.Parent = Cancel
	UIPadding_4.PaddingLeft = UDim.new(0, 10)

	local hideBar = Instance.new("Frame")
	hideBar.Parent = Key
	hideBar.BackgroundColor3 = black
	hideBar.BorderSizePixel = 0
	hideBar.Visible = false
	hideBar.ZIndex = 2

	Box.Focused:Connect(function()
		local tween = TS:Create(Title2, TweenInfo.new(0.1), {TextSize = 15})
		tween:Play()
		local tween1 = TS:Create(UIPadding_2, TweenInfo.new(0.1), {PaddingBottom = UDim.new(1,0)})
		tween1:Play()
		tween1.Completed:Wait()
		hideBar.Size = UDim2.new(0, Title2.TextBounds.X+10, 0, Title2.TextBounds.Y)
		hideBar.Position = UDim2.new(0, 5, -0.5, Title2.TextBounds.Y/2)
		hideBar.Visible = true
	end)

	Box.FocusLost:Connect(function()
		if string.len(Box.Text) > 0 then
			return
		end
		local tween = TS:Create(Title2, TweenInfo.new(0.1), {TextSize = 20})
		tween:Play()
		local tween1 = TS:Create(UIPadding_2, TweenInfo.new(0.1), {PaddingBottom = UDim.new(0,0)})
		tween1:Play()
		hideBar.Visible = false
	end)

	Cancel.MouseButton1Click:Connect(function()
		ui:Destroy()

		if script then
			script:Destroy()
		end
	end)

	return {
		OnKey = function(f)
			Next.MouseButton1Click:Connect(function()
				f(Box.Text)
			end)
		end,
		OnError = function(Text)
			Title2.Text = Text
			Title2.TextColor3 = red
			UIStroke.Color = red
			hideBar.Size = UDim2.new(0, Title2.TextBounds.X+10, 0, Title2.TextBounds.Y)
			wait(1)
			Title2.Text = "Key"
			Title2.TextColor3 = whitew
			UIStroke.Color = lastw
			hideBar.Size = UDim2.new(0, Title2.TextBounds.X+10, 0, Title2.TextBounds.Y)
		end,
		SetTitle = function(Text)
			Title2.Text = Text
			Title2.TextColor3 = whitew
			hideBar.Size = UDim2.new(0, Title2.TextBounds.X+10, 0, Title2.TextBounds.Y)
		end,
		Destroy = function(self)
			ui:Destroy()
		end
	}
end

local ui = createUI()
local waitingforexit = false

ui.OnKey(function(key)
	if waitingforexit then
		return
	end

	waitingforexit = true

	if not cache then
		ui.SetTitle("Fetching API...")
		cache = game:HttpGet("https://raw.githubusercontent.com/rthdssdfs/InfJump/main/Encoded.lua")
	end

	if not pcall(function() return loadstring("local v1")() end) then
		ui.OnError("Your "..XOREncode("","abcd").." doesn't support loadstring.")
		waitingforexit = false
		return
	end

	ui.SetTitle("Decoding API...")
	task.wait(0.5)
	local load = loadstring(XOREncode(cache, key))

	if load then
		if writefile then
			writefile("keycache", key)
		end
		ui:Destroy()
		load()
	else
		waitingforexit = false
		ui.OnError("Wrong key.")
	end

	if getgenv then
		getgenv().loading3 = nil
	end
end)
