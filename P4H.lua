local nameH = "Nexus" -- Byte, Shift, Evo, Pixel,Turbo, Nova, Vector

local function notify()
	local bindable = Instance.new("BindableEvent", nil)

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = nameH .. "HUB",
		Text = "Loading UI",
		Duration = 2,
	})

	wait()
end

local mod = {}

function mod:P4H()
	local encodekey = "kHUfQ-AxqlU"
	local wlist = {"RealTelgg","RealTelgg2","RealTelgg3","RealTelgg4","TK_REPEAT","345ufdognfdo"}

	function bit32bxor(a, b)
		local result = 0
		local shift = 1

		while a > 0 or b > 0 do
			local bitA = a % 2
			local bitB = b % 2
			local xorBit = (bitA + bitB) % 2
			result = result + xorBit * shift
			a = math.floor(a / 2)
			b = math.floor(b / 2)
			shift = shift * 2
		end

		return result
	end

	function XOREncode(code, key)
		local encoded = {}
		for i = 1, #code do
			local m = string.byte(code, i)
			local a = string.byte(key, (i - 1) % #key + 1)
			table.insert(encoded, string.char(bit32bxor(m, a)))
		end
		return table.concat(encoded)
	end

	local task = task
	local isOlderVersionOfRoblox = false

	if not task then
		task = {}
		task.spawn = spawn
		task.wait = wait
		isOlderVersionOfRoblox = true
	end

	if not pcall(function() Instance.new("UICorner"):Destroy() end) then
		isOlderVersionOfRoblox = true
		pcall(function()
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = nameH .. "HUB",
				Text = "Older Version of Roblox Detected.",
				Duration = 2,
			})
		end)
	end

	local classicFont = nil
	local classicFontFaceBold = nil
	local classicFontFaceSemiBold = nil
	local sourceSansExtraBold = nil
	local attributes = {}
	attributes.Instances = {}
	attributes.Index = {}

	if isOlderVersionOfRoblox then
		classicFont = Enum.Font.SourceSans
	else
		classicFont = Enum.Font.Nunito
	end

	pcall(function()
		classicFont = Enum.Font.Nunito
		classicFontFaceBold = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold)
		classicFontFaceSemiBold = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.SemiBold)
		classicFontFaceExtraBold = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.ExtraBold)
	end)

	function setFontFace(label, face)
		pcall(function()
			label.FontFace = face
		end)
	end

	function insertChildren(tabl3, instance)
		for i, v in ipairs(instance:GetChildren()) do
			table.insert(tabl3, v)
			insertChildren(tabl3, v)
		end
	end

	function getDescendants(instance)
		local collection = {}
		insertChildren(collection, instance)
		return collection
	end

	function setAttribute(instance, assignstring, attribute)
		if isOlderVersionOfRoblox and instance then
			local index = table.getn(attributes.Instances, instance)

			if not index then
				index = #attributes.Instances + 1
				table.insert(attributes.Instances, instance)
			end

			local found = attributes.Index[index] or {}
			attributes.Index[index] = found

			found[assignstring] = attribute
		elseif instance then
			return instance:SetAttribute(assignstring, attribute)
		end
	end

	function getAttribute(instance, assignstring)
		if isOlderVersionOfRoblox and instance then
			local index = table.getn(attributes.Instances, instance)

			if not index then
				index = #attributes.Instances + 1
				table.insert(attributes.Instances, instance)
			end

			local found = attributes.Index[index] or {}
			attributes.Index[index] = found

			local data = found[assignstring]
			return data
		elseif instance then
			return instance:GetAttribute(assignstring)
		end
	end

	function getcharbyindex(a, b)
		return string.char(string.byte(a, b))
	end

	function splitallstring(a)
		local splitted = {}

		for i = 1, string.len(a) do
			table.insert(splitted, getcharbyindex(a, i))
		end

		return splitted
	end

	function comparesplittedword(index, firstsplit, word)
		local comparing = true

		for i = 1, string.len(word) do
			if getcharbyindex(word, i) ~= firstsplit[index + i - 1] then
				comparing = false
				break
			end
		end

		return comparing
	end

	function split(a, b, c, s)
		if not a then
			return
		end

		if isOlderVersionOfRoblox then
			local firstsplit = splitallstring(a)
			local splitted = {}
			local lastgeneration = ""
			local index = 1
			local found = 0
			local broken = false
			local wordlen = string.len(b)

			for _ = 1, string.len(a) do
				if not firstsplit[index] then
					break
				end

				if not broken and comparesplittedword(index, firstsplit, b) then
					found = found + 1
					index = index + wordlen
					table.insert(splitted, lastgeneration)
					lastgeneration = ""
					if s then
						table.insert(splitted, b)
					end
					if not c or found >= c then
						broken = true
					end
				else
					lastgeneration = lastgeneration .. firstsplit[index]
					index = index + 1
				end
			end

			if string.len(lastgeneration) > 0 then
				table.insert(splitted, lastgeneration)
				lastgeneration = ""
			end

			return splitted
		else
			return string.split(a, b, c)
		end
	end

	function table_clear(tabl3)
		if isOlderVersionOfRoblox then
			for i, v in pairs(tabl3) do
				tabl3[i] = nil
			end

			for i, v in ipairs(tabl3) do
				table.remove(tabl3, i)
			end

			return tabl3
		else
			return table.clear(tabl3)
		end
	end

	function table_find(tabl3, var)
		if isOlderVersionOfRoblox then
			local found = nil

			for i, v in pairs(tabl3) do
				if v == var then
					found = i
					break
				end
			end

			for i, v in ipairs(tabl3) do
				if v == var then
					found = i
					break
				end
			end

			return found
		else
			return table.find(tabl3, var)
		end
	end

	local uiClosed = false
	local settingsJSON = "P4HSettings.json"

	local HttpService = game:GetService("HttpService")

	function JSONEncode(str)
		return HttpService:JSONEncode(str)
	end

	function JSONDecode(str)
		return HttpService:JSONDecode(str)
	end

	local settingsHUB

	if readfile then
		local success = false
		task.spawn(function()
			local gotdata = readfile(settingsJSON)

			if pcall(function() return JSONDecode(gotdata) end) then
				writefile(settingsJSON, XOREncode(gotdata,encodekey))
				gotdata = XOREncode(gotdata,encodekey)
			elseif not pcall(function() return JSONDecode(XOREncode(gotdata,encodekey)) end) then
				gotdata = nil
			end

			if not gotdata then
				writefile(settingsJSON, XOREncode(JSONEncode(settingsHUB),encodekey))
			else
				task.spawn(function()
					settingsHUB = JSONDecode(XOREncode(gotdata,encodekey))
				end)
				if not settingsHUB then
					settingsHUB = {}
				end
			end
			success = true
		end)
		local start = tick()
		repeat task.wait() until success or tick() - start > 3
	end

	local defaultSettings = '{"ESPGunDrop":"true","AntiFling":"true","Aim-botCalculateWPing":"true","AutoLoadFriendsViewer":"true","Esp":"true","FreeCamSpeed":"2","InfDamage":"true","SeeDeadChat":"true","FlySpeed":"1.25","FOV":"70","CTRLCLICKTP":"true","PressTForDelete":"true","PanicKey":"114"}'

	if not settingsHUB then
		settingsHUB = JSONDecode(defaultSettings)
	end

	local TS = game:GetService("TweenService")

	local version_ = "beta0.613 "
	local plr = game:GetService("Players").LocalPlayer;
	local gameui = plr.PlayerGui;
	local coreui = gameui;
	local successcoreui, checkcoreui = pcall(function() return game.CoreGui:FindFirstChild("RobloxGui").Parent end)
	local xtimeout = 0.2
	local mobilecursorposition = Vector2.new(0, 0)

	if successcoreui == true then
		coreui = checkcoreui
	end

	if coreui:FindFirstChild("TeveXUI4") then
		return
	end

	local mouse = plr:GetMouse();
	local lastw = Color3.new(0.9, 0.9, 0.9)
	local whitew = Color3.new(0.85, 0.85, 0.85)
	local white = Color3.new(0.04, 0.04, 0.04)
	local black = Color3.new(0.03, 0.03, 0.03)
	local blackb = Color3.new(0.02, 0.02, 0.02)
	local fsize = UDim2.new(0, 440, 0, 360)
	local hoverOffset = 0.2
	local clickOffset = 0.3
	local whitetone = 0.7
	local blacktone = 0.1
	local darktone = 0.05
	local selectorpadding = 2
	local uiobjecttextsize = 20

	local wspace = game:GetService("Workspace")
	local GuiService = game:GetService("GuiService")
	local ui = Instance.new("ScreenGui", coreui)
	local guiinset = GuiService:GetGuiInset()

	local uis = game:GetService("UserInputService");
	local vUser = game:GetService("VirtualUser")
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
		end
	end

	function onmobile()
		return ((devicetype == "Android" or devicetype == "IOS") and true) or false
	end

	if onmobile() then
		version_ = version_ .. "Mobile "
		fsize = UDim2.new(0, 400, 0, 300)
	end

	local touchpoint = Vector2.new()
	local dragging = false
	local variables = {}
	local functions = {}

	function onMobileTouch(input)
		if input.UserInputType == Enum.UserInputType.Touch then
			if input.UserInputState == Enum.UserInputState.Begin then
				mobilecursorposition = Vector2.new(input.Position.X, input.Position.Y)
			elseif input.UserInputState == Enum.UserInputState.End then
				mobilecursorposition = Vector2.new(input.Position.X, input.Position.Y)
			elseif input.UserInputState == Enum.UserInputState.Change then
				mobilecursorposition = Vector2.new(input.Position.X, input.Position.Y)
			end
		end
	end

	function onMouseMove(f)
		functions[#functions + 1] = {uis.InputChanged,
			function(input)
				if input.UserInputType == Enum.UserInputType.Touch then
					f(Vector2.new(input.Position.X, input.Position.Y))
				elseif input.UserInputType == Enum.UserInputType.MouseMovement then
					f(Vector2.new(input.Position.X, input.Position.Y))
				end
			end
		}
	end

	-- uis.InputChanged:Connect(onMobileTouch)

	function onTouchStart(f, gameProcessedEvent)
		if not gameProcessedEvent then
			if onmobile() then
				functions[#functions + 1] = {uis.TouchStarted,
					function(touch)
						f(Vector2.new(touch.Position.X + guiinset.X, touch.Position.Y + guiinset.Y))
					end
				}
				return
			end
			functions[#functions + 1] = {uis.InputBegan,
				function(key)
					if key.UserInputType == Enum.UserInputType.MouseButton1 then
						f()
					end
				end
			}
		else
			functions[#functions + 1] = {mouse.Button1Down,
				function()
					f()
				end
			}
		end
	end

	function onTouchEnded(f)
		functions[#functions + 1] = {uis.InputEnded,
			function(key)
				if key.UserInputType == Enum.UserInputType.MouseButton1 then
					f()
				end
			end
		}
		functions[#functions + 1] = {uis.TouchEnded,
			function(touch)
				f(Vector2.new(touch.Position.X + guiinset.X, touch.Position.Y + guiinset.Y))
			end
		}
	end

	function onTouched(f, gameProcessedEvent)
		onTouchStart(function(pos)
			local reply = false
			local tck = tick()
			onTouchEnded(function()
				if reply then
					return
				end
				reply = true
			end)
			repeat task.wait() until reply
			if tick() - tck <= xtimeout then
				task.wait()
				f(pos)
			end
		end, gameProcessedEvent)
	end

	local uiObjectClasses = {"Frame", "TextButton", "TextLabel", "TextBox", "ScrollingFrame", "ImageButton", "ImageLabel"}

	function getCursorPoint()
		local cursorPosition = Vector2.new(0, 0)

		if uis.MouseEnabled then
			cursorPosition = uis:GetMouseLocation() - Vector2.new(guiinset.X, guiinset.Y)
		end

		if uis.TouchEnabled then
			cursorPosition = Vector2.new(mouse.X, mouse.Y)
			-- cursorPosition = mobilecursorposition
		end

		return cursorPosition
	end

	local uiAPIFunctions = {}
	uiAPIFunctions.onMouseButton1Click = {}
	uiAPIFunctions.onMouseButton1Down = {}
	uiAPIFunctions.onMouseButton1Up = {}
	uiAPIFunctions.onMouseButton2Down = {}
	uiAPIFunctions.onMouseButton2Up = {}
	uiAPIFunctions.onMouseHover = {}
	uiAPIFunctions.onMouseLeave = {}
	uiAPIFunctions.IntersectingUIObjects = {}
	uiAPIFunctions.HoverUIObjects = {}
	uiAPIFunctions.HoverUIObjectsTransparent = {}
	uiAPIFunctions.InterfaceObjects = {}
	uiAPIFunctions.GuiObjects = {}
	uiAPIFunctions.UIObjects = {}
	uiAPIFunctions.TeveXObjects = {}

	function SetInterfaceObjects()
		for i, v in ipairs(getDescendants(gameui)) do
			if table_find(uiObjectClasses, v.ClassName) then
				table.insert(uiAPIFunctions.GuiObjects, v)
				table.insert(uiAPIFunctions.InterfaceObjects, v)
			end
		end

		for i, v in ipairs(getDescendants(ui)) do
			if table_find(uiObjectClasses, v.ClassName) then
				table.insert(uiAPIFunctions.TeveXObjects, v)
			end
		end

		if coreui ~= gameui then
			for i, v in ipairs(getDescendants(coreui)) do
				if table_find(uiObjectClasses, v.ClassName) then
					table.insert(uiAPIFunctions.UIObjects, v)
					table.insert(uiAPIFunctions.InterfaceObjects, v)
					if coreui == gameui then
						table.insert(uiAPIFunctions.UIObjects, v)
					end
				end
			end
		end
	end

	function RunInterfaceObjects()
		SetInterfaceObjects()

		local a
		local b
		local c

		a = gameui.DescendantAdded:Connect(function(v)
			if uiClosed then
				a:Disconnect()
				a = nil
				return
			end
			if table_find(uiObjectClasses, v.ClassName) then
				table.insert(uiAPIFunctions.GuiObjects, v)
				table.insert(uiAPIFunctions.InterfaceObjects, v)
				if coreui == gameui then
					table.insert(uiAPIFunctions.UIObjects, v)
				end
			end
		end)

		c = ui.DescendantAdded:Connect(function(v)
			if uiClosed then
				c:Disconnect()
				c = nil
				return
			end
			if table_find(uiObjectClasses, v.ClassName) then
				table.insert(uiAPIFunctions.TeveXObjects, v)
			end
		end)

		if coreui ~= gameui then
			b = coreui.DescendantAdded:Connect(function(v)
				if uiClosed then
					b:Disconnect()
					b = nil
					return
				end
				if table_find(uiObjectClasses, v.ClassName) then
					table.insert(uiAPIFunctions.UIObjects, v)
					table.insert(uiAPIFunctions.InterfaceObjects, v)
				end
			end)
		end
	end

	function getAllInterfaceObjs()
		return uiAPIFunctions.InterfaceObjects
	end

	function getAllGUIObjs()
		return uiAPIFunctions.GuiObjects
	end

	function getAllUIObjs()
		return uiAPIFunctions.UIObjects
	end

	function getAllTeveXObjs()
		return uiAPIFunctions.TeveXObjects
	end

	function isIntersecting(uiobject)
		local cursorPoint = getCursorPoint()
		local position = uiobject.AbsolutePosition
		local size = uiobject.AbsoluteSize

		return cursorPoint.X >= position.X and cursorPoint.X <= position.X + size.X and
			cursorPoint.Y >= position.Y and cursorPoint.Y <= position.Y + size.Y
	end

	function checkVisible(v)
		if v.Parent == coreui then return 0 end
		if v.Visible == false and table_find(uiObjectClasses, v.ClassName) then return false end

		local parentVisible = checkVisible(v.Parent)
		return (parentVisible == 0 and table_find(uiObjectClasses, v.ClassName)) and v.Visible or parentVisible
	end

	function setMouseHover(uiobject, ignoreTransparentObjects)
		if ignoreTransparentObjects then
			for _, d in ipairs(uiAPIFunctions.IntersectingUIObjects) do
				if checkVisible(d) and (d.ZIndex > uiobject.ZIndex or d:IsDescendantOf(uiobject)) then
					if d.BackgroundTransparency < 0.9 then
						if not getAttribute(d, "Ignore") then
							return false
						end
					end
				end
			end
		else
			for _, d in ipairs(uiAPIFunctions.HoverUIObjects) do
				if checkVisible(d) and (d.ZIndex > uiobject.ZIndex or d:IsDescendantOf(uiobject)) then
					if not getAttribute(d, "Ignore") then
						return false
					end
				end
			end
		end

		return true
	end

	function isMouseHover(uiobject, ignoreTransparentObjects)
		if not uiobject then return false end

		if ignoreTransparentObjects then
			return table_find(uiAPIFunctions.HoverUIObjectsTransparent, uiobject)
		end

		return table_find(uiAPIFunctions.HoverUIObjects, uiobject)
	end

	local function SetIntersectingUIObjects()
		table_clear(uiAPIFunctions.IntersectingUIObjects)
		table_clear(uiAPIFunctions.HoverUIObjects)
		table_clear(uiAPIFunctions.HoverUIObjectsTransparent)

		for _,v in ipairs(getAllTeveXObjs()) do
			if isIntersecting(v) then
				table.insert(uiAPIFunctions.IntersectingUIObjects,v)
			end
		end

		for _,v in ipairs(uiAPIFunctions.IntersectingUIObjects) do
			if setMouseHover(v) then
				table.insert(uiAPIFunctions.HoverUIObjects,v)
			end
		end

		for _,v in ipairs(uiAPIFunctions.HoverUIObjects) do
			if setMouseHover(v,true) then
				table.insert(uiAPIFunctions.HoverUIObjectsTransparent,v)
			end
		end

		for _,v in ipairs(uiAPIFunctions.onMouseHover) do
			if isMouseHover(v[1], getAttribute(v[1], "IgnoreTransparentObjects")) and not getAttribute(v[1], "Hover") then
				setAttribute(v[1], "Hover", true)
				task.spawn(v[2])
			end
		end

		for _,v in ipairs(uiAPIFunctions.onMouseLeave) do
			if not isMouseHover(v[1], getAttribute(v[1], "IgnoreTransparentObjects")) and getAttribute(v[1], "Hover") then
				setAttribute(v[1], "Hover", false)
				task.spawn(v[2])
			end
		end
	end

	local function GetIntersectingUIObjects()
		return uiAPIFunctions.IntersectingUIObjects
	end

	local function GetHoverUIObjects()
		return uiAPIFunctions.HoverUIObjects
	end

	local function GetHoverUIObjectsTransparent()
		return uiAPIFunctions.HoverUIObjectsTransparent
	end

	local function CallUIAPIFunctions()
		onTouched(function(pos)
			for _,v in ipairs(uiAPIFunctions.onMouseButton1Click) do
				if checkVisible(v[1]) and isMouseHover(v[1], getAttribute(v[1], "IgnoreTransparentObjects")) then
					task.spawn(v[2],pos)
				end
			end
		end)

		onTouchStart(function(pos)
			for _,v in ipairs(uiAPIFunctions.onMouseButton1Down) do
				if checkVisible(v[1]) and isMouseHover(v[1], getAttribute(v[1], "IgnoreTransparentObjects")) then
					wspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
					task.spawn(v[2],pos)
				end
			end
		end)

		local function onInputEnded(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				for _,v in ipairs(uiAPIFunctions.onMouseButton1Up) do
					task.spawn(v[2])
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
				for _,v in ipairs(uiAPIFunctions.onMouseButton2Up) do
					task.spawn(v[2])
				end
			end
		end

		table.insert(functions, {uis.InputEnded, onInputEnded})
	end

	RunInterfaceObjects()
	--functions[#functions + 1] =  {uis.InputChanged, SetIntersectingUIObjects}
	CallUIAPIFunctions()

	function onMouseButton1Click(uiobject, callback)
		table.insert(uiAPIFunctions.onMouseButton1Click, {uiobject, callback})
	end

	function onMouseButton1Down(uiobject, callback)
		table.insert(uiAPIFunctions.onMouseButton1Down, {uiobject, callback})
	end

	function onMouseButton1Up(uiobject, callback)
		table.insert(uiAPIFunctions.onMouseButton1Up, {uiobject, callback})
	end

	function onMouseButton2Down(uiobject, callback)
		table.insert(uiAPIFunctions.onMouseButton2Down, {uiobject, callback})
	end

	function onMouseButton2Up(uiobject, callback)
		table.insert(uiAPIFunctions.onMouseButton2Up, {uiobject, callback})
	end

	function onMouseHover(uiobject, callback)
		table.insert(uiAPIFunctions.onMouseHover, {uiobject, callback})
	end

	function onMouseLeave(uiobject, callback)
		table.insert(uiAPIFunctions.onMouseLeave, {uiobject, callback})
	end

	function runUIObjectFunctions(uiobject,uiPadding)
		local btn = Instance.new("TextButton",uiobject)
		btn.BackgroundTransparency = 1
		btn.Text = ""
		btn.Size = UDim2.new(1,0,1,0)
		btn.Active = false

		functions[#functions+1] = {uiobject.MouseEnter, 
			function()
				local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
				tween:Play()
			end
		}

		functions[#functions+1] = {uiobject.MouseLeave,
			function()
				local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 3)})
				tween:Play()
				tween.Completed:Wait()
				uiPadding.PaddingLeft = UDim.new(0, 3)
			end
		}

		functions[#functions+1] = {btn.MouseButton1Down,
			function()
				local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 10)})
				tween:Play()
			end
		}

		onTouchEnded(function()
			if isIntersecting(uiobject) then
				local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
				tween:Play()
			end
		end)

		return {
			OnInteract = function(f)
				functions[#functions+1] = {btn.MouseButton1Click,f}
			end,

			OnMouseButtonDown = function(f)
				functions[#functions+1] = {btn.MouseButton1Down,f}
			end,

			OnMouseButtonUp = function(f)
				functions[#functions+1] = {btn.MouseButton1Up,f}
			end,
		}
	end

	function getAllParts()
		local radius = 5000
		local mp = (plr.Character and plr.Character.PrimaryPart and plr.Character.PrimaryPart.Position) or Vector3.new(radius, radius, radius)
		local sp = mp - Vector3.new(radius, radius, radius)
		local ep = mp + Vector3.new(radius, radius, radius)

		local region = Region3.new(sp, ep)
		local parts = workspace:FindPartsInRegion3(region, nil, math.huge)

		return parts
	end

	function findPartInModel(model, partName, allParts)
		allParts = allParts or getAllParts()

		for _, part in ipairs(allParts) do
			if part.Name == partName and part:IsDescendantOf(model) then
				return part
			end
		end
	end

	function findRoot(character)
		if workspace.StreamingEnabled then
			local allParts = getAllParts(character)
			return findPartInModel(character, "HumanoidRootPart", allParts)
		else
			return character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
		end
	end

	function touchCharacterToPart(character, part)
		local la = nil
		if workspace.StreamingEnabled then
			local allParts = getAllParts(character)
			la = findPartInModel(character, "Left Arm", allParts) or findPartInModel(character, "LeftHand", allParts)
		else
			la = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftHand")
		end

		if not la then
			return
		end

		la:BreakJoints()
		local connection = game:GetService("RunService").Stepped:Connect(function()
			if part.Parent and la.Parent then
				la.CFrame = part.CFrame
			end
		end)

		local m = {}
		function m:Disconnect()
			connection:Disconnect()
		end

		return m
	end

	function encodetext(text)
		local encoded = ""

		for i = 1, math.huge do
			if not string.byte(text, i) then
				break
			end
			if string.char(string.byte(text, i)) == " " then
				encoded = encoded .. " "
			else
				encoded = encoded .. string.char(string.byte(text, i) + 2)
			end
		end

		return encoded
	end

	function decodetext(text)
		local decoded = ""

		for i = 1, math.huge do
			if not string.byte(text, i) then
				break
			end
			if string.char(string.byte(text, i)) == " " then
				decoded = decoded .. " "
			else
				decoded = decoded .. string.char(string.byte(text, i) - 2)
			end
		end

		return decoded
	end

	if guiinset == Vector2.new(0, 0) then
		repeat
			task.wait()
			guiinset = GuiService:GetGuiInset()
		until guiinset ~= Vector2.new(0, 0)
	end

	ui.Name = "TeveXUI4"
	ui.ResetOnSpawn = false
	ui.DisplayOrder = 9999

	if not game:IsLoaded() then
		game.Loaded:Wait()
	end

	local aeroY = 24

	local notifyi = Instance.new("Frame", ui)

	notifyi.BackgroundTransparency = 1
	notifyi.Size = UDim2.new(0, 250-5, 1, -30)
	notifyi.Position = UDim2.new(1, -250, 0, 15)
	notifyi.ZIndex = 999
	notifyi.Name = "NotificationContainer"

	if onmobile() then
		notifyi.Size = UDim2.new(0, 200-5, 1, -30)
		notifyi.Position = UDim2.new(1, -200, 0, 15)
	end

	local UIListLayout = Instance.new("UIListLayout", notifyi)
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(0, 2)

	local Notification = function(_Title, _Text, Time, xtype)
		local BG = Instance.new("Frame", notifyi)
		BG.Size = UDim2.new(1, 0, 0, 100)
		BG.BackgroundTransparency = 1
		BG.ZIndex = 999

		if onmobile() then
			BG.Size = UDim2.new(1, 0, 0, 75)
		end

		local notification = Instance.new("Frame", BG)
		notification.BorderSizePixel = 0
		pcall(function() Instance.new("UICorner", notification).CornerRadius = UDim.new(0, 4) end)
		notification.Size = UDim2.new(1, 0, 1, 0)
		notification.BackgroundColor3 = black
		notification.ZIndex = 999
		notification.ClipsDescendants = true
		notification.Position = UDim2.new(1, 0, 0, 0)
		notification.Name = "Notification"

		local frame = Instance.new("Frame", notification)
		frame.Position = UDim2.new(0, 0, 1, -19)
		frame.Size = UDim2.new(1, 0, 0, 1)
		frame.BorderSizePixel = 0
		frame.BackgroundColor3 = whitew
		frame.ZIndex = 999

		local text = Instance.new("TextLabel", notification)
		text.BackgroundTransparency = 1
		text.Position = UDim2.new(0, 15, 0, 19)
		text.Size = UDim2.new(1, -30, 1, -43)
		text.Font = classicFont
		text.TextSize = 15
		text.TextColor3 = whitew
		text.TextXAlignment = Enum.TextXAlignment.Left
		text.TextYAlignment = Enum.TextYAlignment.Top
		text.Text = _Text
		text.TextWrapped = true
		text.ZIndex = 999
		text.Name = "Comment"

		local title = Instance.new("TextLabel", notification)
		title.BackgroundColor3 = Color3.new(1, 1, 0)

		local titlecorner = Instance.new("Frame")
		titlecorner.Size = UDim2.new(1,0,0,8)
		titlecorner.ZIndex = 999
		titlecorner.BorderSizePixel = 0
		titlecorner.BackgroundColor3 = Color3.new(1, 1, 0)
		titlecorner.Parent = notification
		pcall(function() Instance.new("UICorner", titlecorner).CornerRadius = UDim.new(0, 3) end)

		if xtype == 2 then
			title.BackgroundColor3 = Color3.new(0, 1, 1)
			titlecorner.BackgroundColor3 = Color3.new(0, 1, 1)
		elseif xtype == 3 then
			title.BackgroundColor3 = Color3.new(1, 0, 0)
			titlecorner.BackgroundColor3 = Color3.new(1, 0, 0)
		end

		title.BorderSizePixel = 0
		title.Position = UDim2.new(0, 0, 0, 4)
		title.Size = UDim2.new(1, 0, 0, 15)
		setFontFace(title, classicFontFaceBold)
		title.TextSize = 17
		title.TextColor3 = black
		title.Text = _Title
		title.ZIndex = 1000
		title.Name = "Title"

		local _time = Instance.new("TextLabel", notification)
		_time.BackgroundTransparency = 1
		_time.Position = UDim2.new(0, 0, 1, -19)
		_time.Size = UDim2.new(1, 0, 0, 15)
		setFontFace(_time, classicFontFaceBold)
		_time.TextSize = 17
		_time.TextColor3 = whitew
		_time.ZIndex = 999

		if Time == true then
			_time.Text = ""
		else
			_time.Text = "Removing in " .. Time .. " seconds..."
		end

		if Time ~= true then
			frame.BackgroundColor3 = Color3.new(0, 1, 1)
			frame.Size = UDim2.new(1, 0, 0, 1)
		end

		local tween2 = TS:Create(notification, TweenInfo.new(0.4), {Position = UDim2.new(0, 0, 0, 0)})
		tween2:Play()
		tween2.Completed:Wait()

		if Time == true then
			return function()
				local tween = TS:Create(notification, TweenInfo.new(0.4), {Position = UDim2.new(1, 0, 0, 0)})
				tween:Play()
				tween.Completed:Wait()
				BG:Destroy()
			end
		else
			local _tick = tick()
			repeat
				task.wait()
				local ctime = (tick() - _tick)
				local rtime = Time - ctime
				local btime = ctime / Time
				frame.Size = UDim2.new(1 - btime, 0, 0, 1)
				_time.Text = "Removing in " .. math.floor(rtime) .. " seconds..."
			until tick() - _tick >= Time
			local tween = TS:Create(notification, TweenInfo.new(0.4), {Position = UDim2.new(1, 0, 0, 0)})
			tween:Play()
			tween.Completed:Wait()
			BG:Destroy()
		end
	end

	function teleportplrplaceinstance(placeid, placeinstance)
		local TS = game:GetService("TeleportService")
		local gottpdata = TS:GetLocalPlayerTeleportData()
		if gottpdata then
			local teleportFolder = Instance.new("Folder", game:GetService("Lighting"))
			teleportFolder.Name = "TeleportingData"
			for i, v in ipairs(gottpdata) do
				v:Clone().Parent = teleportFolder
			end

			task.spawn(function()
				task.spawn(function() Notification(nameH .. "UI", "Got TPData " .. tostring(gottpdata) .. "...", 10, 2) end)
				wait(10)
				task.spawn(function() Notification(nameH .. "UI", "Timeout 5 seconds, removing TPData...", 3, 3) end)
				teleportFolder:Destroy()
			end)

			TS:TeleportToPlaceInstance(placeid, placeinstance, plr, nil, teleportFolder:GetChildren())
		else
			TS:TeleportToPlaceInstance(placeid, placeinstance, plr)
			task.spawn(function() Notification(nameH .. "UI", "TPData not found.", 3, 3) end)
		end
	end

	function teleportplr(placeid)
		local TS = game:GetService("TeleportService")
		local gottpdata = TS:GetLocalPlayerTeleportData()
		if gottpdata then
			local teleportFolder = Instance.new("Folder", game:GetService("Lighting"))
			teleportFolder.Name = "TeleportingData"
			for i, v in ipairs(gottpdata) do
				v:Clone().Parent = teleportFolder
			end

			task.spawn(function()
				task.spawn(function() Notification(nameH .. "UI", "Got TPData " .. tostring(gottpdata) .. "...", 10, 2) end)
				wait(10)
				task.spawn(function() Notification(nameH .. "UI", "Timeout 5 seconds, removing TPData...", 3, 3) end)
				teleportFolder:Destroy()
			end)

			TS:Teleport(placeid, plr, teleportFolder:GetChildren())
		else
			TS:Teleport(placeid, plr)
			task.spawn(function() Notification(nameH .. "UI", "TPData not found.", 3, 3) end)
		end
	end

	local dsgfdsg = Notification(nameH .. "HUB", nameH .. "UI is loading please wait... Made by RealTelgg", true)

	local inforesponser = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and
		game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Extras") and
		game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Extras"):FindFirstChild("GetPlayerData")
	local equipemm2 = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and
		game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Inventory") and
		game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Inventory"):FindFirstChild("Equip")

	local togglefly = false;
	local flying = false;
	local flykeys = {0, 0, 0, 0, 0, 0}; -- W,A,S,D,E,F input
	local noclip = nil;
	local togglerun = false;
	local running = false;
	local prevwalkspeed = 16;
	local playercolordata = {}

	local closescreen = false;
	local tabsizey = 25
	local buttonsizey = 25
	local optionsizey = 20

	local icons = {}

	icons.Sniper = "rbxassetid://18398967690";
	icons.About = "rbxassetid://18206036090";
	icons.Close = "rbxassetid://133542559274293"; -- "rbxassetid://18206051623";
	icons.Game = "rbxassetid://18206057575";
	icons.Hide = "rbxassetid://18969516923";
	icons.Minimize = "rbxassetid://102935692399660"; -- "rbxassetid://18206074254";
	icons.Question = "rbxassetid://18206078231";
	icons.Scripts = "rbxassetid://18206082750";
	icons.Shadow = "rbxassetid://14693025257";
	icons.Logo = "rbxassetid://18206115335";
	icons.Hover = "rbxassetid://17755247580";
	icons.Universal = "rbxassetid://18206094063";
	icons.TapCursor = "rbxassetid://18624189876";
	icons.TapCursorHover = "rbxassetid://18624371859";
	icons.TapCursorPressed = "rbxassetid://18626630391";

	local defparams = nil
	pcall(function()
		defparams = RaycastParams.new()
		defparams.FilterType = Enum.RaycastFilterType.Exclude
		defparams.IgnoreWater = true
		defparams.FilterDescendantsInstances = {};
	end)

	local shadowframes = Instance.new("Frame", ui)
	shadowframes.Size = UDim2.new(1, 0, 1, 0)
	shadowframes.BackgroundTransparency = 1
	shadowframes.Name = "Shadows"

	variables.transparentobjects = {}

	for i, v in ipairs(getDescendants(wspace)) do
		if v:IsA("BasePart") and not v:IsA("Terrain") and v.Transparency > 0.9 then
			table.insert(variables.transparentobjects, v)
		end
	end

	functions[#functions + 1] = {wspace.DescendantAdded,
		function(v)
			if v:IsA("BasePart") and not v:IsA("Terrain") and v.Transparency > 0.9 then
				table.insert(variables.transparentobjects, v)
			end
		end
	}

	function applyCharacter(char)
		for i, v in ipairs(getDescendants(char)) do
			if v:IsA("BasePart") and not v:IsA("Terrain") then
				table.insert(variables.transparentobjects, v)
			end
		end
		functions[#functions + 1] = {char.DescendantAdded,
			function(v)
				if v:IsA("BasePart") and not v:IsA("Terrain") then
					table.insert(variables.transparentobjects, v)
				end
			end
		}
	end

	if plr.Character then
		applyCharacter(plr.Character)
	end

	functions[#functions + 1] = {plr.CharacterAdded,
		function(char)
			applyCharacter(char)
		end
	}

	functions[#functions + 1] = {wspace.DescendantAdded,
		function(v)
			if v:IsA("BasePart") and not v:IsA("Terrain") and v.Transparency > 0.9 then
				table.insert(variables.transparentobjects, v)
			end
		end
	}

	function raycast(origin, direction, params)
		local result = nil

		local success = pcall(function()
			result = wspace:Raycast(origin, direction * 100000, params)
		end)

		if not success or not result then
			local ray = Ray.new(origin, direction * 100000)
			result = {}
			result.Instance = wspace:FindPartOnRay(ray, params)
			result.Position = Vector3.new()
			result.Normal = Vector3.new(0,1,0)
		end

		return result
	end

	function getMouseRay(blistinvisparts)
		local params
		local ray

		local success, result = pcall(function()
			if RaycastParams then
				params = RaycastParams.new()
				params.FilterType = Enum.RaycastFilterType.Exclude
				return true
			end
			return false
		end)

		if success and params then
			local di = (plr.Character and getDescendants(plr.Character)) or {}

			if blistinvisparts then
				di = variables.transparentobjects
			end
			params.FilterDescendantsInstances = di

			local dir = wspace.CurrentCamera:ScreenPointToRay(mouse.X, mouse.Y)
			ray = wspace:Raycast(dir.Origin, dir.Direction * 100000, params)
		else
			ray = {}
			ray.Instance = mouse.Target
			ray.Normal = Vector3.new(0,1,0)
			ray.Position = mouse.Hit.Position
		end

		return ray
	end

	function getRayOnLocation(fl, pos, blistinvisparts)
		local params = nil
		local success, result = pcall(function()
			if RaycastParams then
				params = RaycastParams.new()
				params.FilterType = Enum.RaycastFilterType.Exclude
				return true
			end
			return false
		end)

		if not success then
			warn("RaycastParams is not available.")
			params = nil
		end

		local di = (plr.Character and getDescendants(plr.Character)) or {}
		if blistinvisparts then
			di = variables.transparentobjects
		end

		if params then
			params.FilterDescendantsInstances = di

			local dir = (pos - fl).Unit
			local ray = wspace:Raycast(fl, dir * 100000, params)
			if ray then
				return ray
			end
		else
			params = di
			local dir = (pos - fl).Unit
			local result = raycast(fl, dir * 100000, params)
			return result
		end
	end

	function SetLoadingFrame(frame, customsize, space, centersize)
		space = space or 0.2
		customsize = customsize or 6
		centersize = centersize or 0.05
		local broken = false
		local loader = Instance.new("Frame",frame)
		loader.Size = UDim2.new(1,0,1,0)
		loader.BackgroundTransparency = 1

		local function controldot()
			local dot = Instance.new("Frame",loader)
			dot.Position = UDim2.new(0,0,0.5,-customsize/2)
			dot.Size = UDim2.new(0,customsize,0,customsize)
			dot.BorderSizePixel = 0
			dot.BackgroundColor3 = Color3.new(1,1,1)
			Instance.new("UICorner",dot).CornerRadius = UDim.new(1,0)

			local length = 15
			local speed = 1/length

			while task.wait() do
				if broken or not loader then
					break
				end
				local mag = math.abs(dot.Position.X.Scale-0.5)
				if mag < centersize then
					mag = centersize/2
				end
				dot.Position += UDim2.new(speed*mag,0,0,0)
				if dot.Position.X.Scale > 1 then
					break
				end
			end

			dot:Destroy()
		end

		return {
			Connect = function(self)
				task.spawn(function()
					while true do
						if broken or not loader then
							break
						end
						for i = 1, 4 do
							if broken or not loader then
								break
							end
							task.spawn(function()
								controldot()
							end)
							task.wait(space)
						end
						controldot()
						task.wait(0.5)
					end
				end)
				return {
					Disconnect = function(self)
						task.spawn(function()
							broken = true
							loader:Destroy()
						end)
					end,
				}
			end,
		}
	end

	onTouchEnded(function()
		if wspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable then
			wspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		end
	end)

	function setFrameShadow(frame)
		local shadowimage = Instance.new("ImageLabel", shadowframes)
		local shadowclipsize = Vector2.new(240, 180)
		shadowclipsize = shadowclipsize / (wspace.CurrentCamera.ViewportSize / shadowclipsize)
		local shadowstartsize = Vector2.new(0, 0)
		pcall(function() shadowimage.Image = icons.Shadow; end)
		shadowimage.BackgroundTransparency = 1
		frame.Destroying:Connect(function()
			frame = nil
		end)
		game:GetService("RunService").RenderStepped:Connect(function()
			if not frame then
				if shadowimage then
					shadowimage:Destroy()
				end
				return
			end
			shadowimage.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset - shadowstartsize.X,
				frame.Position.X.Scale, frame.Position.Y.Offset - shadowstartsize.Y);
			shadowimage.Size = UDim2.new(frame.Size.X.Scale, frame.Size.X.Offset + shadowclipsize.X, frame.Size.Y.Scale,
				frame.Size.Y.Offset + shadowclipsize.Y);
		end)
		return shadowimage
	end

	local function imageMouseHover(image, hoverColor)
		local originalColor = image.ImageColor3
		local tweenInfo = TweenInfo.new(0.2)

		local mouseEnterConnection	
		local mouseLeaveConnection

		local function createTween(targetColor)
			local tween = TS:Create(image, tweenInfo, {ImageColor3 = targetColor})
			tween:Play()
			return tween
		end

		local function onMouseEnter()
			if uiClosed then
				if mouseEnterConnection then
					mouseEnterConnection:Disconnect()
					mouseEnterConnection = nil
				end
				return
			end
			local tween = createTween(hoverColor)
			tween.Completed:Wait()
		end

		local function onMouseLeave()
			if uiClosed then
				if mouseLeaveConnection then
					mouseLeaveConnection:Disconnect()
					mouseLeaveConnection = nil
				end
				return
			end
			local tween = createTween(originalColor)
			tween.Completed:Wait()
		end

		mouseEnterConnection = image.MouseEnter:Connect(onMouseEnter)
		mouseLeaveConnection = image.MouseLeave:Connect(onMouseLeave)
	end

	function runMouseHover(uiobject)
		uiobject.AutoButtonColor = false
		local prevcolor = uiobject.BackgroundColor3
		local hovercol3 = prevcolor
		local clickcol3 = prevcolor
		local tweenrunning = false
		local id = 0
		functions[#functions + 1] = {uiobject.MouseEnter,
			function()
				if id ~= 0 then
					return
				end
				id = 1
				prevcolor = uiobject.BackgroundColor3
				hovercol3 = Color3.new(math.max(prevcolor.R - hoverOffset, 0), math.max(prevcolor.G - hoverOffset, 0),
					math.max(prevcolor.B - hoverOffset, 0))
				uiobject.BackgroundColor3 = hovercol3
			end
		}
		functions[#functions + 1] = {uiobject.MouseLeave,
			function()
				id = 0
				if uiobject.BackgroundColor3 == hovercol3 then
					uiobject.BackgroundColor3 = prevcolor
				end
			end
		}
		functions[#functions + 1] = {mouse.Button1Down,
			function()
				if id ~= 1 then
					return
				end
			end
		}
	end

	local mainframe = Instance.new("Frame", ui);
	mainframe.BorderSizePixel = 0
	pcall(function() Instance.new("UICorner", mainframe).CornerRadius = UDim.new(0, 3); end)

	mainframe.Size = fsize
	mainframe.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
	setAttribute(mainframe, "IgnoreTransparentObjects", true);

	local aero = Instance.new("Frame",mainframe)
	aero.ClipsDescendants = true
	aero.Position = UDim2.new(0, 0, 0, 4)
	aero.BorderSizePixel = 0
	aero.ZIndex = 2
	aero.BackgroundColor3 = black
	aero.Size = UDim2.new(1, 0, 0, aeroY - 4)
	aero.Name = "Aero"
	setAttribute(aero, "Ignore", true)

	local title = Instance.new("TextLabel", aero);

	local uiPadding43 = Instance.new("UIPadding", title)
	title.Text = version_ .. nameH .. "HUB FE"
	title.ClipsDescendants = true
	title.BackgroundTransparency = 1
	title.TextColor3 = lastw
	setFontFace(title, classicFontFaceBold)
	title.Size = UDim2.new(1, -(aeroY*2+8), 1, 0)
	title.Position = UDim2.new(0, 0, 0, 0)
	title.TextSize = 20
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.ZIndex = 2
	title.Name = "Title"
	setAttribute(title, "Ignore", true)

	local xs = title.AbsoluteSize.Y / title.AbsoluteSize.X
	uiPadding43.PaddingLeft = UDim.new(xs)

	local uiicon = Instance.new("ImageLabel", mainframe)
	setAttribute(uiicon, "Ignore", true)
	pcall(function() uiicon.Image = icons.Logo; end)
	uiicon.ZIndex = 3
	uiicon.BackgroundTransparency = 1
	uiicon.Position = UDim2.new(0, 0, 0, 4)
	uiicon.Size = UDim2.new(xs, 0, 0, aeroY - 4)
	uiicon.Name = "Icon"

	local border = Instance.new("Frame", mainframe)
	border.Size = UDim2.new(1, 0, 0, 2)
	border.Position = UDim2.new(0, 0, 0, aeroY)
	border.BorderSizePixel = 0
	border.BackgroundColor3 = Color3.new(1, 0, 0)
	border.ZIndex = 2
	border.Name = "Border"
	setAttribute(border, "Ignore", true)

	local contentframe = Instance.new("Frame", mainframe)
	contentframe.Size = UDim2.new(1, 0, 1, -4 - aeroY)
	contentframe.Position = UDim2.new(0, 0, 0, aeroY + 2)
	contentframe.BackgroundColor3 = white
	contentframe.BorderSizePixel = 0
	contentframe.Name = "Content"

	local hide = Instance.new("ImageButton", aero)
	pcall(function() hide.Image = icons.Minimize; end)
	pcall(function() Instance.new("UICorner", hide).CornerRadius = UDim.new(0,2) end)
	hide.ZIndex = 3
	hide.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
	--hide.ImageColor3 = whitew
	hide.Size = UDim2.new(0, aeroY-4, 1, 0)
	hide.Position = UDim2.new(1, -(aeroY*2+4), 0, 0)
	imageMouseHover(hide, Color3.new(0.5, 0.5, 0.5))
	hide.Name = "Hide"

	local close = Instance.new("ImageButton", aero)
	pcall(function() close.Image = icons.Close; end)
	pcall(function() Instance.new("UICorner", close).CornerRadius = UDim.new(0,2) end)
	close.ZIndex = 3
	close.BackgroundColor3 = Color3.new(0.1,0.1,0.1)
	--close.ImageColor3 = whitew
	close.Size = UDim2.new(0, aeroY-4, 1, 0)
	close.Position = UDim2.new(1, -aeroY, 0, 0)
	imageMouseHover(close, Color3.new(0.7, 0, 0))
	close.Name = "Close"

	local tabs = Instance.new("ScrollingFrame", contentframe);
	local tabsuill = Instance.new("UIListLayout", tabs)
	tabsuill.Padding = UDim.new(0, 3);
	tabsuill.SortOrder = Enum.SortOrder.Name

	tabs.ScrollBarThickness = 3
	pcall(function() tabs.ScrollBarImageColor3 = Color3.new(0.5, 0.5, 0.5) end)
	tabs.BorderSizePixel = 0
	tabs.Size = UDim2.new(0.25, 0, 1, 0)
	tabs.Position = UDim2.new(0, 0, 0, 0)
	tabs.BackgroundColor3 = black
	tabs.TopImage = "";
	tabs.BottomImage = "";
	tabs.CanvasSize = UDim2.new()
	tabs.Visible = false

	local pageframe = Instance.new("Frame", contentframe)
	pageframe.Size = UDim2.new(0.725, 0, 0.95, 0)
	pageframe.Position = UDim2.new(0.2625, 0, 0.025, 0)
	pageframe.BackgroundTransparency = 1
	pageframe.Visible = false

	local hideframe = Instance.new("Frame", pageframe)
	hideframe.Size = UDim2.new(1, 0, 1, 0)
	hideframe.Position = UDim2.new()
	hideframe.BackgroundColor3 = black
	hideframe.BorderSizePixel = 0
	hideframe.BackgroundTransparency = 1
	hideframe.ZIndex = 2

	local loadingT = Instance.new("Frame", contentframe)

	loadingT.Size = UDim2.new(0.8, 0, 0.2, 0)
	loadingT.Position = UDim2.new(0.1, 0, 0.65, 0)
	loadingT.BackgroundTransparency = 1
	loadingT.Name = "LoadingContent"

	local loadingBarStroke = Instance.new("Frame", loadingT)
	loadingBarStroke.BorderSizePixel = 0
	pcall(function() Instance.new("UICorner", loadingBarStroke).CornerRadius = UDim.new(0, 2) end)
	loadingBarStroke.Size = UDim2.new(1, 0, 0.6, 0)
	loadingBarStroke.BackgroundColor3 = blackb
	loadingBarStroke.Name = "LoadingBarStroke"
	local loadingBar = Instance.new("Frame", loadingBarStroke)
	loadingBar.BorderSizePixel = 0
	pcall(function() Instance.new("UICorner", loadingBar).CornerRadius = UDim.new(0, 2) end)
	loadingBar.Size = UDim2.new(0, 0, 1, -4)
	loadingBar.Position = UDim2.new(0, 2, 0, 2)
	loadingBar.BackgroundColor3 = Color3.new(0, 1, 0)
	loadingBar.Name = "LoadingBar"
	local titles = Instance.new("TextLabel", loadingT)
	titles.Size = UDim2.new(1, 0, 0.4, 0)
	titles.Position = UDim2.new(0, 0, 0.6, 0)
	titles.BackgroundTransparency = 1
	titles.Text = "Loading..."
	titles.TextSize = 25
	titles.TextColor3 = whitew
	setFontFace(titles,classicFontFaceSemiBold)

	local hideframe2 = Instance.new("Frame", contentframe)
	hideframe2.Size = UDim2.new(1, 0, 1, 0)
	hideframe2.Position = UDim2.new()
	hideframe2.BackgroundColor3 = black
	hideframe2.BorderSizePixel = 0
	hideframe2.BackgroundTransparency = 1
	hideframe2.ZIndex = 1

	if dsgfdsg then
		dsgfdsg()
	end

	local cp = game:GetService("ContentProvider")
	local success,gameName

	task.spawn(function()
		local starttick = tick()

		titles.Text = "Getting GameInfo..."
		local tw32 = TS:Create(loadingBar, TweenInfo.new(5), {Size = UDim2.new(0.6, -5, 1, -4)})
		tw32:Play()
		task.spawn(function()
			success, gameName = pcall(function() return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)
			if not success then
				gameName = "Error: Getting GameInfo"
			end
			title.Text = version_ .. nameH .. "HUB FE - " .. gameName
			starttick = tick() - 2
		end)

		titles.Text = "Connecting To Services..."

		tw32 = TS:Create(loadingBar, TweenInfo.new(0.5), {Size = UDim2.new(1, -4, 1, -4)})
		tw32:Play()
		tw32.Completed:Wait()

		tw32 = TS:Create(loadingBar, TweenInfo.new(0.5), {Size = UDim2.new(1, -4, 1, -4)})
		tw32:Play()

		task.spawn(function()
			cp:PreloadAsync({game:GetService("UserInputService"), game:GetService("Workspace"), game:GetService(
				"ReplicatedStorage"), game:GetService("Players")})
			starttick = tick() - 2
		end)

		repeat task.wait() until tick() - starttick >= 2

		local tw34 = TS:Create(loadingBar, TweenInfo.new(0.1), {Size = UDim2.new(1, -4, 1, -4)})
		tw34:Play()
		tw34.Completed:Wait()

		local tw33 = TS:Create(hideframe2, TweenInfo.new(0.5), {BackgroundTransparency = 0})
		tw33:Play()

		tw33.Completed:Wait()

		loadingT:Destroy()

		wait(0.5)

		tw33 = TS:Create(hideframe2, TweenInfo.new(0.5), {BackgroundTransparency = 1})
		tw33:Play()
		tabs.Visible = true
		pageframe.Visible = true
		wait(0.5)
		hideframe2:Destroy()
	end)

	function saveSettings()
		for i, v in ipairs(settingsHUB) do
			if v == "false" then
				table.remove(settingsHUB, i)
			end
		end

		task.spawn(function()
			if writefile then
				writefile(settingsJSON, XOREncode(JSONEncode(settingsHUB),encodekey))
			end
		end)
	end

	settingsHUB["LastServer"] = settingsHUB["CurrentServer"]
	settingsHUB["CurrentServer"] = {}
	settingsHUB["CurrentServer"].PlaceId = game.PlaceId
	settingsHUB["CurrentServer"].JobId = game.JobId

	saveSettings()

	function getSetting(name)
		return settingsHUB[name]
	end

	function setSetting(name, value)
		settingsHUB[name] = value
		if value == "false" then
			settingsHUB[name] = nil
		end
	end

	function dar(angle)
		return (angle / math.pi) * 180
	end

	function getmovedir()
		local char = plr.Character
		local human = char and char:FindFirstChildOfClass("Humanoid")
		if human then
			if human.MoveDirection == Vector3.new(0, 0, 0) then
				return Vector3.new(0, 0, 0)
			end
			local moveDirection = human.MoveDirection
			local cameraCFrame = wspace.CurrentCamera.CFrame
			return (cameraCFrame * CFrame.new((CFrame.new(cameraCFrame.p, cameraCFrame.p + Vector3.new(cameraCFrame.lookVector.x, 0, cameraCFrame.lookVector.z)):VectorToObjectSpace(moveDirection))))
				.p - cameraCFrame.p
		end
	end

	function flyloop()
		local char = plr.Character
		if char and char:FindFirstChild("HumanoidRootPart") and variables["bg"] and variables["bv"] and char:FindFirstChildOfClass("Humanoid") then
			local human = char:FindFirstChildOfClass("Humanoid")
			human.PlatformStand = true
			local cf = CFrame.fromOrientation(wspace.CurrentCamera.CFrame:ToOrientation()) +
				char:FindFirstChild("HumanoidRootPart").Position
			if onmobile() then
				if getmovedir() ~= Vector3.new(0, 0, 0) then
					variables["bv"].Velocity = getmovedir() * variables["FlySpeed"] * 50
				else
					variables["bv"].Velocity = getmovedir()
				end
				variables["bg"].CFrame = CFrame.fromOrientation(wspace.CurrentCamera.CFrame:ToOrientation()) + char:FindFirstChild("HumanoidRootPart").Position
			else
				local vel = (flykeys[1] * cf.LookVector - flykeys[2] * cf.RightVector - flykeys[3] * cf.LookVector + flykeys[4] * cf.RightVector + flykeys[5] * cf.UpVector - flykeys[6] * cf.UpVector) * variables["FlySpeed"] * 50
				variables["bv"].Velocity = vel
				variables["bg"].CFrame = CFrame.fromOrientation(wspace.CurrentCamera.CFrame:ToOrientation()) + char:FindFirstChild("HumanoidRootPart").Position
			end
		end
	end

	function getRGBColor()
		local id = variables["rgbindex"]
		if id then
			local phase = id // 85
			local remainder = id % 85
			local r, g, b

			if phase == 0 then
				r = 255
				g = 0
				b = remainder * 3
			elseif phase == 1 then
				r = 255 - remainder * 3
				g = 0
				b = 255
			elseif phase == 2 then
				r = 0
				g = remainder * 3
				b = 255
			elseif phase == 3 then
				r = 0
				g = 255
				b = 255 - remainder * 3
			elseif phase == 4 then
				r = remainder * 3
				g = 255
				b = 0
			elseif phase == 5 then
				r = 255
				g = 255 - remainder * 3
				b = 0
			elseif phase >= 6 then
				variables["rgbindex"] = 0
				return getRGBColor()
			end

			return Color3.fromRGB(r, g, b)
		end
	end

	function flyon(charadded)
		local char = plr.Character
		if (char ~= variables["lastchar32"] or not charadded) and char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
			variables.lastchar32 = char
			local human = char:FindFirstChildOfClass("Humanoid")
			variables.bg = Instance.new("BodyGyro", char:FindFirstChild("HumanoidRootPart"))
			variables.bv = Instance.new("BodyVelocity", char:FindFirstChild("HumanoidRootPart"))
			variables.bg.P = 9e4
			variables.bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			variables.bg.CFrame = char:FindFirstChild("HumanoidRootPart").CFrame
			variables.bv.velocity = Vector3.new(0, 0.1, 0)
			variables.bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
			flying = true
		end
	end

	function flyoff()
		local char = plr.Character
		if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
			local human = char:FindFirstChildOfClass("Humanoid")
			flying = false
			if variables.bg then
				variables.bg:Destroy()
				variables.bg = nil
			end
			if variables.bv then
				variables.bv:Destroy()
				variables.bv = nil
			end
			human.PlatformStand = false
		end
	end

	function run()
		running = true
		local char = plr.Character
		if char then
			local human = char:FindFirstChildOfClass("Humanoid")
			if human then
				prevwalkspeed = human.WalkSpeed
				human.WalkSpeed = human.WalkSpeed * 2
			end
		end
	end

	function walk()
		running = false
		local char = plr.Character
		if char then
			local human = char:FindFirstChildOfClass("Humanoid")
			if human then
				human.WalkSpeed = prevwalkspeed
			end
		end
	end

	function noclipf()
		if noclip then
			noclip:Disconnect()
		end

		local collisionStates = {}
		local char = plr.Character

		local function updateCollisionStates()
			repeat task.wait() until char.PrimaryPart
			table_clear(collisionStates)
			for i,v in ipairs(char:GetChildren()) do
				if v:IsA("BasePart") and v.CanCollide then
					table.insert(collisionStates,v)
				end
			end
		end

		if char then
			updateCollisionStates()
		end

		noclip = game:GetService("RunService").Stepped:Connect(function()
			if uiClosed then
				return
			end

			if not plr.Character or not plr.Character.PrimaryPart then return end

			if plr.Character ~= char then
				char = plr.Character
				updateCollisionStates()
			end

			for i, v in ipairs(collisionStates) do
				if v:IsA("BasePart") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
		end)
	end

	function clipf()
		if noclip then
			noclip:Disconnect()
			noclip = nil
			local char = plr.Character
			if not char or not char:FindFirstChild("HumanoidRootPart") then return end
			char:FindFirstChild("HumanoidRootPart").CanCollide = true
		end
	end

	function disablechartouch(char)
		if not char then return end
		for i, v in ipairs(getDescendants(char)) do
			if v:IsA("BasePart") and v.CanTouch then
				v.CanTouch = false
			end
		end
	end

	function enablechartouch(char, manualactivation)
		if not manualactivation and variables.chartouchdisabler32 then
			return
		end
		if not char then return end
		for i, v in ipairs(getDescendants(char)) do
			if v:IsA("BasePart") and not v.CanTouch then
				v.CanTouch = true
			end
		end
	end

	functions[#functions + 1] = {plr.CharacterAdded,
		function(char)
			wspace.Gravity = 196.2
			if togglefly and flying then
				repeat wait() until char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid")
				flyon(true)
			end
		end
	}

	function getStringF(str, getstr)
		local cfr = split(str, ";");
		local reting = nil;
		for i, v in ipairs(cfr) do
			if string.match(v, getstr) then
				local final = split(v, "'")
				if #final > 1 then
					reting = final[2]
					break
				end
			end
		end
		return reting
	end

	function runOption(uiobject, item, uiobjectrunner, index)
		local sourcetext = item.SourceText
		local runner = item.Runner
		local stopper = item.Stopper
		local stopsignal = item.StopSignal
		local on = false;

		if getSetting(index) == "true" then
			on = true
		end

		local onoff = uiobject:FindFirstChild("Bar"):FindFirstChild("On/Off");
		local cantsave = (getStringF(sourcetext, "dontsavethis") == "true" and true) or false
		local tweenRunning = false;

		if on then
			onoff.BackgroundColor3 = Color3.new(0, whitetone, 0)
			onoff.Position = UDim2.new(0.5, 0, 0, 0)
		else
			onoff.BackgroundColor3 = Color3.new(whitetone, 0, 0)
			onoff.Position = UDim2.new(0, 0, 0, 0)
		end

		local function setOn()
			tweenRunning = true
			local tween = TS:Create(onoff, TweenInfo.new(0.4), {BackgroundColor3 = Color3.new(0, whitetone, 0), Position = UDim2.new(0.5, 0, 0, 0)})
			tween:Play()
			tweenRunning = false
		end

		local function setOff()
			tweenRunning = true
			local tween = TS:Create(onoff, TweenInfo.new(0.4),
				{BackgroundColor3 = Color3.new(whitetone, 0, 0), Position = UDim2.new(0, 0, 0, 0)})
			tween:Play()
			tweenRunning = false
		end

		if on then
			task.spawn(function()
				runner()
			end)
			setOn()
		end

		if stopsignal and stopper then
			local function stop()
				on = false
				task.spawn(function()
					if stopper then
						stopper()
					end
				end)
				setOff()
			end

			stopsignal(stop)
		end

		uiobjectrunner.OnInteract(function()
			if tweenRunning then
				return
			end
			if not on then
				on = true
				if not cantsave then
					setSetting(index, "true")
				end
				task.spawn(function()
					if runner then
						runner()
					end
				end)
				setOn()
			else
				on = false
				setSetting(index, "false")
				task.spawn(function()
					if stopper then
						stopper()
					end
				end)
				setOff()
			end
		end)
	end;

	local function numberToKeyCode(value)
		local reting = nil
		for _, keyCode in pairs(Enum.KeyCode:GetEnumItems()) do
			if keyCode.Value == value then
				reting = keyCode
				break
			end
		end
		return reting
	end

	local bindimagesindex = {}
	local bindimagescenter = UDim2.new(0, 25, 1, -125)
	local bindimagessize = UDim2.new(0, 60, 0, 60)

	local function getAbsolute(UDim2X)
		local vpsize = wspace.CurrentCamera.ViewportSize
		return Vector2.new(UDim2X.X.Scale * vpsize.X + UDim2X.X.Offset, UDim2X.Y.Scale * vpsize.Y + UDim2X.Y.Offset)
	end

	local function createBindableButton(text)
		local hoverImage = Instance.new("ImageButton")
		local textl = Instance.new("TextLabel")
		table.insert(bindimagesindex, hoverImage)
		hoverImage.Parent = ui
		hoverImage.Size = bindimagessize
		pcall(function() hoverImage.Image = icons.TapCursor end)
		-- hoverImage.PressedImage = icons.TapCursorHover
		hoverImage.BackgroundTransparency = 1
		hoverImage.ZIndex = 3

		textl.Parent = hoverImage
		textl.Size = UDim2.new(1, -20, 1, -20)
		textl.Position = UDim2.new(0, 10, 0, 10)
		textl.Text = text
		textl.TextSize = 20
		setFontFace(textl, classicFontFaceBold)
		textl.TextColor3 = whitew
		textl.TextTransparency = 0.4
		textl.TextWrapped = true
		textl.BackgroundTransparency = 1
		textl.ZIndex = 3

		local xon = false
		local xoncore = false

		game:GetService("RunService").RenderStepped:Connect(function()
			local index = table_find(bindimagesindex, hoverImage) or 1
			local imagesize = getAbsolute(bindimagessize) + Vector2.new(0, 0)
			local center = getAbsolute(bindimagescenter)
			local calcposition = center + Vector2.new(imagesize.X * (index - 1), 0)
			hoverImage.Position = UDim2.new(0, calcposition.X, 0, calcposition.Y)
			if xon == true or xoncore == true then
				pcall(function() hoverImage.Image = icons.TapCursorPressed end)
				textl.TextColor3 = black
			else
				pcall(function() hoverImage.Image = icons.TapCursor end)
				textl.TextColor3 = whitew
			end
		end)

		functions[#functions + 1] = {hoverImage.MouseButton1Down,
			function()
				xoncore = true
			end
		}

		onTouchEnded(function()
			xoncore = false
		end)

		return {
			["OnClick"] = function(f)
				functions[#functions + 1] = {hoverImage.MouseButton1Click,
					function()
						f()
					end
				}
			end,
			["SetLightOn"] = function(self)
				xon = true
			end,
			["SetLightOff"] = function(self)
				xon = false
			end,
			["Destroy"] = function(self)
				table.remove(bindimagesindex, table_find(bindimagesindex, hoverImage))
				hoverImage:Destroy()
			end,
			["GetLightState"] = function(self)
				return xon
			end
		}
	end

	local function runKeyBind(uiobject, item, uiobjectrunner, index)
		local sourcetext = item.SourceText
		local placeid = tonumber(getStringF(sourcetext, "placeid"))
		local on = false;
		local button = uiobject:FindFirstChild("Button");
		local xkey = tonumber(getSetting(index))
		local currentKey = xkey or tonumber(split(getStringF(sourcetext, "currentKey"), "0x")[2], 0x10)
		button.Text = numberToKeyCode(currentKey).Name
		if onmobile() then
			if not placeid or game.PlaceId == placeid then
				local hoverImage = createBindableButton(getStringF(sourcetext, "innertxt"))
				hoverImage.OnClick(function()
					if not variables["onnewkeybind32"] and item.Runner then
						item.Runner()
					end
				end)
			end
		end

		functions[#functions + 1] = {button.MouseButton1Click,
			function()
				if onmobile() then
					return
				end
				variables["onnewkeybind32"] = true
				button.Text = "..."
				local newkey = uis.InputBegan:Wait()
				currentKey = newkey.KeyCode.Value
				setSetting(index, tostring(newkey.KeyCode.Value))
				button.Text = numberToKeyCode(currentKey).Name
				task.wait()
				variables["onnewkeybind32"] = false
			end
		}
		functions[#functions + 1] = {uis.InputBegan,
			function(key)
				if placeid and game.PlaceId ~= placeid then
					return
				end
				if not variables["onnewkeybind32"] and not onmobile() then
					if key.KeyCode.Value == currentKey and item.Runner then
						item.Runner()
					end
				end
			end
		}
	end;

	local selectorscrollsize = UDim2.new(1, 0, 5, 0)

	local function runSelector(uiobject, item, uiobjectrunner, onoffi, updatesection, updatepage, UIStroke)
		local selectorscroll = uiobject:FindFirstChild("Selector"):FindFirstChild("ScrollingFrame")
		local scrollOn = false
		local tweenRunning = false

		local function setOn()
			if not tweenRunning then
				UIStroke.Enabled = true
				tweenRunning = true;
				scrollOn = true;
				onoffi.Rotation = -90
				selectorscroll.Visible = true
				selectorscroll.ZIndex = 2;
				local tween = TS:Create(selectorscroll, TweenInfo.new(0.2), {Size = selectorscrollsize})
				tween:Play()
				tween.Completed:Wait()
				updatesection()
				updatepage()
				tweenRunning = false;
			end
		end

		local function setOff()
			if not tweenRunning then
				UIStroke.Enabled = false
				onoffi.Rotation = 0
				tweenRunning = true;
				scrollOn = false;
				selectorscroll.ZIndex = 1;
				local tween = TS:Create(selectorscroll, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)})
				tween:Play()
				tween.Completed:Wait()
				updatesection()
				updatepage()
				selectorscroll.Visible = false
				tweenRunning = false;
			end
		end

		selectorscroll.ChildAdded:Connect(function(v)
			if v:IsA("TextButton") then
				v.MouseButton1Click:Connect(function()
					uiobject:FindFirstChild("Selector").Text = v.Text
					task.spawn(function() item.Runner(v.Text) end)
					repeat task.wait() until not tweenRunning
					setOff()
				end)
			end
		end)

		uiobjectrunner.OnInteract(function()
			if not scrollOn then
				setOn()
			else
				setOff()
			end
		end)

		if item.SelectorRunner then
			item.SelectorRunner(selectorscroll)
		end
	end

	local function runButton(uiobject, item, uiobjectrunner)
		if not item.Runner then return end
		uiobjectrunner.OnInteract(function()
			item.Runner(uiobject:FindFirstChild("TextLabel"), getStringF(item.SourceText, "innertxt"))
		end)
	end

	local function runRangeVal(uiobject, item, uiobjectrunner, index)
		local source = item.SourceText
		local max = tonumber(getStringF(source, "maxrange"))
		local min = tonumber(getStringF(source, "minrange")) or 0
		local currentrange = tonumber(getSetting(index)) or tonumber(getStringF(source, "currentrange")) or min
		local variablen = item.VariableName

		if variables[variablen] then
			local bar = uiobject:FindFirstChild("Bar")
			if bar then
				if item.AutoRun then
					task.spawn(item.AutoRun)
				end

				local rangebar = bar:FindFirstChild("RangeBar")

				local moving = false
				local xpoint = 0
				bar.Active = false

				local function onMove()
					local newSizeX = (mouse.X - bar.AbsolutePosition.X) --+xpoint
					local convertedSizeX = newSizeX / bar.AbsoluteSize.X
					convertedSizeX = math.max(math.min(convertedSizeX, 1), 0)
					rangebar.Size = UDim2.new(convertedSizeX, 0, 1, 0)

					local numberPointer = convertedSizeX * (max - min) + min
					local number = math.min(math.max(numberPointer, 0), max)
					local newrange = math.floor(number * 100) / 100
					variables[variablen] = newrange

					uiobject:FindFirstChild("Title").Text = getStringF(source, "innertxt") .. " : " .. newrange

					if item.OnChanged then
						pcall(item.OnChanged)
					end
				end

				uiobjectrunner.OnMouseButtonDown(function()
					moving = true
					xpoint = mouse.X - bar.AbsolutePosition.X
					pcall(onMove)
				end)

				onTouchEnded(function()
					moving = false
					setSetting(index, tostring(variables[variablen]))
					if item.OnFocusLost then
						pcall(item.OnFocusLost)
					end
				end)

				rangebar.Size = UDim2.new((currentrange - min) / (max - min), 0, 1, 0)

				functions[#functions + 1] = {mouse.Move,
					function()
						if moving then
							pcall(onMove)
						end
					end
				}
			end
		end
	end

	local function runTextBox(uiobject, item, uiobjectrunner)
		local box = uiobject:FindFirstChild("Box")
		if box then
			local ep = getStringF(item.SourceText, "onlyenter") or true
			functions[#functions + 1] = {box.FocusLost,
				function(l)
					if item.Runner then
						if ep and l then
							item.Runner(box.Text)
						elseif not ep and not l then
							item.Runner(box.Text)
						end
					end
				end
			}
		end
	end

	local function prepareoption(uiobject, vName, tc3)
		local button = Instance.new("TextButton", uiobject)
		button.Size = UDim2.new(1, 0, 0, optionsizey)
		button.Font = classicFont
		button.BackgroundColor3 = black
		button.TextColor3 = tc3 or whitew
		button.Name = "Option"
		button.Text = vName
		button.TextScaled = true
		button.BorderSizePixel = 0
		button.ZIndex = 3
		button.TextXAlignment = Enum.TextXAlignment.Left
		return button
	end

	local function updateplayercolordata()
		if inforesponser then
			local data = inforesponser:InvokeServer()
			if not data then
				return
			end
			table_clear(playercolordata)
			local coloredamount = 0
			for i, v in pairs(data) do
				local object = game:GetService("Players"):FindFirstChild(i)
				local color = whitew
				if v.Role == "Murderer" then
					color = Color3.new(0.7, 0, 0)
					coloredamount = coloredamount + 1
				elseif v.Role == "Sheriff" then
					color = Color3.new(0, 0, 0.7)
					coloredamount = coloredamount + 1
				elseif v.Role == "Innocent" then
					color = Color3.new(0, 0.7, 0)
					coloredamount = coloredamount + 1
				elseif v.Role == "Hero" then
					color = Color3.new(0.7, 0.7, 0)
					coloredamount = coloredamount + 1
				end
				table.insert(playercolordata, {object, color, v.Role, v.Dead})
			end
		else
			table_clear(playercolordata)
			for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
				local color = v.TeamColor.Color or whitew
				table.insert(playercolordata, {v, color, "None"})
			end
		end
	end

	local currentMap = nil
	local colorfunctions = {}

	local function callcolorfunctions()
		for i, v in ipairs(colorfunctions) do
			task.spawn(v)
		end
	end

	local function connectThreads()
		for i, v in ipairs(functions) do
			if v[3] then
				v[3]:Disconnect()
			end
			v[3] = v[1]:Connect(v[2])
		end
	end

	local function disconnectThreads()
		for i, v in ipairs(functions) do
			if v[3] then
				v[3]:Disconnect()
			end
		end
	end

	function unloadtheHUB(removeScript)
		if not variables.API16 then
			return
		end

		uiClosed = true

		for _, p in pairs(variables.API16) do
			for ix, s in pairs(p) do
				if ix ~= "Icon" and ix ~= "Id" then
					for _, i in pairs(s) do
						if i.OnRemove then
							i.OnRemove()
						end
					end
				end
			end
		end

		ui:Destroy()
		saveSettings()

		task.wait(1)

		disconnectThreads()

		if removeScript and script then
			script:Destroy()
		end
	end

	local function waitMapAdded()
		local map = wspace.ChildAdded:Wait()
		if map.Name ~= "Normal" or not map:IsA("Model") then
			waitMapAdded()
		else
			currentMap = map
		end
	end

	local function waitMapRemoved()
		local map = wspace.ChildRemoved:Wait()
		if map.Name ~= "Normal" then
			waitMapRemoved()
		else
			currentMap = nil
		end
	end

	local function isPlayerDied(player)
		local founddata = nil
		for i, v in ipairs(playercolordata) do
			if v[1] == player then
				founddata = v
				break
			end
		end
		if founddata then
			if founddata[3] == "Murderer" or founddata[3] ~= "Sheriff" or founddata[3] ~= "Innocent" or founddata[3] ~= "Hero" then
				return founddata[4]
			else
				return true
			end
		else
			return true
		end
	end

	local function addtocolorfunctions(f)
		table.insert(colorfunctions, f)
		return #colorfunctions
	end

	local function removefromcolorfunctions(index)
		table.remove(colorfunctions, index)
	end

	local function getplayercolor(player)
		local reting = Color3.new(0.7, 0.7, 0.7)
		for i, v in ipairs(playercolordata) do
			if v[1] == player then
				reting = v[2]
			end
		end
		if isPlayerDied(player) then
			reting = reting:Lerp(Color3.new(0, 0, 0), 0.3)
		end
		return reting
	end

	local function runSelectorObject(uiobject, blacklistedplayers)
		blacklistedplayers = blacklistedplayers or {}

		local sels = {}

		local function updatelist()
			local sz = 0
			for i, v in ipairs(uiobject:GetChildren()) do
				if v:IsA 'TextButton' and v.Name ~= "Hover" then
					sz = sz + 1
				end
			end
			uiobject.CanvasSize = UDim2.new(0, 0, 0, optionsizey * sz + (selectorpadding * (sz - 1)))
		end

		local function addtolist(v)
			if typeof(v) == "string" then
				local button = prepareoption(uiobject, v, whitew)
				updatelist()
				return
			end
			if not table_find(blacklistedplayers, v.Name) then
				local button = prepareoption(uiobject, v.Name, getplayercolor(v))
				table.insert(sels, {button, v})
				updatelist()
			end
		end

		for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
			task.spawn(function()
				addtolist(v)
			end)
		end

		task.spawn(function()
			addtolist("None")
		end)

		functions[#functions + 1] = {game:GetService("Players").PlayerRemoving,
			function(p)
				for i, v in ipairs(sels) do
					if v[2] == p then
						v[1]:Destroy()
						table.remove(sels, i)
						break
					end
				end
				updatelist()
			end
		}

		functions[#functions + 1] = {game:GetService("Players").PlayerAdded,
			function(v)
				addtolist(v)
			end
		}

		addtocolorfunctions(function()
			task.spawn(function()
				for i, v in ipairs(sels) do
					if v[1] and v[2] then
						v[1].TextColor3 = getplayercolor(v[2])
					end
				end
			end)
		end)
	end

	local function applyStroke(instance)
		local stroke = Instance.new("UIStroke")
		stroke.Parent = instance
		stroke.Thickness = 2
		stroke.Color = Color3.new(1, 1, 1) -- Beyaz renk
		stroke.Transparency = 0.5
	end

	local function question(questname, quest)
		local reting = nil

		local alertbg = Instance.new("TextButton")
		alertbg.Parent = ui
		alertbg.Text = ""
		alertbg.Position = UDim2.new(0, 0, 0, -36)
		alertbg.Size = UDim2.new(1, 0, 1, 36)
		alertbg.BackgroundColor3 = blackb
		alertbg.BackgroundTransparency = 0.6
		alertbg.ZIndex = 3
		alertbg.Name = "AlertBackground"

		local alertframe = Instance.new("Frame")
		alertframe.Parent = alertbg
		alertframe.BorderSizePixel = 0
		local corner = Instance.new("UICorner")
		corner.Parent = alertframe
		corner.CornerRadius = UDim.new(0, 4)
		alertframe.ZIndex = 4
		alertframe.Size = UDim2.new(0.35, 0, 0.25, 0)
		alertframe.Position = UDim2.new(0.325, 0, 0.375, 0)
		alertframe.BackgroundColor3 = black
		alertframe.Name = "AlertFrame"

		applyStroke(alertframe)

		local title = Instance.new("TextButton")
		title.Parent = alertframe
		title.ZIndex = 5
		title.BackgroundTransparency = 1
		title.TextColor3 = whitew
		title.Size = UDim2.new(1, -(aeroY-4), 0, aeroY-4)
		title.Position = UDim2.new(0, aeroY-4, 0, 0)
		title.Font = classicFont
		title.Text = questname
		title.TextSize = 25
		title.Name = "Title"
		title.TextXAlignment = Enum.TextXAlignment.Left
		setFontFace(title, classicFontFaceSemiBold)

		local icon = Instance.new("ImageLabel")
		icon.Parent = title
		icon.Image = icons.Question
		icon.BackgroundTransparency = 1
		icon.Size = UDim2.new(0, -(aeroY-4), 1, 0)
		icon.Position = UDim2.new(-0.1, 0, 0, 0)
		icon.Name = "Icon"

		local text = Instance.new("TextButton")
		text.Parent = alertframe
		text.ZIndex = 5
		text.BackgroundTransparency = 1
		text.TextColor3 = whitew
		text.Size = UDim2.new(1, 0, 1, -((2*aeroY)-8))
		text.Position = UDim2.new(0, 0, 0, aeroY-4)
		text.Font = classicFont
		text.Text = quest
		text.TextSize = 20
		text.TextXAlignment = Enum.TextXAlignment.Left
		text.TextYAlignment = Enum.TextYAlignment.Top
		text.Name = "Text"

		local no = Instance.new("TextButton")
		no.Parent = alertframe
		no.ZIndex = 5
		no.BorderSizePixel = 0
		local noCorner = Instance.new("UICorner")
		noCorner.Parent = no
		noCorner.CornerRadius = UDim.new(0, 4)
		no.BackgroundColor3 = blackb
		no.TextColor3 = Color3.new(0.7, 0, 0)
		no.Size = UDim2.new(0.5, -1, 0, aeroY-4)
		no.Position = UDim2.new(0, 0, 1, -(aeroY-4))
		no.Font = classicFont
		no.Text = "No"
		no.TextSize = 25
		no.Name = "No"

		local yes = Instance.new("TextButton")
		yes.Parent = alertframe
		yes.ZIndex = 5
		yes.BorderSizePixel = 0
		local yesCorner = Instance.new("UICorner")
		yesCorner.Parent = yes
		yesCorner.CornerRadius = UDim.new(0, 4)
		yes.BackgroundColor3 = blackb
		yes.TextColor3 = Color3.new(0, 0.7, 0)
		yes.Size = UDim2.new(0.5, -1, 0, aeroY-4)
		yes.Position = UDim2.new(0.5, 1, 1, -(aeroY-4))
		yes.Font = classicFont
		yes.Text = "Yes"
		yes.TextSize = 25
		yes.Name = "Yes"

		functions[#functions+1] = {no.MouseButton1Click, function() reting = false end}
		functions[#functions+1] = {yes.MouseButton1Click, function() reting = true end}

		repeat task.wait() until reting ~= nil
		alertbg:Destroy()
		return reting
	end

	local function updateCoreUI()
		coreui:GetGuiObjectsAtPosition(0, 0)
	end

	local characters = {}

	function turnOnJump(human)
		local touchgui = plr.PlayerGui:FindFirstChild("TouchGui")
		local touchcontrolframe = touchgui and touchgui:FindFirstChild("TouchControlFrame")
		local jumpbutton = touchcontrolframe and touchcontrolframe:FindFirstChild("JumpButton")
		local jumping = false

		local function setJumpOn()
			while true do
				local state = human:GetState()
				if human.Parent and not human.PlatformStand and jumping and state ~= Enum.HumanoidStateType.FallingDown and state ~= Enum.HumanoidStateType.Freefall then
					human:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait()
					human.StateChanged:Wait()
				elseif not jumping or not human.Parent then
					break
				else
					task.wait()
				end
			end
		end

		if jumpbutton then
			functions[#functions + 1] = {jumpbutton.MouseButton1Down,
				function()
					if human.Parent and not jumping then
						jumping = true
						setJumpOn()
					end
				end
			}
			functions[#functions + 1] = {jumpbutton.MouseButton1Up,
				function()
					if human.Parent then
						jumping = nil
					end
				end
			}
			functions[#functions + 1] = {jumpbutton.MouseLeave,
				function()
					if human.Parent then
						jumping = nil
					end
				end
			}
			functions[#functions + 1] = {GuiService.MenuOpened,
				function()
					if human.Parent then
						jumping = nil
					end
				end
			}
		end

		functions[#functions + 1] = {uis.InputBegan,
			function(key, l)
				if human.Parent and not l and key.KeyCode == Enum.KeyCode.Space and not jumping then
					jumping = true
					setJumpOn()
				end
			end
		}
		functions[#functions + 1] = {uis.InputEnded,
			function(key)
				if human.Parent and key.KeyCode == Enum.KeyCode.Space then
					jumping = nil
				end
			end
		}
	end

	local function glitchhumanoid(timeout)
		timeout = timeout or 0

		local char = plr.Character
		if not char then
			return
		end

		local human = char:FindFirstChildOfClass("Humanoid")
		if not human then
			return
		end

		if char:FindFirstChild("Animate") then
			char:FindFirstChild("Animate").Disabled = true
		end

		for i, v in ipairs(human:GetPlayingAnimationTracks()) do
			v:Stop()
		end

		local newhuman = Instance.new("Humanoid")
		newhuman.RigType = human.RigType
		newhuman.HipHeight = human.HipHeight
		if human:FindFirstChildOfClass("Animator") then
			human:FindFirstChildOfClass("Animator").Parent = newhuman
		end

		local accessories = human:GetAccessories()
		human.Parent = nil

		if timeout > 0 then
			if char:FindFirstChild("HumanoidRootPart") then
				char:FindFirstChild("HumanoidRootPart").Anchored = true
			end
			task.wait(timeout)
			if char:FindFirstChild("HumanoidRootPart") then
				char:FindFirstChild("HumanoidRootPart").Anchored = false
			end
		end

		newhuman.Parent = char

		for _, v in ipairs(accessories) do
			local accessory = v:Clone()
			accessory.Parent = char
			if accessory:FindFirstChild("Handle") then
				accessory:FindFirstChild("Handle"):BreakJoints()
				task.spawn(function()
					task.wait(0.5)
					accessory:Destroy()
				end)
			end
		end

		if char:FindFirstChild("Animate") then
			char:FindFirstChild("Animate").Disabled = false
		end

		turnOnJump(newhuman)
		task.wait()
		wspace.CurrentCamera.CameraSubject = newhuman

		return human
	end

	local function equipToolWithoutWeld(tool)
		local char = plr.Character
		if tool:FindFirstChild("Handle") and char then
			local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
			if ra then
				local grip = Instance.new("Weld",ra)
				grip.Name = "RightGrip"
				grip.Part0 = ra
				grip.Part1 = tool:FindFirstChild("Handle")
				tool.Parent = char
			end
		end
	end

	local function prepbringcouch()
		if plr:FindFirstChildOfClass("Backpack"):FindFirstChild("Couch") or plr.Character:FindFirstChild("Couch") then
			return plr:FindFirstChildOfClass("Backpack"):FindFirstChild("Couch") or plr.Character:FindFirstChild("Couch")
		end

		local giver = wspace:WaitForChild("WorkspaceCom"):WaitForChild("003_CouchGiveTool"):WaitForChild("Seat1")
		local char = plr.Character
		local human = char:FindFirstChildOfClass("Humanoid")

		local ocf = char.PrimaryPart.CFrame
		char:SetPrimaryPartCFrame(giver.CFrame)
		giver.ChildAdded:Wait()
		task.wait()
		human:ChangeState(Enum.HumanoidStateType.Jumping)
		wait(1)
		char:SetPrimaryPartCFrame(ocf)

		return plr:FindFirstChildOfClass("Backpack"):WaitForChild("Couch") or plr.Character:WaitForChild("Couch")
	end

	local function checkGripJoint(part)
		local reting = false
		for i, v in ipairs(characters) do
			if v ~= plr.Character then
				local ra = v:FindFirstChild("Right Arm") or v:FindFirstChild("RightHand")
				local rg = ra and ra:FindFirstChild("RightGrip")

				if rg then
					if rg.Part1 == part or rg.Part0 == part then
						reting = v
					end
				end
			end
		end
		return reting
	end

	local function calculateMovePoint(human, basePart)
		return human.MoveDirection * basePart.Velocity.Magnitude / 1.25
	end

	local function retsdpoint(radius, point, rotation)
		local x = math.cos(math.rad(rotation)) * radius
		local z = math.sin(math.rad(rotation)) * radius
		return Vector3.new(x, point.Y, z)
	end

	local function findintersectablecharpoint(targetchar)
		local radius = 3
		local point = targetchar.PrimaryPart.Position
		local retpoint = nil
		for i = 1, 360 do
			local p = retsdpoint(radius, point, i)
			local ray = wspace:Raycast(p, (point - p).Unit * 10, defparams)
			if ray and ray.Instance:IsDescenantOf(targetchar) then
				retpoint = CFrame.new(p, point)
				break
			end
		end
		return retpoint
	end

	function setGunHasBrokenTag(gun)
		setAttribute(gun, "Broken", true)
	end

	function getGunHasBrokenTag(gun)
		return getAttribute(gun, "Broken")
	end

	local function isGunAvailable(gun)
		if gun and gun:FindFirstChild("KnifeServer") and gun:FindFirstChild("KnifeLocal") and gun:FindFirstChild("KnifeLocal"):FindFirstChild("CreateBeam") and gun:FindFirstChild("Handle") then
			if not gun:FindFirstChild("Handle"):FindFirstChild("Reload") or (gun:FindFirstChild("Handle"):FindFirstChild("Reload").Playing == false and gun:FindFirstChild("Handle"):FindFirstChild("Gunshot") and gun:FindFirstChild("Handle"):FindFirstChild("Gunshot").Playing == false) then
				return true
			else
				return false
			end
		else
			return false
		end
	end

	local function breakGun(gun)
		if isGunAvailable(gun) then
			local RemoteFunction = variables.mm2lastgunrf
			local success = false
			local completed = 0

			if RemoteFunction then
				task.spawn(function()
					local breakFail = pcall(function() return RemoteFunction:InvokeServer(0, 0, "AH2") end)

					if not breakFail then
						success = true
						setGunHasBrokenTag(gun)
					end

					completed = completed + 1
				end)
			end

			local RemoteEvent = gun:FindFirstChild("KnifeServer") and
				gun:FindFirstChild("KnifeServer"):FindFirstChild("ShootGun")
			if RemoteEvent then
				task.spawn(function()
					local breakFail = pcall(function() return RemoteEvent:InvokeServer(0, 0, "AH2") end)

					if not breakFail then
						success = true
						setGunHasBrokenTag(gun)
					end

					completed = completed + 1
				end)
			end

			repeat task.wait() until completed >= 1

			if not success or not RemoteFunction then
				return 1
			end
		end
	end

	local function shootGun(gun, pos)
		if isGunAvailable(gun) then
			local RemoteFunction = variables.mm2lastgunrf
			local completed = 0

			if RemoteFunction then
				task.spawn(function()
					pcall(function() return RemoteFunction:InvokeServer(0, pos, "AH2") end)

					completed = completed + 1
				end)
			end

			local RemoteEvent = gun:FindFirstChild("KnifeServer") and
				gun:FindFirstChild("KnifeServer"):FindFirstChild("ShootGun")
			if RemoteEvent then
				task.spawn(function()
					pcall(function() return RemoteEvent:InvokeServer(0, pos, "AH2") end)

					completed = completed + 1
				end)
			end

			repeat task.wait() until completed >= 1

			if not not RemoteFunction then
				return 1
			end
		end
	end

	local function getSheriffGun()
		local gun = nil
		local sheriff = nil
		for _, target in ipairs(game:GetService("Players"):GetPlayers()) do
			if target and target.Character and target:FindFirstChildOfClass("Backpack") then
				local gunx = target:FindFirstChildOfClass("Backpack"):FindFirstChild("Gun") or
					target.Character:FindFirstChild("Gun")
				if gunx then
					gun = gunx
					sheriff = target
					break
				end
			end
		end
		return gun, sheriff
	end

	local function getMurderKnife()
		local knife = nil
		local murd = nil
		for _, target in ipairs(game:GetService("Players"):GetPlayers()) do
			if target and target.Character and target:FindFirstChildOfClass("Backpack") then
				local knifex = target:FindFirstChildOfClass("Backpack"):FindFirstChild("Knife") or
					target.Character:FindFirstChild("Knife")
				if knifex then
					knife = knifex
					murd = target
					break
				end
			end
		end
		return knife, murd
	end

	local function fireTrap(cf)
		local trap, trap2 =
			plr.PlayerGui:FindFirstChild("Trap") and plr.PlayerGui:FindFirstChild("Trap"):FindFirstChild("Activate"),
		game:GetService("ReplicatedStorage"):FindFirstChild("TrapSystem") and
			game:GetService("ReplicatedStorage"):FindFirstChild("TrapSystem"):FindFirstChild("PlaceTrap")
		if trap then
			trap:FireServer(cf)
		end
		if trap2 then
			trap2:InvokeServer(cf)
		end
	end

	local function fireFakeGun(bool)
		local fakegun, fakegun2 =
			plr.PlayerGui:FindFirstChild("FakeGun") and plr.PlayerGui:FindFirstChild("FakeGun"):FindFirstChild("Activate"),
		game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and
			game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Gameplay") and
			game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Gameplay"):FindFirstChild(
		"FakeGun")
		if fakegun then
			fakegun:FireServer(bool)
		end
		if fakegun2 then
			fakegun2:FireServer(bool)
		end
	end

	local function fireGhost(bool)
		local knife, murd = getMurderKnife()
		local ghost2 = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and
			game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Gameplay") and
			game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Gameplay"):FindFirstChild("Stealth")
		if murd then
			local ghost = murd.PlayerGui:FindFirstChild("Ghost") and
				murd.PlayerGui:FindFirstChild("Ghost"):FindFirstChild("Activate")
			if ghost then
				ghost:FireServer(bool)
			end
		end
		if ghost2 then
			ghost2:FireServer(bool)
		end
	end

	local function fireStab()
		local knife = getMurderKnife()
		if not knife or knife.Parent.Name == "Backpack" then
			return
		end
		local op = knife.Parent
		if op ~= plr.Character and op ~= plr:FindFirstChildOfClass("Backpack") then
			knife.Parent = plr.Character
		end

		local event = knife and knife:FindFirstChild("Stab")
		if event then
			task.spawn(function()
				event:FireServer("Slash")
			end)
		end

		if op ~= plr.Character and op ~= plr:FindFirstChildOfClass("Backpack") then
			knife.Parent = op
		end
	end

	local function getToyMM2(amount)
		local bp = plr:FindFirstChildOfClass("Backpack")
		local char = plr.Character
		local RS = game:GetService("ReplicatedStorage")
		local remotes = RS and RS:FindFirstChild("Remotes")
		local getdata = remotes and remotes:FindFirstChild("Extras") and remotes:FindFirstChild("Extras"):FindFirstChild("GetData")
		local replicateToy = remotes and remotes:FindFirstChild("Extras") and remotes:FindFirstChild("Extras"):FindFirstChild("ReplicateToy")
		local tools = {}

		if bp and char and replicateToy and getdata then
			local toys = getdata:InvokeServer("Toys")
			local owned = toys.Owned

			if owned then
				local i = 1
				while true do
					if owned[i] and not char:FindFirstChild(owned[i]) and not bp:FindFirstChild(owned[i]) then
						local success, got = pcall(function() return replicateToy:InvokeServer(owned[i]) end)
						if success and got then
							table.insert(tools,got)
						end
					end
					i += 1
					if #tools >= amount or not owned[i] then
						break
					end
				end
			end
		end

		return tools
	end

	local function breakSheriffGun(manualCall)
		local gun = getSheriffGun()

		if gun and getAttribute(gun, "Broken") and not manualCall then
			return
		end

		if isGunAvailable(gun) then
			return pcall(function()
				local exitcode = breakGun(gun)

				if exitcode ~= 1 then
					task.spawn(function() Notification(nameH .. "UI", "Gun has broken!", 2, 2) end)
				end

				return exitcode
			end)
		end
	end

	local function onSheriffGunChangedRun()
		variables.onSheriffGunChangedConnections32 = {}

		local char = plr.Character

		local function callFunctions(gun)
			for _, v in ipairs(variables.onSheriffGunChangedConnections32) do
				if v[1] then
					task.spawn(function()
						v[1](gun)
					end)
				end
			end
		end

		task.spawn(function()
			local gun = getSheriffGun()

			if gun then
				callFunctions(gun)
				gun.Changed:Wait()
			end

			while not uiClosed do
				task.wait()

				local currentGun = getSheriffGun()
				if currentGun and currentGun ~= gun then
					gun = currentGun
					callFunctions(gun)
					gun.Changed:Wait()
				elseif currentGun ~= gun then
					gun = nil
					callFunctions()
				end
			end
		end)
	end

	onSheriffGunChangedRun()

	local function onSheriffGunChanged(f)
		local gun = getSheriffGun()

		if gun then
			task.spawn(function()
				f(gun)
			end)
		end

		local index = {f}
		table.insert(variables.onSheriffGunChangedConnections32,index)

		return {
			["Disconnect"] = function(self)
				table_clear(index)
			end
		}
	end

	local function getrf(gun)
		if variables.usegetnilinstances32 then
			local found = nil
			local success, nilinstances = pcall(function() return getnilinstances() end)

			if success then
				for i, v in ipairs(nilinstances) do
					if v:IsA("RemoteFunction") and v.Name == "RemoteFunction" then
						found = v
						break
					end
				end
			end

			local asuccess, aevent = pcall(function() return gun:FindFirstChild("KnifeLocal") and
				gun:FindFirstChild("KnifeLocal"):FindFirstChild("CreateBeam") and
				gun:FindFirstChild("KnifeLocal"):FindFirstChild("CreateBeam").RemoteFunction end)
			if asuccess and aevent then
				found = aevent
			end

			return found
		else
			local asuccess, aevent = pcall(function() return gun:FindFirstChild("KnifeLocal") and
				gun:FindFirstChild("KnifeLocal"):FindFirstChild("CreateBeam") and
				gun:FindFirstChild("KnifeLocal"):FindFirstChild("CreateBeam").RemoteFunction end)
			if asuccess and aevent then
				return aevent
			end
		end
	end

	onSheriffGunChanged(function(gun)
		task.spawn(function()
			pcall(updateplayercolordata)
			pcall(callcolorfunctions)
		end)

		if gun then
			variables.mm2lastgunrf = nil
			local parent = gun.Parent
			local aevent = nil

			repeat
				if not variables.usegetnilinstances32 and gun.Parent ~= plr.Character and gun.Parent then
					gun.Parent = plr:FindFirstChildOfClass("Backpack")
				end
				task.wait()
				if not gun.Parent then
					break
				end
				aevent = getrf(gun)
			until aevent

			if aevent then
				variables.mm2lastgunrf = aevent
			end

			if gun.Parent then
				gun.Parent = parent
			end
		end
	end)

	local function allocateSheriffGun()
		if variables["lastgunmm234"] then
			variables["lastallocated34"]:Destroy()
			variables["lastallocated34"] = nil
		end

		local char = plr.Character
		local sgun, sheriff = getSheriffGun()

		if not sgun or not sheriff or not char then
			return
		end

		local gun = sgun:Clone()
		gun.Name = "FakeGun"
		gun:ClearAllChildren()
		gun.Parent = plr:FindFirstChildOfClass("Backpack")

		variables["lastallocated34"] = gun

		for i, v in ipairs(sgun:GetChildren()) do
			v.Parent = gun
		end

		if sheriff and sheriff.Character and sheriff.Character:FindFirstChild("RightHand") then
			sheriff.Character:FindFirstChild("RightHand"):Destroy()
		end

		task.spawn(function()
			while true do
				if not sgun or not sgun.Parent then
					gun:Destroy()
					break
				elseif sgun.Parent:IsA("Backpack") then
					gun.Parent = plr:FindFirstChildOfClass("Backpack")
				end
				sgun.Changed:Wait()
			end
		end)
	end

	function calculatecharactercf(troot, humant)
		return troot.CFrame + (calculateMovePoint(humant, troot) * 0.25)
	end

	local function targetshot(target)
		local gun = getSheriffGun()
		local char = plr.Character
		local root = char and char.PrimaryPart
		local tchar = target and target.Character
		local troot = tchar and tchar.PrimaryPart
		local humant = troot and tchar:FindFirstChildOfClass("Humanoid")

		if root and humant and variables.mm2lastgunrf and not variables["targetshotinprogressmm234"] and isGunAvailable(gun) then
			variables["targetshotinprogressmm234"] = true
			task.spawn(function()
				local oldParent = gun.Parent
				if oldParent.Name == "Backpack" and oldParent.Parent ~= plr then
					variables["targetshotinprogressmm234"] = nil
					return
				elseif oldParent.Name == "Backpack" then
					gun.Parent = char
				end

				local stopped = false
				local function partAdded()
					local part = wspace.ChildAdded:Wait()
					if part.Name ~= "Part" and not stopped then
						partAdded()
					end
				end

				if target == plr then
					task.spawn(function()
						shootGun(gun, root.Position)
					end)

					partAdded()
					variables["targetshotinprogressmm234"] = nil
					return
				end

				local ocf = root.CFrame
				local lookvector = troot.CFrame.LookVector
				char:SetPrimaryPartCFrame(calculatecharactercf(troot, humant) - (lookvector * 2.5))
				wait(0.2)

				local targetPos = troot.Position
				if variables.aimbotcalculatewping32 then
					targetPos = calculatecharactercf(troot, humant).Position
				end

				pcall(noclipf)
				wspace.Gravity = 0

				task.spawn(function()
					char = plr.CharacterAdded:Wait()
					repeat task.wait() until char.PrimaryPart

					if not variables.manualnoclip32 then
						pcall(clipf)
					end

					wspace.Gravity = 196.2
				end)

				root.Velocity = Vector3.new(0, 0, 0)
				task.spawn(function()
					task.wait(2.6)
					if not stopped then
						variables["targetshotinprogressmm234"] = nil
						stopped = true
						if plr.Character == char and char.PrimaryPart then
							char:SetPrimaryPartCFrame(ocf)
						end
						if oldParent.Parent == plr and gun.Parent then
							gun.Parent = plr:FindFirstChildOfClass("Backpack")
						end
						if not variables.manualnoclip32 then
							pcall(clipf)
						end
						wspace.Gravity = 196.2
					else
						stopped = nil
					end
				end)

				task.spawn(function()
					shootGun(gun, targetPos)
				end)

				partAdded()
				if not stopped then
					stopped = true
					variables["targetshotinprogressmm234"] = nil
					if plr.Character == char and char.PrimaryPart then
						char:SetPrimaryPartCFrame(ocf)
					end
					if oldParent.Parent == plr and gun.Parent then
						gun.Parent = plr:FindFirstChildOfClass("Backpack")
					end
					if not variables.manualnoclip32 then
						pcall(clipf)
					end
					wspace.Gravity = 196.2
				end
			end)
		end
	end

	local function getgundrop()
		if wspace:FindFirstChild("Normal") and wspace:FindFirstChild("Normal"):FindFirstChild("GunDrop") then
			return wspace:FindFirstChild("Normal"):FindFirstChild("GunDrop")
		elseif wspace:FindFirstChild("GunDrop") then
			return wspace:FindFirstChild("GunDrop")
		end
	end

	local function ongundrop(f)
		local disconnected = false
		local lastgundrop = getgundrop()
		task.spawn(function()
			while not disconnected and not uiClosed do
				local gundrop = getgundrop()
				if gundrop and lastgundrop ~= gundrop then
					lastgundrop = gundrop
					task.spawn(function()
						f(gundrop)
					end)
				end
				task.wait()
			end
		end)
		return {
			["Disconnect"] = function(self)
				disconnected = true
			end,
		}
	end

	local function ongundropremoved(f)
		local disconnected = false
		local lastgundrop = getgundrop()
		task.spawn(function()
			while not disconnected and not uiClosed do
				local gundrop = getgundrop()
				if lastgundrop and lastgundrop ~= gundrop then
					task.spawn(function()
						f(gundrop)
					end)
				end
				lastgundrop = gundrop
				task.wait()
			end
		end)
		return {
			["Disconnect"] = function(self)
				disconnected = true
			end,
		}
	end

	local function getMurder()
		local murder = nil
		for i, v in pairs(playercolordata) do
			if v[3] == "Murderer" then
				murder = v[1]
				break
			end
		end
		return murder
	end

	local function grabgun(manualcall)
		local murd = getMurder()
		if murd == plr or not murd then
			return
		end

		if isPlayerDied(plr) and not manualcall then
			return
		end

		local char = plr.Character
		local enabledp = {}

		for i, v in ipairs(getDescendants(char)) do
			if v:IsA("BasePart") and not v.CanTouch then
				v.CanTouch = true
				table.insert(enabledp, v)
			end
		end

		if getgundrop() and char and char.PrimaryPart then
			local ocf = char.PrimaryPart.CFrame
			local timestart = tick()
			local osize = getgundrop().Size
			repeat
				task.wait(0.1)
				if not getgundrop() then
					break
				end
				if isPlayerDied(plr) and not manualcall then
					break
				end
				if variables.useoldmethodmm298 then
					char:SetPrimaryPartCFrame(getgundrop().CFrame - Vector3.new(0, 1.5, 0))
				else
					getgundrop().Size = Vector3.new(0.1,0.1,0.1)
					getgundrop().CanCollide = false
					getgundrop().CFrame = char.PrimaryPart.CFrame + Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
				end
			until not getgundrop() or tick() - timestart > 3 or (isPlayerDied(plr) and not manualcall)
			char:SetPrimaryPartCFrame(ocf)
			if getgundrop() then
				getgundrop().Size = osize
			end
		end

		for i, v in ipairs(enabledp) do
			v.CanTouch = false
		end
	end

	local function shotmurder()
		if inforesponser then
			if not plr.Character then return end
			local murder = getMurder()
			if not murder then
				return
			end
			if murder and murder.Character and murder.Character.PrimaryPart then
				targetshot(murder)
			end
		end
	end

	local function getapickaxe()
		local pickaxe = nil
		local children = {}
		for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
			if v.Character then
				for c, d in ipairs(v.Backpack:GetChildren()) do
					table.insert(children, d)
				end
				for c, d in ipairs(v.Character:GetChildren()) do
					table.insert(children, d)
				end
			end
		end
		for i, v in ipairs(children) do
			if v:IsA 'Tool' and v.Name == "Pickaxe" and v:FindFirstChild("LocalScript") and v:FindFirstChild("LocalScript"):FindFirstChild("RF") then
				pickaxe = v
				break
			end
		end
		return pickaxe
	end

	local function destroyobject(i)
		local pickaxe = getapickaxe()
		local rf = pickaxe and pickaxe:FindFirstChild("LocalScript"):FindFirstChild("RF")
		if rf then
			rf:FireServer(i)
		end
	end

	local function prepforbring()
		local char = plr.Character
		if not variables.perparedforbring34 then
			variables.perparedforbring34 = true
			task.spawn(function()
				plr.CharacterAdded:Wait()
				variables.perparedforbring34 = false
			end)
			if char:FindFirstChildOfClass("Humanoid") then
				char:FindFirstChildOfClass("Humanoid"):UnequipTools()
				char:FindFirstChildOfClass("Humanoid").PlatformStand = true
			end
			local human = char:FindFirstChildOfClass("Humanoid"):Clone()

			local accessories = char:FindFirstChildOfClass("Humanoid"):GetAccessories()

			for i, v in ipairs(accessories) do
				if v:FindFirstChild("Handle") and v:FindFirstChild("Handle"):FindFirstChildOfClass("Weld") then
					local weld = v:FindFirstChild("Handle"):FindFirstChildOfClass("Weld"):Clone()
					local lastw = nil
					task.spawn(function()
						while task.wait() do
							if not v.Parent or not v:FindFirstChild("Handle") or v.Parent ~= char then
								if lastw then
									lastw:Destroy()
								end
								break
							end
							if lastw then
								lastw:Destroy()
							end
							lastw = weld:Clone()
							lastw.Parent = char
						end
					end)
				end
			end

			destroyobject(char:FindFirstChildOfClass("Humanoid"))
			char:FindFirstChildOfClass("Humanoid"):Destroy()
			human.Parent = char
			wspace.CurrentCamera.CameraSubject = human
			turnOnJump(human)

			if char:FindFirstChild("Animate") then
				char:FindFirstChild("Animate").Disabled = true
				char:FindFirstChild("Animate").Disabled = false
			end
		end
	end

	local function prepforbring2()
		local char = plr.Character
		if not variables.perparedforbring34 then
			variables.perparedforbring34 = true
			task.spawn(function()
				plr.CharacterAdded:Wait()
				variables.perparedforbring34 = false
			end)
			if char:FindFirstChildOfClass("Humanoid") then
				char:FindFirstChildOfClass("Humanoid"):UnequipTools()
				char:FindFirstChildOfClass("Humanoid").PlatformStand = true
			end
			local human = char:FindFirstChildOfClass("Humanoid"):Clone()

			local accessories = char:FindFirstChildOfClass("Humanoid"):GetAccessories()

			for i, v in ipairs(accessories) do
				if v:FindFirstChild("Handle") and v:FindFirstChild("Handle"):FindFirstChildOfClass("Weld") or v.Parent ~= char then
					local weld = v:FindFirstChild("Handle"):FindFirstChildOfClass("Weld"):Clone()
					local lastw = nil
					task.spawn(function()
						while task.wait() do
							if not v.Parent or not v:FindFirstChild("Handle") then
								if lastw then
									lastw:Destroy()
								end
								break
							end
							if lastw then
								lastw:Destroy()
							end
							lastw = weld:Clone()
							lastw.Parent = char
						end
					end)
				end
			end

			destroyobject(char:FindFirstChildOfClass("Humanoid"))

			char:FindFirstChildOfClass("Humanoid"):Destroy()
			human.Parent = char
			wspace.CurrentCamera.CameraSubject = human
			turnOnJump(newhuman)
			if char:FindFirstChild("Animate") then
				char:FindFirstChild("Animate").Disabled = true
				char:FindFirstChild("Animate").Disabled = false
			end
		end
	end

	local voidbases = {}

	local prevCCF = nil
	local charclsdf = nil

	local API = {
		["NDS"] = {
			["Icon"] = icons.Game,
			["Id"] = 7,
			["All Sections"] = {
				["GlitchCharacter"] = {
					["SourceText"] = "<btn>; innertxt='Glitch Character';",
					["Runner"] = function()
						if plr.Character and not variables["cannotGfdssdf"] then
							variables.cannotGfdssdf = true;
							local char = plr.Character
							local human = plr.Character:FindFirstChildOfClass("Humanoid")
							if human and plr.Character.PrimaryPart then
								glitchhumanoid()
								char.PrimaryPart.Velocity = Vector3.new(0, -500, 0)
								wait()
								char.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
							end
							plr.CharacterAdded:Wait()
							variables.cannotGfdssdf = false;
						end
					end,
				},
				["Invisible"] = {
					["SourceText"] = "<btn>; innertxt='Invisible Character';",
					["Runner"] = function()
						if plr.Character and not variables.cannotGfdssdf then
							variables.cannotGfdssdf = true;
							local char = plr.Character
							local human = glitchhumanoid(1)
							if human and plr.Character.PrimaryPart then
								char.PrimaryPart.Velocity = Vector3.new(0, -500, 0)
								task.wait()
								char.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
								wspace.CurrentCamera.CameraSubject = human
								task.spawn(function()
									plr.CharacterAdded:Wait()
									variables.cannotGfdssdf = false;
								end)
								repeat task.wait() until human.Health <= 0
							end
							local connects = {}
							connects[#connects + 1] = game:GetService("Players").PlayerAdded:Connect(function(p)
								local cs = p.CharacterAdded:Wait()
								repeat task.wait() until cs.PrimaryPart and not variables["bussy34"]
								variables.bussy34 = true
								local lcf = char.PrimaryPart.CFrame
								local t_ck = tick()
								repeat
									task.wait()
									char:SetPrimaryPartCFrame(cs.PrimaryPart.CFrame)
								until tick() - t_ck > plr:GetNetworkPing() + 0.08
								char:SetPrimaryPartCFrame(lcf)
								wait(plr:GetNetworkPing() + 0.08)
								variables.bussy34 = false
							end)
							local lcf = char.PrimaryPart.CFrame
							for i, p in ipairs(game:GetService("Players"):GetPlayers()) do
								local cs = p.Character or p.CharacterAdded:Wait()
								repeat task.wait() until cs.PrimaryPart and not variables.bussy34
								variables.bussy34 = true
								local t_ck = tick()
								repeat
									task.wait()
									char:SetPrimaryPartCFrame(cs.PrimaryPart.CFrame)
								until tick() - t_ck > plr:GetNetworkPing() + 0.08
								variables.bussy34 = false
							end
							wait(plr:GetNetworkPing() + 0.08)
							char:SetPrimaryPartCFrame(lcf)
							for i, v in ipairs(connects) do
								v:Disconnect()
							end
						end
					end,
				},
			},
		},
		["TUW"] = {
			["Icon"] = icons.Game,
			["Id"] = 6,
			["All Sections"] = {
				["InfDamage"] = {
					["SourceText"] = "<option>; innertxt='Inf Damage';",
					["Runner"] = function()
						local deb = false
						variables.infdamage34 = game:GetService("RunService").RenderStepped:Connect(function()
							local char = plr.Character
							if char and char:FindFirstChild("Swuvle") then
								local tool = char:FindFirstChild("Swuvle")
								if tool:FindFirstChild("Handle") then
									tool.Handle.Massless = true
									if not deb and not variables["refswordfalse"] then
										deb = true
										tool.Handle.Size = Vector3.new()
									else
										deb = false
										tool.Handle.Size = Vector3.new(6, 6, 6)
									end
								end
							end
						end)
					end,
					["Stopper"] = function()
						if variables.infdamage34 then
							variables.infdamage34:Disconnect()
						end
					end,
				},
				["KillAllB"] = {
					["SourceText"] = "<btn>; innertxt='BETA Kill All';",
					["Runner"] = function()
						if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character.PrimaryPart and plr:FindFirstChildOfClass("Backpack"):FindFirstChild("Swuvle") then
							local char = plr.Character
							task.spawn(function() Notification(nameH.."UI", "Kill All in progress...", 3) end)
							wait()
							local human = glitchhumanoid()
							local basepart = wspace:FindFirstChild("CenterKillbrick")
							local ocf = basepart.CFrame
							local osize = basepart.Size
							basepart.Size = Vector3.new(5, 5, 5)
							basepart.CanCollide = false
							local function waitForDying()
								human.Changed:Wait()
								if human.Health <= 0 then
									return
								else
									waitForDying()
								end
							end
							local running = game:GetService("RunService").RenderStepped:Connect(function()
								basepart.CFrame = char.PrimaryPart.CFrame
							end)
							waitForDying()
							running:Disconnect()
							basepart.CFrame = ocf
							basepart.Size = osize
							local runningkillfunctions = {}
							local tool = plr:FindFirstChildOfClass("Backpack"):FindFirstChild("Swuvle")
							tool.Parent = char
							local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
							local function waitForRG()
								if ra:FindFirstChild("RightGrip") then
									return ra:FindFirstChild("RightGrip")
								end
								local rg = ra.ChildAdded:Wait()
								if rg.Name == "RightGrip" then
									return rg
								else
									waitForRG()
								end
							end
							local rg = waitForRG()
							rg:Destroy()
							local handle = tool:FindFirstChild("Handle")
							if handle:FindFirstChildOfClass("SpecialMesh") then
								handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
							end
							local speedxvel = Instance.new("BodyVelocity", handle)
							speedxvel.Velocity = Vector3.new(9e8, 9e8, 9e8)
							speedxvel.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
							local runvelocity = game:GetService("RunService").RenderStepped:Connect(function()
								handle.CFrame = char.PrimaryPart.CFrame:ToWorldSpace(CFrame.new(Vector3.new(0, 0, 5)))
							end)
							if tool then
								for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
									if v ~= plr and v.Character and v.Character.PrimaryPart then
										runningkillfunctions[#runningkillfunctions + 1] = game:GetService("RunService").RenderStepped
											:Connect(function()
												if v and v.Character and v.Character.PrimaryPart and handle then
												v.Character:SetPrimaryPartCFrame(char.PrimaryPart.CFrame:ToWorldSpace(CFrame.new(Vector3.new(0, 0,
													5))))
											end
											end)
									end
								end
							else
								task.spawn(function() Notification(nameH.."UI", "U havent got Swuvle.", 3) end)
							end
							plr.CharacterAdded:Wait()
							runvelocity:Disconnect()
							for i, v in ipairs(runningkillfunctions) do
								v:Disconnect()
							end
						else
							task.spawn(function() Notification(nameH.."UI", "Character is not ready.", 3) end)
						end
					end,
				},
				["KillPlayer"] = {
					["SourceText"] = "<selector>; innertxt='Kill Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character then
							local char = plr.Character
							if char and target then
								local sword = char:FindFirstChild("Swuvle") or plr:FindFirstChildOfClass("Backpack"):FindFirstChild("Swuvle")
								local human = char:FindFirstChildOfClass("Humanoid")
								if sword and not variables["killproccess33"] and human and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
									local tchar = target.Character
									local arm = tchar:FindFirstChild("Left Arm") or tchar:FindFirstChild("LeftHand")
									local targethumanoid = target.Character:FindFirstChildOfClass("Humanoid")
									variables.killproccess33 = true
									task.spawn(function()
										plr.CharacterAdded:Wait()
										variables.killproccess33 = false;
									end)
									human:EquipTool(sword)
									wspace.CurrentCamera.CameraSubject = target.Character
									repeat
										wait()
										if arm and sword:FindFirstChild("Handle") then
											arm:BreakJoints()
											arm.CFrame = sword.Handle.CFrame
											sword:Activate()
										end
									until not targethumanoid or targethumanoid.Health <= 0 or not arm
									variables.killproccess33 = false
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["GlitchCharacter"] = {
					["SourceText"] = "<btn>; innertxt='Glitch Character';",
					["Runner"] = function(button, otext)
						if plr.Character and not variables.cannotGfdssdf and wspace:FindFirstChild("CenterKillbrick") then
							local extraping = variables["exping"] or 0.03
							variables.exping = extraping
							local ingame = {}
							variables.cannotGfdssdf = true;

							local bgFrame = Instance.new("TextButton", ui)
							local iFrame = Instance.new("Frame", bgFrame)
							local statustext = Instance.new("TextLabel", iFrame)
							local selector = Instance.new("ScrollingFrame", iFrame)
							local clearb = Instance.new("TextButton", iFrame)
							local selAll = Instance.new("TextButton", iFrame)
							local okB = Instance.new("TextButton", iFrame)
							local refresh = Instance.new("TextButton", iFrame)
							local cancelB = Instance.new("TextButton", iFrame)
							local selectedping = Instance.new("TextBox", iFrame)

							Instance.new("UIListLayout", selector)

							bgFrame.Name = "GlitchCharacterSection"
							bgFrame.Position = UDim2.new(0, 0, 0, -guiinset.Y)
							bgFrame.Size = UDim2.new(1, 0, 1, guiinset.Y)
							bgFrame.BackgroundColor3 = Color3.new()
							bgFrame.BackgroundTransparency = 0.55
							bgFrame.Text = ""
							bgFrame.AutoButtonColor = false
							bgFrame.ZIndex = 4

							iFrame.Size = fsize
							iFrame.Position = UDim2.new(0.5 - fsize.X.Scale / 2, -fsize.X.Offset / 2, 0.5 - fsize.X.Scale / 2, -fsize.Y.Offset / 2)
							iFrame.BackgroundColor3 = black
							iFrame.ZIndex = 4
							iFrame.BorderSizePixel = 0

							pcall(function() Instance.new("UICorner", iFrame).CornerRadius = UDim.new(0, 4) end)
							statustext.Size = UDim2.new(0.8, 0, 0.075, 0)
							statustext.Position = UDim2.new(0.1, 0, 0, 0)
							statustext.BackgroundTransparency = 1
							statustext.Font = classicFont
							statustext.TextColor3 = whitew
							statustext.TextSize = 20
							statustext.Text = "Selected 0/" .. #game:GetService("Players"):GetPlayers()
							statustext.ZIndex = 4

							clearb.Size = UDim2.new(0.2, 0, 0, 20)
							clearb.Position = UDim2.new(0.8, -4, 0.5, -22)
							clearb.BackgroundColor3 = blackb
							clearb.BorderSizePixel = 0
							clearb.Font = classicFont
							clearb.TextColor3 = whitew
							clearb.TextScaled = true
							clearb.Text = "Clear"
							clearb.ZIndex = 4

							selAll.Size = UDim2.new(0.2, 0, 0, 20)
							selAll.Position = UDim2.new(0.8, -4, 0.5, 2)
							selAll.BackgroundColor3 = blackb
							selAll.BorderSizePixel = 0
							selAll.Font = classicFont
							selAll.TextColor3 = whitew
							selAll.TextScaled = true
							selAll.Text = "Select All"
							selAll.ZIndex = 4

							okB.Size = UDim2.new(0.2, 0, 0, 20)
							okB.Position = UDim2.new(0.3, -2, 1, -24)
							okB.BorderSizePixel = 0
							okB.BackgroundColor3 = blackb
							okB.Font = classicFont
							okB.TextColor3 = whitew
							okB.TextScaled = true
							okB.Text = "Glitch"
							okB.ZIndex = 4

							refresh.Size = UDim2.new(0.2, 0, 0, 20)
							refresh.Position = UDim2.new(0.8, -4, 1, -24)
							refresh.BorderSizePixel = 0
							refresh.BackgroundColor3 = blackb
							refresh.Font = classicFont
							refresh.TextColor3 = whitew
							refresh.TextScaled = true
							refresh.Text = "Refresh"
							refresh.ZIndex = 4

							cancelB.Size = UDim2.new(0.2, 0, 0, 20)
							cancelB.Position = UDim2.new(0.5, 2, 1, -24)
							cancelB.BackgroundColor3 = blackb
							cancelB.BorderSizePixel = 0
							cancelB.Font = classicFont
							cancelB.TextColor3 = whitew
							cancelB.TextScaled = true
							cancelB.Text = "Cancel"
							cancelB.ZIndex = 4

							selectedping.Size = UDim2.new(0.2, 0, 0, 20)
							selectedping.Position = UDim2.new(0, 4, 1, -24)
							selectedping.BackgroundColor3 = blackb
							selectedping.BorderSizePixel = 0
							selectedping.Font = classicFont
							selectedping.TextColor3 = whitew
							selectedping.TextScaled = true
							selectedping.Text = "Extra ping " .. (extraping * 1000) .. " ms"
							pcall(function() selectedping.PlaceholderText = "Extra ping ms" end)
							selectedping.ZIndex = 4

							selector.BackgroundColor3 = white
							selector.BorderSizePixel = 0
							selector.Size = UDim2.new(0.5, 0, 0.6, 0)
							selector.Position = UDim2.new(0.25, 0, 0.2, 0)
							selector.TopImage = ""
							selector.BottomImage = ""
							selector.ZIndex = 4

							local connects = {}

							local cancelps = false
							local startglitch = false

							local function numberofselected()
								local ret = 0
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") and v.Name == "Selected" then
										ret = ret + 1
									end
								end
								return ret
							end

							local function loadlist()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") then
										v:Destroy()
									end
								end
								local ss = 0
								for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
									if v.Character and v ~= plr then
										local buttonv = Instance.new("TextButton", selector)
										local uiPadding = Instance.new("UIPadding", buttonv)
										buttonv.Size = UDim2.new(1, 0, 0, 20)
										buttonv.BackgroundColor3 = black
										buttonv.BorderSizePixel = 0
										buttonv.TextScaled = true
										buttonv.TextColor3 = whitew
										buttonv.Font = classicFont
										buttonv.Text = v.Name
										buttonv.ZIndex = 4
										ss = ss + 20
										table.insert(connects, buttonv.MouseButton1Click:Connect(function()
											if buttonv.Name == "Selected" then
												buttonv.Name = "Option"
												buttonv.BackgroundColor3 = black
												statustext.Text = "Selected " ..
													numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
											else
												buttonv.Name = "Selected"
												buttonv.BackgroundColor3 = white
												statustext.Text = "Selected " ..
													numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
											end
										end))
										table.insert(connects, buttonv.MouseEnter:Connect(function()
											local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 5)})
											tween:Play()
										end))
										table.insert(connects, buttonv.MouseLeave:Connect(function()
											local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 0)})
											tween:Play()
											wait(0.1)
											uiPadding.PaddingLeft = UDim.new(0, 0)
										end))
										table.insert(connects, buttonv.MouseButton1Down:Connect(function()
											local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 15)})
											tween:Play()
										end))
										table.insert(connects, buttonv.MouseButton1Up:Connect(function()
											local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 5)})
											tween:Play()
										end))
									end
								end
								selector.CanvasSize = UDim2.new(0, 0, 0, ss)
							end

							loadlist()

							connects[1] = selectedping.FocusLost:Connect(function()
								local numb = tonumber(selectedping.Text)
								if numb then
									extraping = numb / 1000
									selectedping.Text = "Extra ping " .. numb .. " ms"
									variables.exping = numb / 1000
								else
									selectedping.Text = "Extra ping " .. (extraping * 1000) .. " ms"
								end
							end)

							connects[2] = cancelB.MouseButton1Click:Connect(function()
								cancelps = true
							end)

							connects[3] = okB.MouseButton1Click:Connect(function()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") and v.Name == "Selected" and game:GetService("Players"):FindFirstChild(v.Text) then
										table.insert(ingame, game:GetService("Players"):FindFirstChild(v.Text))
									end
								end
								startglitch = true
							end)

							connects[4] = selAll.MouseButton1Click:Connect(function()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") then
										v.Name = "Selected"
										v.BackgroundColor3 = white
									end
								end
								statustext.Text = "Selected " .. numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
							end)

							connects[5] = clearb.MouseButton1Click:Connect(function()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") then
										v.Name = "Option"
										v.BackgroundColor3 = black
									end
								end
								statustext.Text = "Selected " .. numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
							end)

							connects[6] = refresh.MouseButton1Click:Connect(function()
								loadlist()
							end)

							repeat
								wait()
							until cancelps or startglitch

							for i, v in ipairs(connects) do
								v:Disconnect()
							end

							bgFrame:Destroy()

							if cancelps then
								variables.cannotGfdssdf = false;
								return
							end

							local char = plr.Character
							local human = glitchhumanoid(0.2)
							if human then
								task.spawn(function()
									plr.CharacterAdded:Wait()
									variables.cannotGfdssdf = false;
								end)
								local function runwait()
									human.Changed:Wait()
									if human.Health > 0 then
										runwait()
									end
								end
								local prevcf = char.PrimaryPart.CFrame
								local kb = wspace:FindFirstChild("CenterKillbrick")
								plr.Character:SetPrimaryPartCFrame(kb.CFrame - Vector3.new(0, kb.Size.Y / 2, 0))
								runwait()
								local completed = 0
								local ping = plr:GetNetworkPing() + extraping
								local can = true
								for i, v in ipairs(ingame) do
									if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
										local t_ck = tick()
										repeat
											task.wait()
											char:SetPrimaryPartCFrame(v.Character.PrimaryPart.CFrame)
										until tick() - t_ck > ping
										if can then
											completed = completed + 1
										else
											break
										end
									end
								end
								task.spawn(function()
									repeat task.wait() until human.Health > 0
									can = false
									Notification(nameH.."UI", "Interaceted to " .. completed .. "/" .. #ingame, 5)
								end)
								char:SetPrimaryPartCFrame(prevcf)
							end
						end
					end,
				},
				["GlitchCharacterFaster"] = {
					["SourceText"] = "<btn>; innertxt='Glitch Character Faster';",
					["Runner"] = function(button, otext)
						local kb = wspace:FindFirstChild("CenterKillbrick")
						if plr.Character and not variables.cannotGfdssdf and kb then
							variables.cannotGfdssdf = true;
							local char = plr.Character
							local human = glitchhumanoid(0.2)
							if char:FindFirstChild("Animate") then
								char:FindFirstChild("Animate").Disabled = true
								char:FindFirstChild("Animate").Disabled = false
							end
							local starttime = tick()
							local prevcf = plr.Character.PrimaryPart.CFrame
							plr.Character:SetPrimaryPartCFrame(kb.CFrame - Vector3.new(0, kb.Size.Y / 2, 0))
							local function rrr()
								human.Changed:Wait()
								if human.Health > 0 then
									rrr()
								end
							end
							rrr()
							plr.Character:SetPrimaryPartCFrame(prevcf)
							local ret = false
							task.spawn(function()
								plr.CharacterAdded:Wait()
								ret = true
								variables.cannotGfdssdf = false;
							end)
							repeat
								wait()
								for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
									if v ~= plr and v.Character and v.Character.PrimaryPart and plr.Character and plr.Character.PrimaryPart then
										for _, b in ipairs(getDescendants(v.Character)) do
											if b:IsA 'BasePart' then
												b.CanCollide = false
											end
										end
										v.Character:SetPrimaryPartCFrame(plr.Character.PrimaryPart.CFrame +
											plr.Character.PrimaryPart.CFrame.LookVector)
									end
								end
							until human.Health > 0 or ret
							for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
								if v ~= plr and v.Character and v.Character.PrimaryPart and plr.Character and plr.Character.PrimaryPart then
									for _, b in ipairs(getDescendants(v.Character)) do
										if b:IsA 'BasePart' then
											b.CanCollide = true
										end
									end
								end
							end
							task.spawn(function() Notification(nameH.."UI", "Now, someone is cant see u to next respawn.", 5) end)
						end
					end,
				},
				["GetAFlag"] = {
					["SourceText"] = "<btn>; innertxt='Steal the Flag';",
					["Runner"] = function(button, otext)
						local char = plr.Character
						local flags = wspace:FindFirstChild("Flags")
						local flag1 = flags and flags:FindFirstChild("FlagBlue")
						local flag2 = flags and flags:FindFirstChild("FlagRed")
						local human = char and glitchhumanoid()
						if human and not variables["cannotGfdssdf32"] and flag1 and flag2 then
							local connects = {}
							local baseb = flag1:FindFirstChild("Base")
							local baser = flag2:FindFirstChild("Base")
							if baseb and baser then
								task.spawn(function() Notification(nameH.."UI", "Get a Flag in Progress", 2); end)
								variables.cannotGfdssdf32 = true
								local targetbase = nil
								local sbase = nil
								if plr.Team.Name == "Red Team" then
									targetbase = baseb
									sbase = baser
								else
									targetbase = baser
									sbase = baseb
								end
								local obasecf = targetbase.CFrame
								local itable = {}
								local bp = nil
								local bg = nil
								local cancelled = false
								task.spawn(function()
									plr.CharacterAdded:Wait()
									variables.cannotGfdssdf32 = false
									if bp then
										bp:Destroy()
									end
									if bg then
										bg:Destroy()
									end
									wait()
									for i, v in ipairs(itable) do
										v.CanCollide = true
									end
									targetbase.CFrame = obasecf
								end)
								if targetbase and sbase then
									char:SetPrimaryPartCFrame(targetbase.CFrame + Vector3.new(0, 6, 12))
									repeat task.wait() until human.Health <= 0
									repeat
										if variables.cannotGfdssdf32 then
											targetbase.CanCollide = false
											targetbase.CFrame = char.PrimaryPart.CFrame
											task.wait()
											targetbase.CFrame = obasecf
											task.wait()
										end
									until char:FindFirstChild("FlagTook") or not variables.cannotGfdssdf32
									targetbase.CanCollide = true
									targetbase.CFrame = obasecf
									local tm = tick()
									bp = Instance.new("BodyPosition", char.PrimaryPart)
									bp.MaxForce = Vector3.new(9e9, 9e9, 9e9)
									bp.P = 9e4
									bg = Instance.new("BodyGyro", char.PrimaryPart)
									bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
									bg.P = 9e4
									local rg = 0.1
									local rgfs = 177.2
									if targetbase == baser then
										rg = -0.1
										rgfs = 175
									end
									for i, v in ipairs(getDescendants(wspace)) do
										if v:IsA 'BasePart' and not v:IsA 'Terrain' and v.CanCollide then
											v.CanCollide = false
											table.insert(itable, v)
										end
									end
									local posg = targetbase.Position - Vector3.new(0, 2.22, 0) + (targetbase.CFrame.LookVector * rg)
									posg = posg:Lerp(targetbase.Position + (targetbase.Position - sbase.Position).Unit * rgfs, 1)
									char:SetPrimaryPartCFrame(CFrame.fromOrientation(math.rad(180), math.rad(0), math.rad(90)) + posg)
									repeat
										if bp and bg then
											for i, v in ipairs(itable) do
												v.CanCollide = false
											end
											local pos = targetbase.Position - Vector3.new(0, 2.22, 0) + (targetbase.CFrame.LookVector * rg)
											pos = pos:Lerp(targetbase.Position + (targetbase.Position - sbase.Position).Unit * rgfs, 1)
											if tick() - tm > 0.2 then
												pos = pos + Vector3.new(0, 5, 0)
											end
											local cf = CFrame.fromOrientation(math.rad(180), math.rad(0), math.rad(90)) + pos
											bg.CFrame = cf
											bp.Position = pos
										end
										task.wait()
									until tick() - tm > 10 or not variables.cannotGfdssdf32
									bp:Destroy()
									bg:Destroy()
									for i, v in ipairs(itable) do
										v.CanCollide = true
									end
									targetbase.CanCollide = true
									char:SetPrimaryPartCFrame(sbase.CFrame + Vector3.new(0, 5, 15))
									task.wait()
									char:SetPrimaryPartCFrame(sbase.CFrame + Vector3.new(0, 5, 0))
									task.spawn(function() Notification(nameH.."UI", "Got Flag!", 3); end)
								end
							end
						end
					end,
				},
			},
		},
		["RevengeOfSlimes"] = {
			["Icon"] = icons.Game,
			["Id"] = 5,
			["All Sections"] = {
				["JoinMiningPlace"] = {
					["SourceText"] = "<btn>; innertxt='Teleport to Mining';",
					["Runner"] = function()
						teleportplr(582910565)
					end,
				},
				["JoinMainPlace"] = {
					["SourceText"] = "<btn>; innertxt='Teleport to MainPlace';",
					["Runner"] = function()
						teleportplr(394773622)
					end,
				},
				["FreeMoney"] = {
					["SourceText"] = "<txtbox>; innertxt='Free Money';placeholder='Amount';",
					["Runner"] = function(text)
						if tonumber(text) then
							if wspace:FindFirstChild("Bought") then
								local iron = plr:FindFirstChild("Iron")
								local silver = plr:FindFirstChild("Silver")
								local gold = plr:FindFirstChild("Gold")
								local ruby = plr:FindFirstChild("Rubys")
								local diamond = plr:FindFirstChild("Diamonds")
								local coins = plr:FindFirstChild("Coins")
								local event = wspace:FindFirstChild("Bought")
								event:InvokeServer(iron.Value, silver.Value, gold.Value, ruby.Value, diamond.Value, tonumber(text),
									"Meteor Bow")
							elseif wspace:FindFirstChild 'DoShopPurchase' then
								local event = wspace:FindFirstChild 'DoShopPurchase'
								if event then
									event:InvokeServer(plr.leaderstats.Coins, plr.leaderstats.Coins.Value - tonumber(text), "Chest1",
										"Acceleration Coil")
								end
							end
						end
					end,
				},
				["KillAllSlimes"] = {
					["SourceText"] = "<selector>; innertxt='Kill All Slimes';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if target and target.Character and wspace:FindFirstChild("Slimes") then
							repeat
								for _, v in ipairs(wspace:FindFirstChild("Slimes"):GetChildren()) do
									local bow = target.Character:FindFirstChild 'Bow' or target.Backpack:FindFirstChild 'Bow'
									if bow and v:IsA 'Model' and v.PrimaryPart then
										local event = bow.Shoot.RemoteEvent
										event:FireServer(v.PrimaryPart.Position, "skill")
									end
								end
								wait(2)
							until #wspace.Slimes:GetChildren() <= 0
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject)
					end,
				},
				["DeleteAllBuilds"] = {
					["SourceText"] = "<btn>; innertxt='Delete All Builds';",
					["Runner"] = function()
						local pickaxe = getapickaxe()
						if pickaxe then
							local i = 0
							for _, d in ipairs(wspace:GetChildren()) do
								if d.Name == "Part" and d.Position.Y ~= 3 then
									i = i + 1
									if i >= 50 then
										i = 0
										wait(1)
									end
									if pickaxe then
										destroyobject(d)
									end
								end
							end
						end
					end
				},
				["DeleteAllTrees"] = {
					["SourceText"] = "<btn>; innertxt='Delete All Trees';",
					["Runner"] = function()
						local pickaxe = getapickaxe()
						if pickaxe and wspace:FindFirstChild("TheTerrain") and wspace:FindFirstChild("TheTerrain"):FindFirstChild("Trees") then
							for i, v in ipairs(wspace:FindFirstChild("TheTerrain"):FindFirstChild("Trees"):GetChildren()) do
								if v.Name == "Tree" then
									destroyobject(v)
								end
							end
							for i, v in ipairs(wspace:GetChildren()) do
								if v.Name == 'Block' then
									destroyobject(v)
								end
							end
						end
					end,
				},
				["PressTForDelete"] = {
					["SourceText"] = "<option>; innertxt='Press T For Delete';",
					["Runner"] = function()
						if game.PlaceId ~= 582910565 then
							return
						end

						if onmobile() then
							if not variables.bindforpresstfordel34 then
								variables.bindforpresstfordel34 = createBindableButton("T")
								variables.bindforpresstfordel34.OnClick(function()
									if variables.can32fordel then
										variables.can32fordel = false
										variables.bindforpresstfordel34:SetLightOff()
									else
										variables.can32fordel = true
										variables.bindforpresstfordel34:SetLightOn()
									end
								end)
							end
						end

						local function mousedown()
							local target = getMouseRay()
							local char = plr.Character
							if char and target then
								target = target.Instance
								if variables.del34f or target.Name == "MinableBlock" or target.Name == "Part" or target.Name == "Block" then
									if variables.del34f or mouse.Target.Color == Color3.fromRGB(163, 162, 165) then
										if target then
											destroyobject(target)
										end
									end
								end
							end
						end

						variables.del35f = uis.InputBegan:Connect(function(key)
							if plr.Character and key.KeyCode == Enum.KeyCode.T then
								mousedown()
							end
						end)

						onTouched(function()
							local result = variables.can32fordel and mousedown()
						end, true)
					end,
					["OnRemove"] = function()
						if variables.del35f then
							variables.del35f:Disconnect()
							variables.del35f = nil
						end
						if variables.bindforpresstfordel34 then
							variables.bindforpresstfordel34:Destroy()
							variables.bindforpresstfordel34 = nil
						end
					end,
					["Stopper"] = function()
						if variables.del35f then
							variables.del35f:Disconnect()
							variables.del35f = nil
						end
						if variables.bindforpresstfordel34 then
							variables.bindforpresstfordel34:Destroy()
							variables.bindforpresstfordel34 = nil
						end
					end,
				},
				["PressTForDeleteNoBlacklist"] = {
					["SourceText"] = "<option>; innertxt='Press T For Delete No Blacklist';",
					["Runner"] = function()
						variables.del34f = true
					end,
					["OnRemove"] = function()
						variables.del34f = nil
					end,
					["Stopper"] = function()
						variables.del34f = nil
					end,
				},
				["BreakCharacter"] = {
					["SourceText"] = "<btn>; innertxt='Break Character';",
					["Runner"] = function()
						if plr.Character then
							local char = plr.Character
							if char then
								prepforbring()
							end
						end
					end,
				},
				["BreakChat"] = {
					["SourceText"] = "<btn>; innertxt='Break Chat';",
					["Runner"] = function()
						local chatevents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
						if chatevents then
							destroyobject(chatevents)
						end
					end,
				},
				["MuteChat"] = {
					["SourceText"] = "<btn>; innertxt='Mute Chat';",
					["Runner"] = function()
						local chatevent = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") and
							game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest")
						if chatevent then
							destroyobject(chatevent)
						end
					end,
				},
				["FixCharacter"] = {
					["SourceText"] = "<btn>; innertxt='Fix Character';",
					["Runner"] = function()
						if plr.Character then
							local char = plr.Character
							if char and char.PrimaryPart then
								local x = flying
								flyoff()
								flying = x
								variables.settingLocation = true
								local prevcf = char.PrimaryPart.CFrame
								local human = char:FindFirstChildOfClass("Humanoid")
								human:UnequipTools()
								wait(0.1)
								char:SetPrimaryPartCFrame(CFrame.new(0, wspace.FallenPartsDestroyHeight + 5, 0))
								char = plr.CharacterAdded:Wait()
								repeat task.wait() until char.PrimaryPart
								wait()
								char:SetPrimaryPartCFrame(prevcf)
								variables.settingLocation = false
							end
						end
					end,
				},
				["FixTool"] = {
					["SourceText"] = "<btn>; innertxt='Fix Tool';",
					["Runner"] = function()
						if plr.Character then
							local char = plr.Character
							if char then
								local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
								if arm and arm:FindFirstChildOfClass("Weld") then
									destroyobject(arm:FindFirstChildOfClass("Weld"))
								end
							end
						end
					end,
				},
				["Invisible"] = {
					["SourceText"] = "<btn>; innertxt='Be Invisible';",
					["Runner"] = function()
						if plr.Character then
							local char = plr.Character
							if char then
								local human = char:FindFirstChildOfClass("Humanoid")
								if char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("Motor6D") and human then
									human.RequiresNeck = false
									char:FindFirstChild("HumanoidRootPart").CanCollide = true
									destroyobject(char:FindFirstChild("LowerTorso"))
									repeat task.wait() until not char:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("Motor6D")
									wspace.CurrentCamera.CameraSubject = char:FindFirstChild("HumanoidRootPart")
									char.PrimaryPart = char:FindFirstChild("HumanoidRootPart")
								end
							end
						end
					end,
				},
				["Kick"] = {
					["SourceText"] = "<selector>; innertxt='Kick Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character then
							local char = plr.Character
							if char and target then
								destroyobject(target)
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["FEGiveHats"] = {
					["SourceText"] = "<selector>; innertxt='FE Give Hats';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character then
							local char = plr.Character
							if char and target and target.Character and target.Character.PrimaryPart then
								local human = char:FindFirstChildOfClass("Humanoid")

								if not human then
									return
								end

								local accessories = human:GetAccessories()
								if #accessories < 1 then
									return
								end

								prepforbring()

								local tchar = target.Character
								local root = char.PrimaryPart

								while task.wait(0.1) do
									local cant = false

									for i, v in ipairs(accessories) do
										if v.Parent == char and v:FindFirstChild("Handle") then
											cant = true
											tchar:SetPrimaryPartCFrame(v:FindFirstChild("Handle").CFrame)
										end
									end

									if not cant then
										break
									end
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["FEBring"] = {
					["SourceText"] = "<selector>; innertxt='FE Bring Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character then
							local char = plr.Character
							if char and target and target.Character and target.Character.PrimaryPart then
								prepforbring()
								local tool = nil
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA 'Tool' and v:FindFirstChild("Handle") then
										tool = v
										break
									end
								end
								if tool then
									tool.Parent = char
									local tim_e = tick()
									repeat
										wait()
										if tool.Parent == char and tick() - tim_e > 0.6 then
											target.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
										end
									until tool.Parent ~= char
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["FE BringL"] = {
					["SourceText"] = "<selector>; innertxt='FE Bring Drop Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character then
							local char = plr.Character
							if char and target and target.Character and target.Character.PrimaryPart then
								prepforbring()
								local tool = nil
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA 'Tool' and v:FindFirstChild("Handle") then
										tool = v
										break
									end
								end
								if tool then
									tool.Parent = char
									local tim_e = tick()
									local arms = target.Character:FindFirstChild("Right Arm") or
										target.Character:FindFirstChild("RightHand")
									repeat
										wait()
										if tool.Parent == char and tick() - tim_e > 0.6 then
											target.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
										end
									until tool.Parent ~= char and arms:FindFirstChildOfClass("Weld")
									local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
									if arm and arm:FindFirstChildOfClass("Weld") then
										destroyobject(arm:FindFirstChildOfClass("Weld"))
									else
										destroyobject(tool)
									end
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["FEVoid"] = {
					["SourceText"] = "<selector>; innertxt='FE Void Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character then
							local char = plr.Character
							if char and target and target.Character and target.Character.PrimaryPart then
								prepforbring()
								local human = char:FindFirstChildOfClass("Humanoid")
								local tool = nil
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA 'Tool' and v:FindFirstChild("Handle") then
										tool = v
										break
									end
								end
								if tool and human then
									tool.Parent = char
									local prevcf = char.PrimaryPart.CFrame
									local voidbase = Instance.new("Part", wspace)
									voidbase.Anchored = true
									voidbase.Size = Vector3.new(50, 1, 50)
									voidbase.Position = Vector3.new(500, wspace.FallenPartsDestroyHeight + 40, 500)
									voidbase.Color = Color3.new()
									voidbase.Transparency = 0.25
									for _, g in ipairs(voidbases) do
										g:Destroy()
									end
									table.insert(voidbases, voidbase)
									local tim_e = tick()
									char:SetPrimaryPartCFrame(voidbase.CFrame + Vector3.new(0, 3, 0))
									task.wait(1.5)
									local arms = target.Character:FindFirstChild("Right Arm") or
										target.Character:FindFirstChild("RightHand")
									repeat
										wait()
										if tool.Parent == char and tick() - tim_e > 0.6 then
											target.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
										end
									until tool.Parent ~= char and arms:FindFirstChildOfClass("Weld")
									wait(target:GetNetworkPing() * 2 + 0.6)
									for i, target in ipairs(tool.Parent:GetChildren()) do
										if target:IsA 'BasePart' then
											target.CanCollide = false
										end
									end
									local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
									if arm and arm:FindFirstChildOfClass("Weld") then
										destroyobject(arm:FindFirstChildOfClass("Weld"))
									else
										destroyobject(tool)
									end
									local timeout = tick()
									repeat task.wait() until not tool or not tool.Parent or not tool.Parent:IsA("Model") or not tool.Parent.PrimaryPart or tick() - timeout > 5
									wait(0.1)
									char:SetPrimaryPartCFrame(prevcf)
									voidbase:Destroy()
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["FECrash"] = {
					["SourceText"] = "<selector>; innertxt='FE Crash Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character then
							local char = plr.Character
							if char and target and target.Character and target.Character.PrimaryPart then
								prepforbring()
								local human = char:FindFirstChildOfClass("Humanoid")
								local tool = nil
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA 'Tool' and v:FindFirstChild("Handle") then
										tool = v
										break
									end
								end
								if tool and human then
									local x = flying
									flyoff()
									flying = x
									tool.Parent = char
									local tim_e = tick()
									local arms = target.Character:FindFirstChild("Right Arm") or
										target.Character:FindFirstChild("RightHand")
									repeat
										wait()
										if tool.Parent == char and tick() - tim_e > 0.6 then
											target.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
										end
									until tool.Parent ~= char and arms:FindFirstChildOfClass("Weld")
									char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, wspace.FallenPartsDestroyHeight + 3, 0)))
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["FEKill"] = {
					["SourceText"] = "<selector>; innertxt='FE Kill Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and not variables.cannotGfdssdf then
							local char = plr.Character
							if target and char and target.Character and target.Character.PrimaryPart then
								prepforbring2()
								local human = char:FindFirstChildOfClass("Humanoid")
								local tool = nil
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA 'Tool' and v:FindFirstChild("Handle") then
										tool = v
										break
									end
								end
								if tool and human then
									tool.Parent = char
									local tim_e = tick()
									local arm = target.Character:FindFirstChild("Right Arm") or
										target.Character:FindFirstChild("RightHand")
									repeat
										wait()
										if tool.Parent == char and tick() - tim_e > 0.6 then
											target.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
										end
									until tool.Parent ~= char and arm:FindFirstChildOfClass("Weld")
									if target.Character:FindFirstChildOfClass("Humanoid") then
										target.Character:FindFirstChildOfClass("Humanoid").Health = 0
									end
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["Kill"] = {
					["SourceText"] = "<selector>; innertxt='Kill Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and not variables.cannotGfdssdf then
							local char = plr.Character
							if target and char and target.Character and target.Character.PrimaryPart then
								destroyobject(target.Character:FindFirstChild("Head"))
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["KillAll"] = {
					["SourceText"] = "<btn>; innertxt='Kill All';",
					["Runner"] = function(selectedN)
						if plr.Character and not variables.cannotGfdssdf then
							local char = plr.Character
							for _, target in ipairs(game:GetService("Players"):GetPlayers()) do
								if target ~= plr and char and target.Character and target.Character.PrimaryPart then
									destroyobject(target.Character:FindFirstChild("Head"))
								end
							end
						end
					end,
				},
				["KickAll"] = {
					["SourceText"] = "<btn>; innertxt='Kick All';",
					["Runner"] = function(selectedN)
						for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v ~= plr then
								destroyobject(v)
							end
						end
					end,
				},
				["FreeIron"] = {
					["SourceText"] = "<txtbox>; innertxt='Free Iron';placeholder='Amount';",
					["Runner"] = function(text)
						if tonumber(text) then
							if wspace:FindFirstChild("GainMaterial") then
								local event = wspace:FindFirstChild("GainMaterial")
								event:InvokeServer(-plr:FindFirstChild("Iron").Value, "Iron")
								event:InvokeServer(tonumber(text), "Iron")
							end
						end
					end,
				},
				["FreeSilver"] = {
					["SourceText"] = "<txtbox>; innertxt='Free Silver';placeholder='Amount';",
					["Runner"] = function(text)
						if tonumber(text) then
							if wspace:FindFirstChild("GainMaterial") then
								local event = wspace:FindFirstChild("GainMaterial")
								event:InvokeServer(-plr:FindFirstChild("Silver").Value, "Silver")
								event:InvokeServer(tonumber(text), "Silver")
							end
						end
					end,
				},
				["FreeGold"] = {
					["SourceText"] = "<txtbox>; innertxt='Free Gold';placeholder='Amount';",
					["Runner"] = function(text)
						if tonumber(text) then
							if wspace:FindFirstChild("GainMaterial") then
								local event = wspace:FindFirstChild("GainMaterial")
								event:InvokeServer(-plr:FindFirstChild("Gold").Value, "Gold")
								event:InvokeServer(tonumber(text), "Gold")
							end
						end
					end,
				},
				["FreeRubys"] = {
					["SourceText"] = "<txtbox>; innertxt='Free Rubys';placeholder='Amount';",
					["Runner"] = function(text)
						if tonumber(text) then
							if wspace:FindFirstChild("GainMaterial") then
								local event = wspace:FindFirstChild("GainMaterial")
								event:InvokeServer(-plr:FindFirstChild("Rubys").Value, "Rubys")
								event:InvokeServer(tonumber(text), "Rubys")
							end
						end
					end,
				},
				["FreeDiamonds"] = {
					["SourceText"] = "<txtbox>; innertxt='Free Diamonds';placeholder='Amount';",
					["Runner"] = function(text)
						if tonumber(text) then
							if wspace:FindFirstChild("GainMaterial") then
								local event = wspace:FindFirstChild("GainMaterial")
								event:InvokeServer(-plr:FindFirstChild("Diamonds").Value, "Diamonds")
								event:InvokeServer(tonumber(text), "Diamonds")
							end
						end
					end,
				},
			},
		},
		["Brookhaven"] = {
			["Icon"] = icons.Game,
			["Id"] = 9,
			["All Sections"] = {
				["Bring"] = {
					["SourceText"] = "<selector>; innertxt='Bring'",
					["Runner"] = function(selectedN)
						local target = nil
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and target and target.Character and target.Character.PrimaryPart then
							local couch = prepbringcouch()
							local char = plr.Character
							local human = char:FindFirstChildOfClass("Humanoid")

							if couch then
								local seat1 = couch:WaitForChild("Seat1")
								local seat2 = couch:WaitForChild("Seat2")
								local start = tick()
								local maxtime = 3

								repeat
									local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
									if not arm then
										break
									end
									local acf = arm.CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
									local xcf = target.Character.PrimaryPart.CFrame +
										calculateMovePoint(target.Character:FindFirstChildOfClass("Humanoid"), target.Character.PrimaryPart) +
										Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
									human:UnequipTools()
									couch.Grip = acf:ToObjectSpace(xcf):Inverse()
									human:EquipTool(couch)
									task.wait()
								until not target.Parent or not target.Character or not target.Character:FindFirstChildOfClass("Humanoid") or not target.Character.PrimaryPart or plr.Character ~= char or seat1:FindFirstChildOfClass("Weld") or seat2:FindFirstChildOfClass("Weld") or tick() - start > maxtime

								local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
								if not arm then
									return
								end

								human:UnequipTools()
								couch.Grip = CFrame.new()
								human:EquipTool(couch)
								wait(0.5)
								human:UnequipTools()
							else
								Notification(nameH .. "UI", "Error: Getting couch.", 2, 3)
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["Void"] = {
					["SourceText"] = "<selector>; innertxt='Void'",
					["Runner"] = function(selectedN)
						local target = nil
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and target and target.Character and target.Character.PrimaryPart then
							local couch = prepbringcouch()
							local char = plr.Character
							local human = char:FindFirstChildOfClass("Humanoid")

							if couch then
								local seat1 = couch:WaitForChild("Seat1")
								local seat2 = couch:WaitForChild("Seat2")
								local start = tick()
								local maxtime = 3

								repeat
									local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
									if not arm then
										break
									end
									local acf = arm.CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
									local xcf = target.Character.PrimaryPart.CFrame +
										calculateMovePoint(target.Character:FindFirstChildOfClass("Humanoid"), target.Character.PrimaryPart) +
										Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
									human:UnequipTools()
									couch.Grip = acf:ToObjectSpace(xcf):Inverse()
									human:EquipTool(couch)
									task.wait()
								until not target.Parent or not target.Character or not target.Character:FindFirstChildOfClass("Humanoid") or not target.Character.PrimaryPart or plr.Character ~= char or seat1:FindFirstChildOfClass("Weld") or seat2:FindFirstChildOfClass("Weld") or tick() - start > maxtime

								local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
								if not arm then
									return
								end

								local acf = arm.CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
								local newcf = acf:ToObjectSpace(CFrame.new(Vector3.new(0, workspace.FallenPartsDestroyHeight + 2.6, 0)))
									:Inverse()

								human:UnequipTools()
								couch.Grip = newcf
								human:EquipTool(couch)

								wait(0.5)

								human:UnequipTools()
								couch.Grip = CFrame.new()
							else
								Notification(nameH .. "UI", "Error: Getting couch.", 2, 3)
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				}
			}
		},
		["HardestGameEverWorld"] = {
			["Icon"] = icons.Game,
			["Id"] = 10,
			["All Sections"] = {
				["GodMode"] = {
					["SourceText"] = "<option>; innertxt='GodMode'",
					["Runner"] = function()
						local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Death")
						if remote then
							variables.rewh3g2ed1 = remote
							remote.Name = "A"
						end
					end,
					["Stopper"] = function()
						if variables.rewh3g2ed1 then
							variables.rewh3g2ed1.Name = "Death"
						end
					end,
				},
				["Get10Fails"] = {
					["SourceText"] = "<btn>; innertxt='Get 10 Fails'",
					["Runner"] = function()
						local remote = variables.rewh3g2ed1 or game:GetService("ReplicatedStorage"):FindFirstChild("Death")
						if remote then
							for i = 1, 10 do
								remote:FireServer()
							end
						end
					end,
				},
				["Get100Fails"] = {
					["SourceText"] = "<btn>; innertxt='Get 100 Fails'",
					["Runner"] = function()
						local remote = variables.rewh3g2ed1 or game:GetService("ReplicatedStorage"):FindFirstChild("Death")
						if remote then
							for i = 1, 100 do
								remote:FireServer()
							end
						end
					end,
				},
				["GetWin"] = {
					["SourceText"] = "<btn>; innertxt='Get Win'",
					["Runner"] = function()
						local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Win")
						if remote then
							local currentstage = 1
							local startstage = currentstage + 1
							local laststage = 32
							for i = startstage, laststage do
								remote:FireServer(i)
							end
						end
					end,
				},
				["GoToFirst"] = {
					["SourceText"] = "<btn>; innertxt='Go to First'",
					["Runner"] = function()
						local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Win")
						if remote then
							remote:FireServer(1)
						end
					end,
				},
				["GoToWin"] = {
					["SourceText"] = "<btn>; innertxt='Go to Win'",
					["Runner"] = function()
						local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Win")
						if remote then
							remote:FireServer(32)
						end
					end,
				},
				["OnlyResetProgress"] = {
					["SourceText"] = "<btn>; innertxt='Only Reset Progress'",
					["Runner"] = function()
						local remote = game:GetService("ReplicatedStorage"):FindFirstChild("ResetProgress")
						if remote then
							remote:FireServer()
						end
					end,
				},
				["BreakTimer"] = {
					["SourceText"] = "<btn>; innertxt='Break Timer'",
					["Runner"] = function()
						local remote = game:GetService("ReplicatedStorage"):FindFirstChild("timedifference")
						if remote then
							remote:FireServer(tick())
						end
					end,
				},
				["DoSpeedrun"] = {
					["SourceText"] = "<btn>; innertxt='Do Speedrun'",
					["Runner"] = function()
						local remote = game:GetService("ReplicatedStorage"):FindFirstChild("speedrun")
						if remote then
							remote:FireServer(tick(), true)
						end
					end,
				},
			}
		},
		["TrollPeopleObby"] = {
			["Icon"] = icons.Game,
			["Id"] = 11,
			["All Sections"] = {
				["AutoFarm"] = {
					["SourceText"] = "<option>; innertxt='Auto Farm'",
					["Runner"] = function(selectedN)
						local others = wspace:FindFirstChild("OtherLast")
						local chars = others and others:FindFirstChild("Characters")
						local stagefold = game:GetService("Workspace"):FindFirstChild("Checkpoints")

						if not stagefold or not chars then
							return
						end

						local lastButton = nil
						variables["autofarm898f7"] = true

						for i, v in ipairs(chars:GetChildren()) do
							if v:FindFirstChildOfClass("Model") and #v:FindFirstChildOfClass("Model"):GetChildren() > 3 then
								lastButton = v:FindFirstChildOfClass("Model"):FindFirstChild("Head")
							end
						end

						while true do
							if not variables["autofarm898f7"] then
								break
							end

							local char = plr.Character or plr.CharacterAdded:Wait()
							repeat task.wait() until char.PrimaryPart

							for i, v in ipairs(stagefold:GetChildren()) do
								if v:IsA("Model") and plr.Character == char then
									char:SetPrimaryPartCFrame(v.Center.CFrame + Vector3.new(0, 5, 0))
									wait(0.1)
								end
							end

							if plr.Character == char and lastButton then
								char:SetPrimaryPartCFrame(lastButton.CFrame + Vector3.new(0, 5, 0))
							end
						end
					end,
					["Stopper"] = function(selectedN)
						variables["autofarm898f7"] = nil
					end,
				},
			}
		},
		["BuildABoat"] = {
			["Icon"] = icons.Game,
			["Id"] = 8,
			["All Sections"] = {
				["AutoFarm"] = {
					["SourceText"] = "<option>; innertxt='Auto Farm'; dontsavethis='true';",
					["Runner"] = function()
						variables.buildaboatautofarm34 = true

						local function perAutoFarm()
							local char = plr.Character

							if char and char.PrimaryPart then
								local stages = wspace:FindFirstChild("BoatStages")
								local normalstages = stages and stages:FindFirstChild("NormalStages")
								local theend = normalstages and normalstages:FindFirstChild("TheEnd")
								local chest = theend and theend:FindFirstChild("GoldenChest")
								local trigger = chest and chest:FindFirstChild("Trigger")
								local templateName = "CaveStage"
								local index = 1

								if not trigger then
									task.wait()
									return
								end

								local function findNextDarknessPart()
									local stage = normalstages:FindFirstChild(templateName .. index)

									if stage then
										index = index + 1
										return stage:FindFirstChild("DarknessPart")
									end

									return 1
								end

								noclipf()

								wspace.Gravity = 0

								while variables.buildaboatautofarm34 do
									if not char or not char.Parent or plr.Character ~= char or not char.PrimaryPart then
										break
									end

									local part = findNextDarknessPart()

									if part == 1 then
										break
									end

									local tween = TS:Create(char.PrimaryPart, TweenInfo.new(2), {CFrame = part.CFrame})
									tween:Play()
									tween.Completed:Wait()
								end

								wspace.Gravity = 196.2

								if char and chest and trigger then
									char:SetPrimaryPartCFrame(trigger.CFrame)
								end

								if not variables.manualnoclip32 then
									clipf()
								end

								plr.CharacterAdded:Wait()
							else
								task.wait()
							end
						end

						while variables.buildaboatautofarm34 do
							perAutoFarm()
						end
					end,
					["OnRemove"] = function()
						variables.buildaboatautofarm34 = nil
					end,
					["Stopper"] = function()
						variables.buildaboatautofarm34 = nil
					end
				},
				["TryToDestroyBoat"] = {
					["SourceText"] = "<selector>; innertxt='Try To Destroy Boat'",
					["Runner"] = function(selectedN)
						if variables.buildaboatdestroyboatpartsinprogress34 then
							return
						end

						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if target and target.Character and plr.Character and plr.Character.PrimaryPart then
							local stages = wspace:FindFirstChild("BoatStages")
							local normalstages = stages and stages:FindFirstChild("NormalStages")
							local theend = normalstages and normalstages:FindFirstChild("TheEnd")
							local destroyboatpart = theend and theend:FindFirstChild("DestroyBoatPart")

							if destroyboatpart then
								local blocks = wspace:FindFirstChild("Blocks")
								local playerBlocks = blocks and blocks:FindFirstChild(selectedN)

								if playerBlocks then
									variables.buildaboatdestroyboatpartsinprogress34 = true
									task.spawn(function()
										variables.buildaboatdestroyboatpartsinprogress34 = nil
									end)

									local osize = destroyboatpart.Size
									local ocf = destroyboatpart.CFrame

									destroyboatpart.CFrame = plr.Character.PrimaryPart.CFrame + Vector3.new(0, 0, 3)
									destroyboatpart.Size = Vector3.new(1, 1, 1)

									for i, v in ipairs(playerBlocks:GetChildren()) do
										if v:IsA("Model") and v.PrimaryPart then
											if v.PrimaryPart.CanTouch == false then
												v.PrimaryPart.CanTouch = true
											end

											task.spawn(function()
												local ocf = v.PrimaryPart.CFrame
												v:SetPrimaryPartCFrame(destroyboatpart.CFrame)
												task.wait(1)
												if v and v.Parent and v.PrimaryPart then
													v:SetPrimaryPartCFrame(ocf)
												end
											end)
										end
									end
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {})
					end,
				},
				["TryToDestroyAllBoats"] = {
					["SourceText"] = "<btn>; innertxt='Try to Destroy All Boats'",
					["Runner"] = function(selectedN)
						if variables.buildaboatdestroyboatpartsinprogress34 then
							return
						end
						local stages = wspace:FindFirstChild("BoatStages")
						local normalstages = stages and stages:FindFirstChild("NormalStages")
						local theend = normalstages and normalstages:FindFirstChild("TheEnd")
						local destroyboatpart = theend and theend:FindFirstChild("DestroyBoatPart")

						if destroyboatpart then
							local ocf = destroyboatpart.CFrame
							local blocks = wspace:FindFirstChild("Blocks")

							variables.buildaboatdestroyboatpartsinprogress34 = true
							task.spawn(function()
								variables.buildaboatdestroyboatpartsinprogress34 = nil
							end)

							for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
								local playerBlocks = blocks and blocks:FindFirstChild(v.Name)

								if playerBlocks then
									local osize = destroyboatpart.Size
									local ocf = destroyboatpart.CFrame

									destroyboatpart.CFrame = plr.Character.PrimaryPart.CFrame + Vector3.new(0, 0, 3)
									destroyboatpart.Size = Vector3.new(1, 1, 1)

									for i, v in ipairs(playerBlocks:GetChildren()) do
										if v:IsA("Model") and v.PrimaryPart then
											if v.PrimaryPart.CanTouch == false then
												v.PrimaryPart.CanTouch = true
											end

											task.spawn(function()
												local ocf = v.PrimaryPart.CFrame
												v:SetPrimaryPartCFrame(destroyboatpart.CFrame)
												task.wait(1)
												if v and v.Parent and v.PrimaryPart then
													v:SetPrimaryPartCFrame(ocf)
												end
											end)
										end
									end
								end
							end
						end
					end,
				},
				["GoToBase"] = {
					["SourceText"] = "<btn>; innertxt='Go to Your Base';",
					["Runner"] = function()
						if plr.Character and plr.Character.PrimaryPart then
							local teamcolor = plr.TeamColor
							local place = nil
							for i, v in ipairs(wspace:GetChildren()) do
								if v:IsA 'BasePart' then
									if v:FindFirstChild("TeamColor") ~= nil and v:FindFirstChild("VoteLaunchRE") then
										if v.TeamColor.Value == teamcolor then
											place = v
										end
									end
								end
							end
							if place then
								plr.Character:SetPrimaryPartCFrame(CFrame.fromOrientation(plr.Character.PrimaryPart.CFrame:ToOrientation()) +
									place.Position + Vector3.new(0, 10, 0))
							end
						end
					end,
				},
				["BeInvisible"] = {
					["SourceText"] = "<btn>; innertxt='Be Invisible';",
					["Runner"] = function()
						local char = plr.Character
						local root = char and char.PrimaryPart

						if root then
							local stages = wspace:FindFirstChild("BoatStages")

							if not stages then
								return
							end

							local function findRemovePart()
								local found = nil

								for i, v in ipairs(getDescendants(stages)) do
									if v.Name == "Damage" then
										if v.Parent:IsA("BasePart") and v.Parent.Transparency < 1 then
											found = v.Parent
											break
										end
										if v.Parent.Parent:IsA("BasePart") and v.Parent.Parent.Transparency < 1 then
											found = v.Parent.Parent
											break
										end
									end
								end

								return found
							end

							local function isjointsremoved()
								if not char:FindFirstChild("LowerTorso") then
									return true
								end

								return false
							end

							local removepart = findRemovePart()

							if removepart then
								local osize = removepart.Size
								removepart.Size = Vector3.new(1, 1, 1)
								local oct = {}

								for i, v in ipairs(char:GetChildren()) do
									if v:IsA("BasePart") and v.CanTouch then
										table.insert(oct, v)
										v.CanTouch = false
									end
								end

								local torso = char:FindFirstChild("LowerTorso")
								torso.CanTouch = true

								local root = char:FindFirstChild("HumanoidRootPart")
								root.Color = Color3.new(1, 1, 1)
								root.Transparency = 0
								wspace.CurrentCamera.CameraSubject = root

								local timestart = tick()
								local ocf = removepart.CFrame

								while true do
									if removepart then
										removepart.Transparency = 1
										removepart.CanCollide = false
										removepart.CFrame = torso.CFrame
									end

									if tick() - timestart > 5 or isjointsremoved() then
										break
									end

									if not removepart.Parent then
										removepart = findRemovePart()
										if not removepart then
											break
										end
									end

									task.wait()
								end

								if removepart then
									removepart:Destroy()
								end

								for i, v in ipairs(oct) do
									if v.Parent then
										v.CanTouch = true
									end
								end
							end
						end
					end,
				},
				["NoArms"] = {
					["SourceText"] = "<btn>; innertxt='NoArms';",
					["Runner"] = function()
						local char = plr.Character
						local root = char and char.PrimaryPart

						if root then
							local stages = wspace:FindFirstChild("BoatStages")

							if not stages then
								return
							end

							local function findRemovePart()
								local found = nil

								for i, v in ipairs(getDescendants(stages)) do
									if v.Name == "Damage" then
										if v.Parent:IsA("BasePart") and v.Parent.Transparency < 1 then
											found = v.Parent
											break
										end
										if v.Parent.Parent:IsA("BasePart") and v.Parent.Parent.Transparency < 1 then
											found = v.Parent.Parent
											break
										end
									end
								end

								return found
							end

							local removepart = findRemovePart()

							if removepart then
								local oct = {}

								local ra = char:FindFirstChild("RightUpperArm")
								local la = char:FindFirstChild("LeftUpperArm")

								local function checkJoint()
									if not ra.Parent and not la.Parent then
										return true
									end

									return false
								end

								for i, v in ipairs(char:GetChildren()) do
									if v:IsA("BasePart") and v.CanTouch and v ~= ra and v ~= la then
										table.insert(oct, v)
										v.CanTouch = false
									end
								end

								local orct1 = ra and ra.CanTouch

								if ra then
									ra.CanTouch = true
								end

								local orct2 = la and la.CanTouch

								if la then
									la.CanTouch = true
								end

								local timestart = tick()
								local ocf = removepart.CFrame
								local osize = removepart.Size

								while true do
									if removepart then
										removepart.Transparency = 1
										removepart.CanCollide = false
										removepart.CFrame = root.CFrame
										removepart.Size = Vector3.new(8, 8, 8)
									end

									if tick() - timestart > 5 or checkJoint() then
										break
									end

									if not removepart.Parent then
										removepart = findRemovePart()
										if not removepart then
											break
										end
									end

									task.wait()
								end

								if removepart then
									removepart:Destroy()
								end

								for i, v in ipairs(oct) do
									if v.Parent then
										v.CanTouch = true
									end
								end
							end
						end
					end,
				},
				["NoLegs"] = {
					["SourceText"] = "<btn>; innertxt='NoLegs';",
					["Runner"] = function()
						local char = plr.Character
						local root = char and char.PrimaryPart

						if root then
							local stages = wspace:FindFirstChild("BoatStages")

							if not stages then
								return
							end

							local function findRemovePart()
								local found = nil

								for i, v in ipairs(getDescendants(stages)) do
									if v.Name == "Damage" then
										if v.Parent:IsA("BasePart") and v.Parent.Transparency < 1 then
											found = v.Parent
											break
										end
										if v.Parent.Parent:IsA("BasePart") and v.Parent.Parent.Transparency < 1 then
											found = v.Parent.Parent
											break
										end
									end
								end

								return found
							end

							local removepart = findRemovePart()

							if removepart then
								local oct = {}

								local ra = char:FindFirstChild("RightUpperLeg")
								local la = char:FindFirstChild("LeftUpperLeg")

								local function checkJoint()
									if not ra.Parent and not la.Parent then
										return true
									end

									return false
								end

								for i, v in ipairs(char:GetChildren()) do
									if v:IsA("BasePart") and v.CanTouch and v ~= ra and v ~= la then
										table.insert(oct, v)
										v.CanTouch = false
									end
								end

								local orct1 = ra and ra.CanTouch

								if ra then
									ra.CanTouch = true
								end

								local orct2 = la and la.CanTouch

								if la then
									la.CanTouch = true
								end

								local timestart = tick()
								local ocf = removepart.CFrame
								local osize = removepart.Size

								while true do
									if removepart.Parent then
										removepart.Transparency = 1
										removepart.CanCollide = false
										removepart.CFrame = root.CFrame
										removepart.Size = Vector3.new(8, 8, 8)
									end

									if tick() - timestart > 5 or checkJoint() then
										break
									end

									if not removepart.Parent then
										removepart = findRemovePart()
										if not removepart then
											break
										end
									end

									task.wait()
								end

								if removepart then
									removepart:Destroy()
								end

								for i, v in ipairs(oct) do
									if v.Parent then
										v.CanTouch = true
									end
								end
							end
						end
					end,
				},
				["CopyTeam"] = {
					["SourceText"] = "<option>; innertxt='Copy Full Team';",
					["Runner"] = function()
						variables.copyfullteam34 = true
					end,
					["Stopper"] = function()
						variables.copyfullteam34 = false
					end,
				},
				["CTRLC"] = {
					["SourceText"] = "<selector>; innertxt='Copy Build';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if target and target.Character then
							task.spawn(function() Notification(nameH.."UI", "Writing Target Build to Buffer...", 2); end)
							variables.copiedbuilddata0x34 = {}
							local blocks = wspace:FindFirstChild("Blocks")

							if not blocks then
								return
							end

							local place = nil;
							local loadedBlocks = 0
							local loadcompleted = false
							local returned = 0
							local waitingforcontrol = {}
							local teamcolor = target.TeamColor
							for i, v in ipairs(wspace:GetChildren()) do
								if v:IsA 'BasePart' then
									if v:FindFirstChild("TeamColor") ~= nil and v:FindFirstChild("VoteLaunchRE") ~= nil then
										if v.TeamColor.Value == teamcolor then
											place = v
										end
									end
								end
							end
							local function encodepart(v)
								local _string = "0x00=" .. v.Name .. ";0x8={"
								local transparency = 0
								local controls = {}
								if v:FindFirstChild 'TransparencyModifier' then
									transparency = v.TransparencyModifier.Value
								end
								if v:FindFirstChild 'BindUp' then
									table.insert(controls, {
										"BindUp",
										v.BindUp.Value
									})
								end
								if v:FindFirstChild 'BindDown' then
									table.insert(controls, {
										"BindDown",
										v.BindDown.Value
									})
								end
								if v:FindFirstChild 'BindRight' then
									table.insert(controls, {
										"BindRight",
										v.BindRight.Value
									})
								end
								if v:FindFirstChild 'BindLeft' then
									table.insert(controls, {
										"BindLeft",
										v.BindLeft.Value
									})
								end
								if v:FindFirstChild 'BindFire' then
									table.insert(controls, {
										"BindFire",
										v.BindFire.Value
									})
								end
								if v:FindFirstChild 'BindWait' then
									table.insert(controls, {
										"BindWait",
										v.BindWait.Value
									})
								end
								for c, d in ipairs(controls) do
									if c > 1 then
										_string = _string .. ","
									end
									_string = _string .. d[1] .. "*" .. d[2] .. "_"
								end
								_string = _string .. "};"
								_string = _string .. "0x10={"
								local anchored = v.PrimaryPart.Anchored
								local cf1 = tostring(place.CFrame:toObjectSpace(v.PrimaryPart.CFrame))
								local cf2 = tostring(v.PrimaryPart.CFrame)
								local color = tostring(v.PrimaryPart.Color)
								local size = tostring(v.PrimaryPart.Size)
								local cancollide = v.PrimaryPart.CanCollide
								local controller = nil
								local iscr = false
								anchored = (anchored == true and 1) or 0
								cancollide = (cancollide == true and 1) or 0
								if v:FindFirstChild 'ControllerRef' then
									controller = v.ControllerRef.Value
								end
								if v:FindFirstChild("ControllerId") then
									iscr = true
								end
								if controller then
									loadedBlocks = loadedBlocks + 1
									task.spawn(function()
										repeat task.wait() until loadcompleted
										local controlledf = 0
										for _, d in ipairs(waitingforcontrol) do
											if d[1] == controller then
												controlledf = d[2]
											end
										end
										_string = _string ..
											loadedBlocks ..
											"_" ..
											cf1 ..
											"_" ..
											tostring(v.PrimaryPart.CFrame) ..
											"_" ..
											size .. "_" .. transparency .. "_" ..
											cancollide .. "_" .. color .. "_" .. anchored .. "_nil_" .. controlledf .. "};"
										table.insert(variables.copiedbuilddata0x34, _string)
										returned = returned + 1
									end)
								elseif iscr then
									loadedBlocks = loadedBlocks + 1
									table.insert(waitingforcontrol, {v, loadedBlocks})
									_string = _string ..
										loadedBlocks ..
										"_" ..
										cf1 ..
										"_" ..
										tostring(v.PrimaryPart.CFrame) ..
										"_" .. size .. "_" .. transparency .. "_" .. cancollide .. "_" ..
										color .. "_" .. anchored .. "_nil_nil" .. "};"
									table.insert(variables.copiedbuilddata0x34, _string)
									returned = returned + 1
								else
									loadedBlocks = loadedBlocks + 1
									_string = _string ..
										loadedBlocks ..
										"_" ..
										cf1 ..
										"_" ..
										tostring(v.PrimaryPart.CFrame) ..
										"_" .. size .. "_" .. transparency .. "_" .. cancollide .. "_" ..
										color .. "_" .. anchored .. "_nil_nil" .. "};"
									table.insert(variables.copiedbuilddata0x34, _string)
									returned = returned + 1
								end
							end
							local function encodetargetblocks(targetX)
								local targetblocks = blocks:FindFirstChild(targetX.Name)
								for i, v in ipairs(targetblocks:GetChildren()) do
									if v:IsA("Model") and v.PrimaryPart then
										encodepart(v)
									end
								end
							end

							if variables.copyfullteam34 then
								for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
									if v.TeamColor == target.TeamColor then
										encodetargetblocks(v)
									end
								end
							else
								encodetargetblocks(target)
							end
							task.spawn(function() Notification(nameH .. "UI", "Got " .. loadedBlocks .. " Blocks", 2, 2); end)
							loadcompleted = true
							repeat task.wait() until returned >= loadedBlocks
						end
						return 1;
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {})
					end,
				},
				["CTRLV"] = {
					["SourceText"] = "<btn>; innertxt='Paste Build';",
					["Runner"] = function(button, otext)
						task.spawn(function() Notification(nameH.."UI", "Reading and Pasting Build...", 2); end)
						if not variables.copiedbuilddata0x34 or #variables.copiedbuilddata0x34 <= 0 then
							task.spawn(function() Notification(nameH .. "UI", "Data not found.", 2, 3) end)
							return 0;
						end
						local blocks = wspace:FindFirstChild("Blocks")
						local place = nil;
						local teamcolor = plr.TeamColor;
						local waitingforcontrol = {};
						local loaded = false;
						local function getPlace()
							local ret = nil;
							for i, v in ipairs(wspace:GetChildren()) do
								if v:IsA 'BasePart' then
									if v:FindFirstChild 'TeamColor' ~= nil and v:FindFirstChild 'VoteLaunchRE' ~= nil then
										if v.TeamColor.Value == teamcolor then
											ret = v
										end
									end
								end
							end
							return ret;
						end
						place = getPlace();
						if not place then return 0; end
						local function waitForPart(name, cf3)
							local got = blocks:FindFirstChild(plr.Name).ChildAdded:Wait()
							repeat task.wait() until got.PrimaryPart
							local truepart = false
							if got:IsA("Model") and got.PrimaryPart and (got.PrimaryPart.Position - cf3.Position).Magnitude < 0.5 and got.Name == name then
								truepart = true
							end
							if truepart then
								return got
							else
								return waitForPart(name, cf3)
							end
						end
						local function convertVector3(_string)
							local arguments = split(_string, ",")
							return Vector3.new(unpack(arguments))
						end
						local function convertCFrame(_string)
							local arguments = split(_string, ",")
							return CFrame.new(unpack(arguments))
						end
						local function convertColor3(_string)
							local arguments = split(_string, ",")
							return Color3.new(unpack(arguments))
						end
						local function convertBoolean(_string)
							return (tonumber(_string) == 1 and true) or false
						end
						local function decodeString(str)
							local arrays = split(str, ";")
							local namei = split(arrays[1], "=");
							local controlleri = split(arrays[2], "=");
							local propertiesi = split(arrays[3], "=");
							local nI = namei[1];
							local name = namei[2];
							local cI = controlleri[1];
							local controllerArray = string.gsub(controlleri[2], "{", "");
							controllerArray = string.gsub(controllerArray, "}", "");
							local pI = controlleri[1];
							local propertiesArray = string.gsub(propertiesi[2], "{", "");
							propertiesArray = string.gsub(propertiesArray, "}", "");
							local controller = split(controllerArray, "_");
							local properties = split(propertiesArray, "_");

							local blockindex = properties[1];
							local cframe1 = properties[2];
							local cframe2 = properties[3];
							local size = properties[4];
							local transparency = properties[5] and tonumber(properties[5]);
							local cancollide = properties[6];
							local color = properties[7];
							local anchored = properties[8];
							local cstring = properties[9];
							local controllerid = properties[10] and tonumber(properties[10]);

							cframe1 = convertCFrame(cframe1);
							cframe2 = convertCFrame(cframe2);
							size = convertVector3(size);
							cancollide = convertBoolean(cancollide);
							color = convertColor3(color);
							anchored = convertBoolean(anchored);

							local cframe3 = place.CFrame:ToWorldSpace(cframe1)

							local amount = plr.Data[name].Value

							if amount > 0 then
								local event = plr:FindFirstChildOfClass("Backpack")["BuildingTool"].RF
								task.spawn(function() event:InvokeServer(name, amount, place, cframe1, true, cframe2, false) end)
								local cc = waitForPart(name, cframe3);
								local event2 = plr:FindFirstChildOfClass("Backpack")["ScalingTool"].RF
								local event3 = plr:FindFirstChildOfClass("Backpack")["PropertiesTool"].SetPropertieRF
								local event4 = plr:FindFirstChildOfClass("Backpack")["PaintingTool"].RF
								local event5 = plr:FindFirstChildOfClass("Backpack")["BindTool"].RF
								local ccc1 = {
									[1] = {
										[1] = cc,
										[2] = color,
									}
								}
								task.spawn(function() event2:InvokeServer(cc, size, cframe3) end)
								local rcolor = game:GetService 'ReplicatedStorage':WaitForChild 'BuildingParts':WaitForChild(name)
									.PrimaryPart.Color
								local mcolor = math.sqrt(((color.R - rcolor.R) ^ 2) + ((color.G - rcolor.G) ^ 2) + ((color.B - rcolor.B) ^ 2))
								if mcolor * 255 > 5 then
									task.spawn(function() event4:InvokeServer(ccc1) end)
								end
								local cs = {
									[1] = cc
								}
								if not cancollide then
									pcall(function() event3:InvokeServer("Collision", cs) end)
								end
								for i = 1, math.floor(transparency * 4 + 0.45) do
									pcall(function() event3:InvokeServer("Transparency", cs) end)
								end
								if cc:FindFirstChild 'ControllerId' then
									table.insert(waitingforcontrol, {blockindex, cc})
								end
								task.spawn(function()
									repeat task.wait() until loaded == true;
									local cid = nil
									if not anchored then
										task.spawn(function() event3:InvokeServer("Anchored", cs) end)
									end
									if controllerid then
										for _, d in ipairs(waitingforcontrol) do
											if d[1] == controllerid then
												cid = d
												break
											end
										end
										if cid then
											for _, s in ipairs(controller) do
												local arrayS = split(s, "*")
												local a1		 = {
													[1] = cc:FindFirstChild(arrayS[1])
												}
												local a2		 = cid[2]
												local a3		 = arrayS[2]
												local a4		 = false
												pcall(function() event5:InvokeServer(a1, a2, a3, a4) end)
											end
										end
									end
								end)
							end
						end
						local loadindex = 0;
						for i, v in ipairs(variables.copiedbuilddata0x34) do
							if typeof(v) == "string" then
								if loadindex >= 50 then
									wait();
									loadindex = 0;
								else
									loadindex = loadindex + 1;
								end
								task.spawn(function()
									decodeString(v);
								end)
							end
						end
						loaded = true;
						task.spawn(function() Notification(nameH.."UI", "Successfly Got Build", 2, 2); end)
						return 1;
					end,
				},
			},
		},
		["MM2"] = {
			["Icon"] = icons.Game,
			["Id"] = 4,
			["All Sections"] = {
				["TeleportToMM2"] = {
					["SourceText"] = "<btn>; innertxt='Teleport to MM2';",
					["Runner"] = function()
						teleportplr(142823291)
					end
				},
				["GlitchCharacter"] = {
					["SourceText"] = "<btn>; innertxt='Glitch Character';",
					["Runner"] = function(button, otext)
						if plr.Character and not variables.cannotGfdssdf then
							local extraping = variables.exping or 0.03
							variables.exping = extraping
							local ingame = {}
							variables.cannotGfdssdf = true;

							local bgFrame = Instance.new("TextButton", ui)
							local iFrame = Instance.new("Frame", bgFrame)
							local statustext = Instance.new("TextLabel", iFrame)
							local selector = Instance.new("ScrollingFrame", iFrame)
							local clearb = Instance.new("TextButton", iFrame)
							local selAll = Instance.new("TextButton", iFrame)
							local okB = Instance.new("TextButton", iFrame)
							local refresh = Instance.new("TextButton", iFrame)
							local cancelB = Instance.new("TextButton", iFrame)
							local selectedping = Instance.new("TextBox", iFrame)

							Instance.new("UIListLayout", selector)

							bgFrame.Name = "GlitchCharacterSection"
							bgFrame.Position = UDim2.new(0, 0, 0, -guiinset.Y)
							bgFrame.Size = UDim2.new(1, 0, 1, guiinset.Y)
							bgFrame.BackgroundColor3 = Color3.new()
							bgFrame.BackgroundTransparency = 0.55
							bgFrame.Text = ""
							bgFrame.AutoButtonColor = false
							bgFrame.ZIndex = 4

							iFrame.Size = fsize
							iFrame.Position = UDim2.new(0.5 - fsize.X.Scale / 2, -fsize.X.Offset / 2, 0.5 - fsize.X.Scale / 2,
								-fsize.Y.Offset / 2)
							iFrame.BackgroundColor3 = black
							iFrame.ZIndex = 4
							iFrame.BorderSizePixel = 0

							pcall(function() Instance.new("UICorner", iFrame).CornerRadius = UDim.new(0, 4) end)
							statustext.Size = UDim2.new(0.8, 0, 0.075, 0)
							statustext.Position = UDim2.new(0.1, 0, 0, 0)
							statustext.BackgroundTransparency = 1
							statustext.Font = classicFont
							statustext.TextColor3 = whitew
							statustext.TextSize = 20
							statustext.Text = "Selected 0/" .. #game:GetService("Players"):GetPlayers()
							statustext.ZIndex = 4

							clearb.Size = UDim2.new(0.2, 0, 0, 20)
							clearb.Position = UDim2.new(0.8, -4, 0.5, -22)
							clearb.BackgroundColor3 = blackb
							clearb.BorderSizePixel = 0
							clearb.Font = classicFont
							clearb.TextColor3 = whitew
							clearb.TextScaled = true
							clearb.Text = "Clear"
							clearb.ZIndex = 4

							selAll.Size = UDim2.new(0.2, 0, 0, 20)
							selAll.Position = UDim2.new(0.8, -4, 0.5, 2)
							selAll.BackgroundColor3 = blackb
							selAll.BorderSizePixel = 0
							selAll.Font = classicFont
							selAll.TextColor3 = whitew
							selAll.TextScaled = true
							selAll.Text = "Select All"
							selAll.ZIndex = 4

							okB.Size = UDim2.new(0.2, 0, 0, 20)
							okB.Position = UDim2.new(0.3, -2, 1, -24)
							okB.BorderSizePixel = 0
							okB.BackgroundColor3 = blackb
							okB.Font = classicFont
							okB.TextColor3 = whitew
							okB.TextScaled = true
							okB.Text = "Glitch"
							okB.ZIndex = 4

							refresh.Size = UDim2.new(0.2, 0, 0, 20)
							refresh.Position = UDim2.new(0.8, -4, 1, -24)
							refresh.BorderSizePixel = 0
							refresh.BackgroundColor3 = blackb
							refresh.Font = classicFont
							refresh.TextColor3 = whitew
							refresh.TextScaled = true
							refresh.Text = "Refresh"
							refresh.ZIndex = 4

							cancelB.Size = UDim2.new(0.2, 0, 0, 20)
							cancelB.Position = UDim2.new(0.5, 2, 1, -24)
							cancelB.BackgroundColor3 = blackb
							cancelB.BorderSizePixel = 0
							cancelB.Font = classicFont
							cancelB.TextColor3 = whitew
							cancelB.TextScaled = true
							cancelB.Text = "Cancel"
							cancelB.ZIndex = 4

							selectedping.Size = UDim2.new(0.2, 0, 0, 20)
							selectedping.Position = UDim2.new(0, 4, 1, -24)
							selectedping.BackgroundColor3 = blackb
							selectedping.BorderSizePixel = 0
							selectedping.Font = classicFont
							selectedping.TextColor3 = whitew
							selectedping.TextScaled = true
							selectedping.Text = "Extra ping " .. (extraping * 1000) .. " ms"
							pcall(function() selectedping.PlaceholderText = "Extra ping ms" end)
							selectedping.ZIndex = 4

							selector.BackgroundColor3 = white
							selector.BorderSizePixel = 0
							selector.Size = UDim2.new(0.5, 0, 0.6, 0)
							selector.Position = UDim2.new(0.25, 0, 0.2, 0)
							selector.TopImage = ""
							selector.BottomImage = ""
							selector.ZIndex = 4

							local connects = {}

							local cancelps = false
							local startglitch = false

							local function numberofselected()
								local ret = 0
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") and v.Name == "Selected" then
										ret = ret + 1
									end
								end
								return ret
							end

							local function loadlist()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") then
										v:Destroy()
									end
								end
								local ss = 0
								for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
									if v.Character and v ~= plr then
										task.spawn(function()
											local buttonv = Instance.new("TextButton", selector)
											local uiPadding = Instance.new("UIPadding", buttonv)
											buttonv.Size = UDim2.new(1, 0, 0, 20)
											buttonv.BackgroundColor3 = black
											buttonv.BorderSizePixel = 0
											buttonv.TextScaled = true
											buttonv.TextColor3 = getplayercolor(v)
											buttonv.Font = classicFont
											buttonv.Text = v.Name
											buttonv.ZIndex = 4
											ss = ss + 20
											table.insert(connects, buttonv.MouseButton1Click:Connect(function()
												if buttonv.Name == "Selected" then
													buttonv.Name = "Option"
													buttonv.BackgroundColor3 = black
													statustext.Text = "Selected " ..
														numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
												else
													buttonv.Name = "Selected"
													buttonv.BackgroundColor3 = white
													statustext.Text = "Selected " ..
														numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
												end
											end))
											table.insert(connects, buttonv.MouseEnter:Connect(function()
												local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 5)})
												tween:Play()
											end))
											table.insert(connects, buttonv.MouseLeave:Connect(function()
												local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 0)})
												tween:Play()
												wait(0.1)
												uiPadding.PaddingLeft = UDim.new(0, 0)
											end))
											table.insert(connects, buttonv.MouseButton1Down:Connect(function()
												local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 15)})
												tween:Play()
											end))
											table.insert(connects, buttonv.MouseButton1Up:Connect(function()
												local tween = TS:Create(uiPadding, TweenInfo.new(0.1), {PaddingLeft = UDim.new(0, 5)})
												tween:Play()
											end))
										end)
									end
								end
								selector.CanvasSize = UDim2.new(0, 0, 0, ss)
							end

							loadlist()

							connects[1] = selectedping.FocusLost:Connect(function()
								local numb = tonumber(selectedping.Text)
								if numb then
									extraping = numb / 1000
									selectedping.Text = "Extra ping " .. numb .. " ms"
									variables.exping = numb / 1000
								else
									selectedping.Text = "Extra ping " .. (extraping * 1000) .. " ms"
								end
							end)

							connects[2] = cancelB.MouseButton1Click:Connect(function()
								cancelps = true
							end)

							connects[3] = okB.MouseButton1Click:Connect(function()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") and v.Name == "Selected" and game:GetService("Players"):FindFirstChild(v.Text) then
										table.insert(ingame, game:GetService("Players"):FindFirstChild(v.Text))
									end
								end
								startglitch = true
							end)

							connects[4] = selAll.MouseButton1Click:Connect(function()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") then
										v.Name = "Selected"
										v.BackgroundColor3 = white
									end
								end
								statustext.Text = "Selected " .. numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
							end)

							connects[5] = clearb.MouseButton1Click:Connect(function()
								for i, v in ipairs(selector:GetChildren()) do
									if v:IsA("TextButton") then
										v.Name = "Option"
										v.BackgroundColor3 = black
									end
								end
								statustext.Text = "Selected " .. numberofselected() .. "/" .. #game:GetService("Players"):GetPlayers()
							end)

							connects[6] = refresh.MouseButton1Click:Connect(function()
								loadlist()
							end)

							repeat
								wait()
							until cancelps or startglitch

							for i, v in ipairs(connects) do
								v:Disconnect()
							end

							bgFrame:Destroy()

							if cancelps then
								variables.cannotGfdssdf = false;
								return
							end

							local char = plr.Character
							local human = plr.Character:FindFirstChildOfClass("Humanoid")
							if human then
								glitchhumanoid(0.2)
								task.spawn(function()
									plr.CharacterAdded:Wait()
									variables.cannotGfdssdf = false;
								end)
								local function runwait()
									human.Changed:Wait()
									if human.Health > 0 then
										runwait()
									end
								end
								runwait()
								local completed = 0
								local ping = plr:GetNetworkPing() + extraping
								local prevcf = char.PrimaryPart.CFrame
								local can = true
								for i, v in ipairs(ingame) do
									if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
										local t_ck = tick()
										repeat
											task.wait()
											char:SetPrimaryPartCFrame(v.Character.PrimaryPart.CFrame)
										until tick() - t_ck > ping
										if can then
											completed = completed + 1
										else
											break
										end
									end
								end
								char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, 500, 0)))
								local voidbase = Instance.new("Part", wspace)
								voidbase.Anchored = true
								voidbase.Size = Vector3.new(25, 480, 25)
								task.spawn(function()
									repeat task.wait() until human.Health > 0
									can = false
									Notification(nameH.."UI", "Interaceted to " .. completed .. "/" .. #ingame, 5, 2)
								end)
								wait(0.5)
								char:SetPrimaryPartCFrame(prevcf)
								wait(0.5)
								voidbase:Destroy()
							end
						end
					end,
				},
				["GlitchCharacterFaster"] = {
					["SourceText"] = "<btn>; innertxt='BETA Glitch Character Faster';",
					["Runner"] = function(button, otext)
						if plr.Character and not variables.cannotGfdssdf then
							variables.cannotGfdssdf = true;
							local broken = false

							task.spawn(function()
								plr.CharacterAdded:Wait()
								broken = true
								variables.cannotGfdssdf = false;
							end)

							local bp = plr:FindFirstChildOfClass("Backpack")
							local amount = #game:GetService("Players"):GetPlayers()
							local tools = getToyMM2(amount)
							local char = plr.Character

							local human = glitchhumanoid(0.2)
							human:UnequipTools()
							local starttime = tick()

							local function waitForDying()
								human.Changed:Wait()
								if human.Health > 0 and not broken then
									waitForDying()
								end
							end

							waitForDying()

							if broken then return end

							local ret = false

							local murd = getMurder()
							local interactivePlayers = {murd}
							for _,v in ipairs(game:GetService("Players"):GetPlayers()) do
								if v ~= plr and v ~= murd and v.Character and v.Character.PrimaryPart then
									table.insert(interactivePlayers,v)
								end
							end

							local anim = char:FindFirstChild("Animate")
							if anim then
								anim.Disabled = true
							end

							local ra = char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm")
							local cf = ra and ra.CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)

							repeat
								for i,v in ipairs(tools) do
									local vi = interactivePlayers[1]
									if not vi then
										break
									end
									local vchar = vi.Character
									table.remove(interactivePlayers, 1)
									if vchar and vchar.PrimaryPart then
										local xcf = cf and cf:ToObjectSpace(vchar.PrimaryPart.CFrame):Inverse()
										if xcf then
											v.Grip = xcf
											v.Parent = bp
											v.Parent = char
										end
									end
								end
								task.wait(0.05)
							until human.Health > 0

							for i,v in ipairs(tools) do
								v.Parent = bp
							end

							if anim then
								anim.Disabled = false
							end

							task.spawn(function() Notification(nameH.."UI", "Successfly Glitched.", 5, 2) end)
						end
					end,
				},
				["Invisible"] = {
					["SourceText"] = "<option>; innertxt='Invisible'; cancelled='true';",
					["Runner"] = function()
						variables.stoppedmm2invisible = false
						if plr.Character and plr.Character.PrimaryPart then
							local cchar = plr.Character
							local function charAddedWait()
								local char = plr.CharacterAdded:Wait()
								if cchar == char then
									return charAddedWait()
								else
									cchar = char
									return char
								end
							end
							local function loop()
								local char = plr.Character
								if not char then return end
								fireGhost(true)
								task.spawn(function()
									repeat task.wait() until not char:FindFirstChild("Head") or char:FindFirstChild("Head").Transparency >= 1
									for i, v in ipairs(getDescendants(char)) do
										if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
											v.Transparency = 0.5
										elseif v:IsA("Decal") then
											v.Transparency = 0.5
										end
									end
								end)
								char = charAddedWait()
								task.wait()
								if variables.stoppedmm2invisible == true then
									return
								end
								local human = nil
								repeat
									task.wait()
									human = char:FindFirstChildOfClass("Humanoid")
								until human
								fireGhost(false)
								task.wait(0.1)
								human.Health = 0
								char = charAddedWait()
								repeat task.wait() until char.PrimaryPart
								if not variables.stoppedmm2invisible and not uiClosed then
									loop()
								end
							end
							loop()
						end
					end,
					["Stopper"] = function()
						variables.stoppedmm2invisible = true
						fireGhost(false)
					end,
				},
				["StealGunOld"] = {
					["SourceText"] = "<option>; innertxt='Steal Gun Old';",
					["Runner"] = function()
						variables.useoldmethodmm298 = true
					end,
					["Stopper"] = function()
						variables.useoldmethodmm298 = nil
					end,
				},
				["CrashPlayerFakeGun"] = {
					["SourceText"] = "<selector>; innertxt='Crash Player Fake Gun'; cancelled='true';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and target and target.Character and target.Character.PrimaryPart then
							local char = plr.Character
							local human = plr.Character:FindFirstChildOfClass("Humanoid");
							local guns = {}
							local enabled = {}
							for i = 1, 150 do
								task.spawn(function()
									fireFakeGun(true)
									table.insert(guns, char.ChildAdded:Wait())
								end)
							end
							repeat task.wait() until #guns >= 150
							task.wait(2)
							human:UnequipTools()
							local st = tick()
							repeat
								task.wait()
								char:SetPrimaryPartCFrame(CFrame.new(0, wspace.FallenPartsDestroyHeight + 5, 0))
							until tick() - st > 1
							repeat task.wait() until not char.PrimaryPart
							if not variables["fpds74"] then
								variables.fpds74 = wspace.FallenPartsDestroyHeight
							end
							for i, v in ipairs(plr:FindFirstChildOfClass("PlayerGui"):GetChildren()) do
								if v:IsA 'ScreenGui' then
									if v.Enabled then
										v.Enabled = false
										table.insert(enabled, v)
									end
								end
							end
							wspace.CurrentCamera.CameraSubject = target.Character
							for i, v in ipairs(guns) do
								if v:IsA("Tool") then
									local handle = v:FindFirstChild("Handle")
									v.Parent = char
									task.spawn(function()
										handle.Massless = true
										handle.CanCollide = false
										handle.Size = Vector3.new(8, 8, 8)

										handle.Velocity = Vector3.new()
										handle.CFrame = CFrame.new()

										for i, v in ipairs(v:GetChildren()) do
											if v ~= handle then
												v:Destroy()
											end
										end

										handle:ClearAllChildren()

										local BV = Instance.new("BodyVelocity")
										BV.Name = "EpixVel"
										BV.Parent = handle
										BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
										BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

										while task.wait() do
											handle.CFrame = target.Character.PrimaryPart.CFrame
											if plr.Character ~= char then
												break
											end
										end
									end)
								end
							end
							plr.CharacterAdded:Wait()
							for i, v in ipairs(enabled) do
								v.Enabled = true
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["SeeDeadChat"] = {
					["SourceText"] = "<option>; innertxt='See Dead Chat';",
					["Runner"] = function()
						local chatgui = plr.PlayerGui:FindFirstChild("Chat")
						local frame = chatgui and chatgui:FindFirstChild("Frame")
						local frame2 = chatgui and frame and frame:FindFirstChild("ChatChannelParentFrame")
						local logs = chatgui and frame and frame2 and frame2:FindFirstChild("Frame_MessageLogDisplay")
						local container = chatgui and frame and frame2 and logs and logs:FindFirstChild("Scroller")
						local offset = 0

						variables["broken31153"] = false

						if not container or variables["woking31153"] then
							return
						end

						variables["woking31153"] = true

						local frx = container:FindFirstChildOfClass("UIListLayout")
						frx.SortOrder = Enum.SortOrder.Name

						local function onNotification(name, msg)
							local msgframe = Instance.new("Frame")
							local label = Instance.new("TextLabel", msgframe)
							label.RichText = true
							local text = "<font color = 'rgb(178,178,178)'>" .. name .. "</font>" .. msg
							msgframe.Parent = container
							msgframe.BackgroundTransparency = 1
							msgframe.Size = UDim2.new(1, 0, 1, 0)
							label.BackgroundTransparency = 1
							label.TextColor3 = Color3.new(1, 1, 1)
							label.Text = text
							setFontFace(label, sourceSansExtraBold)
							label.TextStrokeTransparency = 0.75
							label.TextStrokeColor3 = Color3.new(0, 0, 0)
							label.TextSize = 20
							label.Size = UDim2.new(1, 0, 1, 0)
							label.Position = UDim2.new(0, 0, 0, 0)
							wait()
							label.TextWrapped = true
							wait()
							label.Position = UDim2.new(0, 0, 0, 0)
							label.Size = UDim2.new(0, label.TextBounds.X, 1, 0)
							msgframe.Size = UDim2.new(1, 0, 0, label.TextBounds.Y)
						end

						for i, v in ipairs(container:GetChildren()) do
							if v:IsA("Frame") and v:FindFirstChild("TextLabel") then
								local xoffset = v:FindFirstChild("TextLabel").Position.X.Offset
								if xoffset > offset then
									offset = xoffset
								end
							end
						end

						for i, v in pairs(game:GetService("Players"):GetPlayers()) do
							if v ~= plr then
								functions[#functions + 1] = {v.Chatted,
									function(msg)
										task.spawn(function()
											if not variables["broken31153"] and isPlayerDied(v) and not isPlayerDied(plr) then
												print("NewChat: ", "[" .. v.Name .. "]: ", msg)
												onNotification("[" .. v.Name .. "]: ", msg)
											end
										end)
									end
								}
							end
						end
					end,
					["Stopper"] = function()
						variables["broken31153"] = true
					end,
				},
				["LagServer"] = {
					["SourceText"] = "<option>; innertxt='Lag Server';",
					["Runner"] = function()
						if equipemm2 then
							variables.laggingserver = true
							repeat
								task.wait()
								task.spawn(function()
									for i = 1, 25 do
										task.spawn(function()
											equipemm2:FireServer("DefaultKnife", "Weapons")
										end)
										task.spawn(function()
											equipemm2:FireServer("Xbox", "Weapons")
										end)
										if not variables.laggingserver then
											break
										end
									end
								end)
							until not variables.laggingserver
						end
					end,
					["Stopper"] = function()
						variables.laggingserver = nil;
					end,
				},
				["LagServerFakeGun"] = {
					["SourceText"] = "<btn>; innertxt='Lag Server FakeGun'; cancelled='true';",
					["Runner"] = function()
						if equipemm2 and not variables.laggingserver then
							variables.laggingserver = true
							for i = 1, 150 do
								task.spawn(function()
									fireFakeGun(true)
								end)
							end
							variables.laggingserver = false
						end
					end,
				},
				["FakeGun"] = {
					["SourceText"] = "<option>; innertxt='Fake Gun'; cancelled='true';",
					["Runner"] = function()
						fireFakeGun(true)
					end,
					["Stopper"] = function()
						fireFakeGun(false)
					end,
				},
				["ESPGunDrop"] = {
					["SourceText"] = "<option>; innertxt='ESP GunDrop';",
					["Runner"] = function()
						variables.gundrop32esp = true

						if variables.gundrop32objects then
							for i, v in ipairs(variables.gundrop32objects) do
								pcall(function()
									if v:IsA("Highlight") then
										v.Enabled = false
									end
								end)
								if v:IsA("Frame") then
									v.Visible = true
								end
							end
							return
						end

						variables.gundrop32objects = {}

						local billboardgui = Instance.new("BillboardGui", coreui)
						billboardgui.AlwaysOnTop = true
						billboardgui.StudsOffset = Vector3.new(0, 1.5, 0)
						billboardgui.Size = UDim2.new(0, 10, 0, 10)

						local frame = Instance.new("Frame", billboardgui)
						frame.Size = UDim2.new(0, 10, 0, 10)
						frame.BackgroundColor3 = Color3.new(0, 1, 0.5)
						frame.BorderSizePixel = 0
						pcall(function() Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0) end)
						pcall(function() Instance.new("UIStroke", frame).Color = Color3.new(0.3, 0.3, 0.3) end)

						local highlight = nil

						pcall(function()
							highlight = Instance.new("Highlight", coreui)
							highlight.Name = "GunDropESP"
							highlight.OutlineColor = Color3.new(0, 1, 0.5)
							highlight.FillColor = Color3.new(0, 1, 0.5)
							highlight.FillTransparency = 0.5
							highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						end)

						table.insert(variables.gundrop32objects, highlight)
						table.insert(variables.gundrop32objects, frame)

						highlight.Enabled = false
						frame.Visible = false

						ongundrop(function(gundrop)
							highlight.Adornee = gundrop
							billboardgui.Adornee = gundrop

							if variables.gundrop32esp then
								highlight.Enabled = true
								frame.Visible = true
							end
						end)

						ongundropremoved(function(gundrop)
							if highlight then
								highlight.Adornee = nil
								highlight.Enabled = false
							end
							billboardgui.Adornee = nil
							frame.Visible = false
						end)

						if getgundrop() then
							task.spawn(function()
								local gundrop = getgundrop()
								if highlight then
									highlight.Adornee = gundrop
								end
								billboardgui.Adornee = gundrop

								if variables.gundrop32esp then
									if highlight then
										highlight.Enabled = true
									end
									frame.Visible = true
								end
							end)
						end
					end,
					["Stopper"] = function()
						variables.gundrop32esp = false

						if variables.gundrop32objects then
							for i, v in ipairs(variables.gundrop32objects) do
								pcall(function()
									if v:IsA("Highlight") then
										v.Enabled = false
									end
								end)
								if v:IsA("Frame") then
									v.Visible = false
								end
							end
						end
					end,
					["OnRemove"] = function()
						variables.gundrop32esp = nil

						if variables.gundrop32objects then
							for i, v in ipairs(variables.gundrop32objects) do
								if v.Parent then
									v:Destroy()
								end
							end
						end
					end
				},
				["TeleportToMap"] = {
					["SourceText"] = "<btn>; innertxt='Map';",
					["Runner"] = function()
						if plr.Character and plr.Character.PrimaryPart and wspace:FindFirstChild("Normal") then
							local spawns = wspace:FindFirstChild("Normal"):FindFirstChild("Spawns")
							if spawns then
								local _spawn = spawns:GetChildren()[math.random(1, #spawns:GetChildren())]
								if _spawn:IsA("BasePart") then
									plr.Character:SetPrimaryPartCFrame(_spawn.CFrame + Vector3.new(0, 5, 0))
								else
									plr.Character:SetPrimaryPartCFrame(spawns:WaitForChild("Spawn").CFrame + Vector3.new(0, 5, 0))
								end
							end
						end
					end,
				},
				["TeleportToAboveMap"] = {
					["SourceText"] = "<btn>; innertxt='Above Map';",
					["Runner"] = function()
						if plr.Character and plr.Character.PrimaryPart and wspace:FindFirstChild("Normal") then
							local spawns = wspace:FindFirstChild("Normal"):FindFirstChild("Spawns")
							if spawns then
								local _spawn = spawns:GetChildren()[math.random(1, #spawns:GetChildren())]
								local center = nil

								if _spawn:IsA("BasePart") then
									center = _spawn.Position
								else
									center = spawns:WaitForChild("Spawn").Position
								end

								local ray = wspace:Raycast(center + Vector3.new(0, 500, 0), Vector3.new(0, -500, 0))
								if ray then
									local aboveposition = ray.Position + Vector3.new(0, 5, 0)
									plr.Character:SetPrimaryPartCFrame(CFrame.new(aboveposition))
								end
							end
						end
					end,
				},
				["TeleportToLobby"] = {
					["SourceText"] = "<btn>; innertxt='Lobby';",
					["Runner"] = function()
						if plr.Character and plr.Character.PrimaryPart and wspace:FindFirstChild("Lobby") then
							local spawns = wspace:FindFirstChild("Lobby"):FindFirstChild("Spawns")
							if spawns then
								local _spawn = spawns:GetChildren()[math.random(1, #spawns:GetChildren())]
								if _spawn:IsA("BasePart") then
									plr.Character:SetPrimaryPartCFrame(_spawn.CFrame + Vector3.new(0, 5, 0))
								else
									plr.Character:SetPrimaryPartCFrame(spawns:WaitForChild("Spawn").CFrame + Vector3.new(0, 5, 0))
								end
							end
						end
					end,
				},
				["ShootTargetWithSheriffGun"] = {
					["SourceText"] = "<keybind>; innertxt='Shoot Target'; currentKey='0x66'; statevariable:'sp34mm2possibility'; placeid='142823291'",
					["Runner"] = function(selectedN)
						local target = variables["targetcharacter32"]
						targetshot(target)
					end,
					["CheckState"] = function(f)
						local function checkGunParent(gun)
							if gun.Parent.ClassName == "Backpack" and gun.Parent.Parent ~= plr then
								return false
							else
								return true
							end
						end

						local function checkGunState(gun)
							if not gun then
								variables["bg34mm2possibility"] = false
								pcall(f)
								return
							end

							while task.wait() do
								if not gun:IsDescendantOf(game) then
									variables["sp34mm2possibility"] = false
									pcall(f)
									break
								else
									local success, isavailable = pcall(function() return isGunAvailable(gun) end)
									if success and isavailable and not getGunHasBrokenTag(gun) and checkGunParent(gun) then
										variables["sp34mm2possibility"] = true
									else
										variables["sp34mm2possibility"] = false
									end
									pcall(f)
								end
							end
						end

						onSheriffGunChanged(checkGunState)
					end
				},
				["ApplyTarget"] = {
					["SourceText"] = "<selector>; innertxt='Apply Target';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						variables.targetcharacter32 = target
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["KickPlayer"] = {
					["SourceText"] = "<selector>; innertxt='Kick Player'; statevariable:'kick34mm2possibility'",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end

						local normal = wspace:FindFirstChild("Normal")
						local coincontainer = normal and normal:FindFirstChild("CoinContainer")

						if not variables["kick34mm2possibility"] then
							Notification(nameH .. "UI", "Current Kick Player Possibility is No.", 2, 3)
							return
						end

						if coincontainer and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character.PrimaryPart and target and target.Character and target.Character.PrimaryPart and target.Character:FindFirstChildOfClass("Humanoid") then
							if isPlayerDied(target) then
								Notification(nameH .. "UI", "Target is Dead.", 2, 3)
								return
							end

							local char = plr.Character
							local human = char:FindFirstChildOfClass("Humanoid")
							local root = char.PrimaryPart
							local ocf = root.CFrame

							local tchar = target.Character
							local humant = tchar:FindFirstChildOfClass("Humanoid")
							local troot = tchar.PrimaryPart

							local currentdir = nil

							disablechartouch(char)

							local function iscoinremoved(coin)
								if not coin.Parent or not coin:IsA("BasePart") then
									return true
								end
								if coin:FindFirstChild("CoinVisual") then
									if coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin") then
										return (coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin").Transparency ~= 0 and true) or
											false
									elseif coin:FindFirstChild("CoinVisual").Transparency ~= 0 then
										return true
									end
								else
									return true
								end
								return false
							end

							local function findnewintersectablecoin()
								local found = nil
								local params = nil
								local success = false

								if pcall(function()
										params = RaycastParams.new()
										params.FilterType = Enum.RaycastFilterType.Exclude
									end) then
									success = true
								end

								if success then
									local blist = {unpack(coincontainer:GetChildren()), unpack(getDescendants(char)), unpack(
										getDescendants(tchar))}

									for i, v in ipairs(coincontainer:GetChildren()) do
										if not iscoinremoved(v) then
											local xblist = table.clone(blist)
											table.remove(xblist, table_find(xblist, v))
											params.FilterDescendantsInstances = xblist
											local dir = (v.Position - troot.Position).Unit
											local ray = wspace:Raycast(troot.Position, dir * 1000, params)
											if ray and ray.Instance:IsDescendantOf(coincontainer) then
												found = v
												currentdir = dir
												break
											end
										end
									end

									return found
								end
							end

							variables.kickinprogressmm2 = true
							local timestart = tick()
							local maxtimeout = 100

							local BV = Instance.new("BodyVelocity")
							BV.Name = "NoobVel"
							BV.Parent = root
							local size1 = 250
							local size2 = 10
							BV.Velocity = Vector3.new(size1, size1, size1)
							BV.MaxForce = Vector3.new(size2, size2, size2)

							local currentdist = 0
							local lastdirtimeout = tick()

							local function getmovep(a, b)
								return (calculateMovePoint(a, b) / 1.25) * ((math.random(0, 20) / 10))
							end

							local function checkbreak()
								if not variables["kick34mm2possibility"] or char ~= plr.Character or not human.Parent or human.Health <= 0 or not char.PrimaryPart or not tchar.Parent or target.Character ~= tchar or not humant.Parent or humant.Health <= 0 or not tchar.PrimaryPart or (tick() - timestart) > maxtimeout then
									return true
								end
								return false
							end

							while task.wait() do
								if checkbreak() then
									break
								end

								local xvel = nil
								local xcf = nil

								if not currentdir then
									if not findnewintersectablecoin() then
										xvel = Vector3.new(size2, size2, size2)
										xcf = tchar.PrimaryPart.CFrame + getmovep(humant, troot)
									else
										currentdist = 0
									end
								end

								root.Velocity = xvel or currentdir * size2
								root.RotVelocity = Vector3.new(size1, size1, size1)

								local cf = xcf or
									tchar.PrimaryPart.CFrame + getmovep(humant, troot) - (currentdir * 2.5) + currentdir * (currentdist / 50)
								char:SetPrimaryPartCFrame(cf)
								currentdist = currentdist + 5

								if tick() - lastdirtimeout > 2 then
									lastdirtimeout = tick()
									currentdir = nil
									currentdist = 0
								end

								if currentdist > 250 then
									currentdist = 0
								end
							end

							BV:Destroy()
							root.Velocity = Vector3.new(0, 0, 0)
							root.RotVelocity = Vector3.new(0, 0, 0)

							char:SetPrimaryPartCFrame(ocf)

							enablechartouch(char)
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
					["OnRemove"] = function(uiobject)
						variables["kick34mm2possibility"] = false
					end,
					["CheckState"] = function(f)
						local function checkKickPossibility()
							local normal = wspace:FindFirstChild("Normal")
							local coincontainer = normal and normal:FindFirstChild("CoinContainer")

							if coincontainer then
								local function iscoinremoved(coin)
									if not coin.Parent or not coin:IsA("BasePart") then
										return true
									end
									if coin:FindFirstChild("CoinVisual") then
										if coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin") then
											return (coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin").Transparency ~= 0 and true) or
												false
										elseif coin:FindFirstChild("CoinVisual").Transparency ~= 0 then
											return true
										end
									else
										return true
									end
									return false
								end

								local function findnewcoin()
									local found = nil
									for i, v in ipairs(coincontainer:GetChildren()) do
										if not iscoinremoved(v) then
											found = v
											break
										end
									end
									return found
								end

								local samplecoin = findnewcoin()

								if samplecoin then
									variables["kick34mm2possibility"] = true
								else
									variables["kick34mm2possibility"] = false
									if #coincontainer:GetChildren() > 1 then
										wspace.ChildAdded:Wait()
									else
										coincontainer.ChildAdded:Wait()
									end
								end
							else
								if not normal then
									wspace.ChildAdded:Wait()
								end
							end

							task.spawn(f)
						end

						while task.wait() do
							pcall(checkKickPossibility)
						end
					end
				},
				["AutoKickFlinger"] = {
					["SourceText"] = "<option>; innertxt='Auto Kick Flinger';",
					["Runner"] = function()
						local id = math.random(1, 10000)
						variables.autokickflinger = id
						variables.autokickflingerbuffer = {}
						variables.kickingFlingers = {}

						local function isThereAnyFlinger()
							local exits = nil

							for i, v in ipairs(variables.kickingFlingers) do
								if v[1].Character == v[2] and v[1] and v[1].Parent then
									exits = true
									break
								else
									table.remove(variables.kickingFlingers,i)
								end
							end

							return exits
						end

						local waitingforkick = nil

						local function kickFlingers(objectSpace)
							waitingforkick = true
							local char = plr.Character
							local ocf = char.PrimaryPart.CFrame
							local timestart = tick()

							local normal = wspace:FindFirstChild("Normal")
							local coincontainer = normal and normal:FindFirstChild("CoinContainer")

							if coincontainer then
								local function iscoinremoved(coin)
									if not coin.Parent or not coin:IsA("BasePart") then
										return true
									end
									if coin:FindFirstChild("CoinVisual") then
										if coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin") then
											return (coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin").Transparency ~= 0 and true) or
												false
										elseif coin:FindFirstChild("CoinVisual").Transparency ~= 0 then
											return true
										end
									else
										return true
									end
									return false
								end

								local function findnewcoin()
									local found = nil
									local t = coincontainer:GetChildren()
									for i = 1, #coincontainer:GetChildren() do
										local ri = math.random(1, #t)
										local v = t[ri]
										table.remove(t, ri)

										if not iscoinremoved(v) then
											found = v
											break
										end
									end
									return found
								end

								repeat
									local timestartx = tick()
									local coin = findnewcoin()
									local newcf = coin.CFrame:ToWorldSpace(objectSpace)
									repeat
										task.wait(0.1)
										disablechartouch(char)
										char:SetPrimaryPartCFrame(newcf)
									until tick() - timestartx > 0.5 or iscoinremoved(coin)
									if not coin then
										break
									end
								until tick() - timestart > 10 or not isThereAnyFlinger()
							end

							if tick() - timestart <= 10 then
								task.spawn(function() Notification(nameH .. "UI", "Flinger got kicked!", 2, 2) end)
							end

							char:SetPrimaryPartCFrame(ocf)
							wait()
							enablechartouch(char)
							waitingforkick = false
						end

						local function blockchar(target,char)
							variables.autokickflingerbuffer[target.Name] = nil
							local c
							c = game:GetService("RunService").Stepped:Connect(function()
								if variables.autokickflinger ~= id or uiClosed or not char.Parent then
									c:Disconnect()
									return
								end

								if char.PrimaryPart and plr.Character and plr.Character.PrimaryPart then
									if variables.autokickflingerbuffer[target.Name] then
										local lastdist = (variables.autokickflingerbuffer[target.Name] - char.PrimaryPart.Position).Magnitude
										if lastdist > 10 then
											local chardist = (plr.Character.PrimaryPart.Position - char.PrimaryPart.Position).Magnitude
											if chardist < 10 and not waitingforkick then
												task.spawn(function() Notification(nameH .. "UI", "Fling Detection: @" .. target.Name .. " tried to fling you. Kick Flinger in progress...", 3, 1) end)
												local objectSpace = char.PrimaryPart.CFrame:ToObjectSpace(plr.Character.PrimaryPart.CFrame)
												table.insert(variables.kickingFlingers,{target,char})
												task.spawn(function() kickFlingers(objectSpace) end)
											end
										end
									end
									variables.autokickflingerbuffer[target.Name] = char.PrimaryPart.Position
								end
							end)
						end

						local function blockplr(v)
							if v == plr then
								return
							end
							if v.Character then
								task.spawn(function() blockchar(v,v.Character) end)
							end
							local c
							c = v.CharacterAdded:Connect(function(char)
								if variables.autokickflinger ~= id or uiClosed then
									c:Disconnect()
									return
								end
								task.wait(2.5)
								blockchar(v,char)
							end)
						end

						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							blockplr(v)
						end

						local c
						c = game:GetService("Players").PlayerAdded:Connect(function(v)
							if variables.autokickflinger ~= id or uiClosed then
								c:Disconnect()
								return
							end
							blockplr(v)
						end)
					end,
					["Stopper"] = function()
						variables.autokickflinger = nil
					end,
					["OnRemove"] = function()
						variables.autokickflinger = nil
					end,
				},
				["KickFlinger"] = {
					["SourceText"] = "<selector>; innertxt='Kick Flinger';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end

						if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character.PrimaryPart and target and target.Character and target.Character.PrimaryPart and target.Character:FindFirstChildOfClass("Humanoid") then
							local char = plr.Character
							local human = char:FindFirstChildOfClass("Humanoid")
							local root = char.PrimaryPart
							local ocf = root.CFrame

							local tchar = target.Character
							local humant = tchar:FindFirstChildOfClass("Humanoid")
							local troot = tchar.PrimaryPart

							local space = troot.CFrame:ToObjectSpace(root.CFrame)
							local timestart = tick()

							local normal = wspace:FindFirstChild("Normal")
							local coincontainer = normal and normal:FindFirstChild("CoinContainer")

							if (root.Position - troot.Position).Magnitude > 20 then
								Notification(nameH .. "UI", "An error occurred.", 2, 3)
								return
							end

							if coincontainer then
								local function iscoinremoved(coin)
									if not coin.Parent or not coin:IsA("BasePart") then
										return true
									end
									if coin:FindFirstChild("CoinVisual") then
										if coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin") then
											return (coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin").Transparency ~= 0 and true) or
												false
										elseif coin:FindFirstChild("CoinVisual").Transparency ~= 0 then
											return true
										end
									else
										return true
									end
									return false
								end

								local function findnewcoin()
									local found = nil
									local t = coincontainer:GetChildren()
									for i = 1, #coincontainer:GetChildren() do
										local ri = math.random(1, #t)
										local v = t[ri]
										table.remove(t, ri)

										if not iscoinremoved(v) then
											found = v
											break
										end
									end
									return found
								end

								repeat
									local timestartx = tick()
									local coin = findnewcoin()
									local newcf = coin.CFrame:ToWorldSpace(space)
									repeat
										task.wait(0.1)
										disablechartouch(char)
										char:SetPrimaryPartCFrame(newcf)
									until tick() - timestartx > 0.5 or iscoinremoved(coin)
									if not coin then
										break
									end
								until tick() - timestart > 10 or target.Character ~= tchar or not target or not target.Parent
							end

							char:SetPrimaryPartCFrame(ocf)
							wait()
							enablechartouch(char)
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["BreakGun"] = {
					["SourceText"] = "<btn>; innertxt='Break Gun'; statevariable:'bg34mm2possibility'",
					["Runner"] = function()
						breakSheriffGun(true)
					end,
					["CheckState"] = function(f)
						local function checkGunState(gun)
							if not gun then
								variables["bg34mm2possibility"] = false
								pcall(f)
								return
							end

							while task.wait() do
								if not gun:IsDescendantOf(game) then
									variables["bg34mm2possibility"] = false
									pcall(f)
									break
								else
									local success, isavailable = pcall(function() return isGunAvailable(gun) end)
									if success and isavailable and not getGunHasBrokenTag(gun) then
										variables["bg34mm2possibility"] = true
									else
										variables["bg34mm2possibility"] = false
									end
									pcall(f)
								end
							end
						end

						onSheriffGunChanged(checkGunState)
					end
				},
				["StealGun"] = {
					["SourceText"] = "<btn>; innertxt='Steal Gun'; statevariable:'gg34mm2possibility'",
					["Runner"] = function()
						grabgun(true)
					end,
					["CheckState"] = function(f)
						if getgundrop() then
							variables["gg34mm2possibility"] = true
							f()
						end
						ongundrop(function()
							variables["gg34mm2possibility"] = true
							f()
						end)
						ongundropremoved(function()
							variables["gg34mm2possibility"] = false
							f()
						end)
					end
				},
				["AutoFarm"] = {
					["SourceText"] = "<option>; innertxt='Auto Farm';",
					["Runner"] = function()
						variables.autofarmmm2 = true
						local first = true
						local lastbroken = false
						while variables.autofarmmm2 do
							local normal = wspace:FindFirstChild("Normal")
							local coincontainer = normal and normal:FindFirstChild("CoinContainer")
							if coincontainer then
								local char = plr.Character
								local function iscoinremoved(coin)
									if not coin.Parent or not variables.autofarmmm2 then
										return true
									end
									if coin:FindFirstChild("CoinVisual") then
										if coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin") then
											return (coin:FindFirstChild("CoinVisual"):FindFirstChild("MainCoin").Transparency ~= 0 and true) or
												false
										elseif coin:FindFirstChild("CoinVisual").Transparency ~= 0 then
											return true
										end
									else
										return true
									end
									return false
								end
								if char and char.PrimaryPart and wspace:FindFirstChild("Lobby") then
									local foundacoin = false
									if not first then
										for i, v in ipairs(coincontainer:GetChildren()) do
											if v.Name == "Coin_Server" and v:FindFirstChild("CoinVisual") and not iscoinremoved(v) then
												repeat
													char:SetPrimaryPartCFrame(v.CFrame)
													task.wait(0.1)
												until iscoinremoved(v) or char ~= plr.Character or not char.PrimaryPart
												foundacoin = true
												break
											end
										end
									else
										first = false
									end

									if foundacoin then
										lastbroken = false
										local spawns = wspace:FindFirstChild("Lobby"):FindFirstChild("Spawns")
										if spawns and char == plr.Character and char.PrimaryPart then
											local _spawn = spawns:GetChildren()[math.random(1, #spawns:GetChildren())]
											if _spawn:IsA("BasePart") then
												char:SetPrimaryPartCFrame(_spawn.CFrame + Vector3.new(0, 5, 0))
											else
												char:SetPrimaryPartCFrame(spawns:WaitForChild("Spawn").CFrame + Vector3.new(0, 5, 0))
											end
											task.wait(2)
										end
									elseif not lastbroken then
										lastbroken = true

										if char.PrimaryPart and wspace:FindFirstChild("Normal") then
											local spawns = wspace:FindFirstChild("Normal"):FindFirstChild("Spawns")
											if spawns then
												local _spawn = spawns:GetChildren()[math.random(1, #spawns:GetChildren())]
												if _spawn:IsA("BasePart") then
													char:SetPrimaryPartCFrame(_spawn.CFrame + Vector3.new(0, 5, 0))
												else
													char:SetPrimaryPartCFrame(spawns:WaitForChild("Spawn").CFrame + Vector3.new(0, 5, 0))
												end
											end
										end
									end
								end
							else
								first = true
							end
							task.wait()
						end
					end,
					["Stopper"] = function()
						variables.autofarmmm2 = nil
					end,
					["OnRemove"] = function()
						variables.autofarmmm2 = nil
					end
				},
				["AutoStealGun"] = {
					["SourceText"] = "<option>; innertxt='Auto Steal Gun'; dontsavethis='true';",
					["Runner"] = function()
						grabgun()

						variables.autograbgunmm2 = ongundrop(function()
							if variables.autograbgunmm2 then
								grabgun()
							end
						end)
					end,
					["StopSignal"] = function(stopper)
						local lastmurder = nil

						addtocolorfunctions(function()
							local murder = getMurder()
							if not murder and lastmurder then
								lastmurder = nil
								stopper()
							elseif murder and not lastmurder then
								lastmurder = murder
							elseif murder and lastmurder ~= murder then
								lastmurder = murder
								stopper()
							end
						end)
					end,
					["Stopper"] = function()
						if variables.autograbgunmm2 then
							variables.autograbgunmm2:Disconnect()
						end
					end,
					["OnRemove"] = function()
						if variables.autograbgunmm2 then
							variables.autograbgunmm2:Disconnect()
						end
					end
				},
				["AutoBreakGun"] = {
					["SourceText"] = "<option>; innertxt='Auto Break Gun'; dontsavethis='true';",
					["Runner"] = function()
						variables.autobreakgunmm3 = true
						variables.autobreakgunmm2 = onSheriffGunChanged(function(gun)
							if not gun then
								return
							end

							while not uiClosed do
								local knife, murder = getMurderKnife()
								local _, sheriff = getSheriffGun()

								if not gun.Parent or not variables.autobreakgunmm3 then
									break
								end

								if gun and knife and murder and sheriff ~= plr and not getGunHasBrokenTag(gun) then
									local exitcode = pcall(breakSheriffGun)
									if exitcode ~= 1 then
										break
									end
								end

								task.wait()
							end
						end)
					end,
					["StopSignal"] = function(stopper)
						local lastmurder = nil

						addtocolorfunctions(function()
							local murder = getMurder()
							if not murder and lastmurder then
								lastmurder = nil
								stopper()
							elseif murder and not lastmurder then
								lastmurder = murder
							elseif murder and lastmurder ~= murder then
								lastmurder = murder
								stopper()
							end
						end)
					end,
					["OnRemove"] = function()
						if variables.autobreakgunmm2 then
							variables.autobreakgunmm2:Disconnect()
						end
						variables.autobreakgunmm3 = nil
					end,
					["Stopper"] = function()
						if variables.autobreakgunmm2 then
							variables.autobreakgunmm2:Disconnect()
						end
						variables.autobreakgunmm3 = nil
					end,
				},
				["ControlSheriffGun"] = {
					["SourceText"] = "<option>; innertxt='Control Sheriff Gun';",
					["Runner"] = function()
						if variables.csgmm2345 == false then
							variables.csgmm2345 = true
							return
						end
						variables.csgmm2345 = true
						onTouched(function(pos)
							if not variables.csgmm2345 then
								return
							end
							local gpos = getCursorPoint()
							if pos then
								gpos = pos
							end
							local ray = getMouseRay()
							if ray then
								local gun = getSheriffGun()
								task.spawn(function()
									shootGun(gun, ray.Position)
								end)
							end
						end)
					end,
					["Stopper"] = function()
						variables.csgmm2345 = false
					end,
				},
				["SabotageMurder"] = {
					["SourceText"] = "<option>; innertxt='Sabotage Murder';",
					["Runner"] = function()
						variables.sabotagemmm2 = true
						while variables.sabotagemmm2 do
							fireStab()
							task.wait(0.1)
						end
					end,
					["Stopper"] = function()
						variables.sabotagemmm2 = false
					end,
				},
				["Allocate"] = {
					["SourceText"] = "<option>; innertxt='Allocate Sheriff Gun';",
					["Runner"] = function()
						task.spawn(function()
							allocateSheriffGun()
						end)
						variables["allocatefunction32"] = onSheriffGunChanged(allocateSheriffGun)
					end,
					["Stopper"] = function()
						if variables["allocatefunction32"] then
							variables["allocatefunction32"]:Disconnect()
							variables["allocatefunction32"] = nil
						end
					end,
				},
				["ShootMurder"] = {
					["SourceText"] = "<btn>; innertxt='Shoot Murder';",
					["Runner"] = function()
						if variables.autoshotm ~= true then
							variables.autoshotm = 1
						end
						pcall(shotmurder)
						if variables.autoshotm ~= true then
							variables.autoshotm = nil
						end
					end,
				},
				["AutoShootMurder"] = {
					["SourceText"] = "<option>; innertxt='Auto Shoot Murder'; dontsavethis='true';",
					["Runner"] = function()
						variables.autoshotmm2 = true
						variables.autoshotm = onSheriffGunChanged(function(gun)
							if not gun then
								return
							end

							while not uiClosed do
								if not gun.Parent or not variables.autoshotmm2 or getGunHasBrokenTag(gun) then
									break
								end

								if gun.Parent.ClassName == "Backpack" and gun.Parent.Parent ~= plr then
									gun.Changed:Wait()
								else

									if gun.Parent == plr.Character or gun.Parent.Parent == plr then
										task.wait(0.2)
									end
									pcall(shotmurder)
								end

								task.wait()
							end
						end)
					end,
					["Stopper"] = function()
						if variables.autoshotm then
							variables.autoshotm:Disconnect()
						end
						variables.autoshotmm2 = nil
					end,
					["StopSignal"] = function(stopper)
						local lastmurder = nil

						addtocolorfunctions(function()
							local murder = getMurder()
							if not murder and lastmurder then
								lastmurder = nil
								stopper()
							elseif murder and not lastmurder then
								lastmurder = murder
							elseif murder and lastmurder ~= murder then
								lastmurder = murder
								stopper()
							end
						end)
					end,
					["OnRemove"] = function()
						if variables.autoshotm then
							variables.autoshotm:Disconnect()
						end
						variables.autoshotmm2 = nil
					end
				},
				["PlayEmote"] = {
					["SourceText"] = "<selector>; innertxt='Play Emote';",
					["Runner"] = function(selectedN)
						local char = plr.Character
						local human = char and char:FindFirstChildOfClass("Humanoid")
						local animate = char:FindFirstChild("Animate")

						if not human then
							return
						end

						local syncM = game:GetService("ReplicatedStorage"):FindFirstChild("Database") and
							game:GetService("ReplicatedStorage"):FindFirstChild("Database"):FindFirstChild("Sync") and
							game:GetService("ReplicatedStorage"):FindFirstChild("Database"):FindFirstChild("Sync"):FindFirstChild("Emotes")
						local currentAnim = nil

						local function playAnimation(animid,looped,speed,weight)
							if animid then
								for _,v in ipairs(human:GetPlayingAnimationTracks()) do
									v:Stop()
								end

								local animation = Instance.new("Animation")
								animation.AnimationId = animid

								if currentAnim ~= nil then
									currentAnim:Stop()
									currentAnim = nil
								end

								currentAnim = human:LoadAnimation(animation)
								currentAnim.Priority = Enum.AnimationPriority.Core
								currentAnim.Looped = looped
								currentAnim:Play()

								local localAnim = currentAnim

								if speed then
									currentAnim:AdjustSpeed(speed)
								end
								if weight then
									currentAnim:AdjustWeight(weight)
								end

								if not looped then
									task.spawn(function()
										if currentAnim == localAnim then
											currentAnim.Ended:Wait()

											if animate then
												animate.Disabled = true
												for _,v in ipairs(human:GetPlayingAnimationTracks()) do
													v:Stop()
												end
												animate.Disabled = false
											end
										end
									end)
								end
							end
						end

						if syncM and syncM:IsA("ModuleScript") then
							local req = require(syncM)
							local index = req[selectedN]
							if index then
								if index.AnimationID then
									playAnimation("rbxassetid://"..index.AnimationID,index.Loop)
								else
									if split(selectedN,"1")[2] == "" then
										selectedN = string.gsub(selectedN,"1","")
									end
									local xanim = animate:FindFirstChild(selectedN)
									if animate and animate:IsA("LocalScript") then
										local lanim = xanim and xanim:FindFirstChildOfClass("Animation")
										if lanim then
											playAnimation(lanim.AnimationId,index.Loop,1,10)
										end
									end
								end
							end
						end

						functions[#functions + 1] = {human.AnimationPlayed,
							function()
								if currentAnim ~= nil then
									currentAnim:Stop()
									currentAnim = nil
								end
							end
						}
					end,
					["SelectorRunner"] = function(uiobject)
						local function updatelist()
							local sz = 0
							for i, v in ipairs(uiobject:GetChildren()) do
								if v:IsA 'TextButton' and v.Name ~= "Hover" then
									sz = sz + 1
								end
							end
							uiobject.CanvasSize = UDim2.new(0, 0, 0, optionsizey * sz + (selectorpadding * (sz - 1)))
						end

						local function addtolist(v)
							if typeof(v) == "string" then
								local button = prepareoption(uiobject, v, whitew)
								updatelist()
								return
							end
						end

						local syncM = nil

						repeat
							task.wait()
							syncM = game:GetService("ReplicatedStorage"):FindFirstChild("Database") and
								game:GetService("ReplicatedStorage"):FindFirstChild("Database"):FindFirstChild("Sync") and
								game:GetService("ReplicatedStorage"):FindFirstChild("Database"):FindFirstChild("Sync"):FindFirstChild(
							"Emotes")
						until syncM

						if syncM and syncM:IsA("ModuleScript") then
							local req = nil
							repeat
								task.wait()
								req = require(syncM)
							until req
							for i, _ in pairs(req) do
								addtolist(i)
							end
						end
					end,
				},
				["TrapPlayer"] = {
					["SourceText"] = "<selector>; innertxt='Trap Player'; cancelled='true';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if target and target.Character and target.Character.PrimaryPart then
							fireTrap(target.Character.PrimaryPart.CFrame - Vector3.new(0, 2.5, 0))
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["TrapAll"] = {
					["SourceText"] = "<btn>; innertxt='Trap All'; cancelled='true';",
					["Runner"] = function()
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v ~= plr then
								if v and v.Character and v.Character.PrimaryPart then
									task.spawn(function()
										fireTrap(v.Character.PrimaryPart.CFrame - Vector3.new(0, 2.5, 0))
									end)
								end
							end
						end
					end,
				},
				["AutoDodgeKnife"] = {
					["SourceText"] = "<option>; innertxt='Auto Dodge Knife';",
					["Runner"] = function()
						variables.autododgemm2 = true
						while variables.autododgemm2 do
							local knife, murder = getMurderKnife()
							local tchar = murder and murder.Character
							local humant = tchar and tchar:FindFirstChildOfClass("Humanoid")
							if knife and humant and murder ~= plr then
								local handle = knife:FindFirstChild("Handle")
								if handle then
									local part = Instance.new("Part", knife)
									part.Name = "DodgeHitbox"
									part.Transparency = 1
									part.Massless = true
									part.Shape = Enum.PartType.Ball
									part.Anchored = true
									part.CanTouch = false
									setAttribute(part, "KnownPart", true)
									while variables.autododgemm2 do
										if not knife.Parent then
											break
										end
										local ping = murder:GetNetworkPing() + plr:GetNetworkPing() + 2.5
										local hitboxsize = (humant.WalkSpeed * ping)
										part.Size = Vector3.new(hitboxsize, hitboxsize, hitboxsize) + handle.Size
										part.CFrame = handle.CFrame
										task.wait()
									end
									part:Destroy()
								end
							end
							task.wait()
						end
					end,
					["OnRemove"] = function()
						variables.autododgemm2 = nil
					end,
					["Stopper"] = function()
						variables.autododgemm2 = nil
					end,
				},
			},
			["Murder Section"] = {
				["KillPlayer"] = {
					["SourceText"] = "<selector>; innertxt='Kill';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game.Players:GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						if target and target.Character and plr.Character then
							local animate = plr.Character:FindFirstChild("Animate")
							local knife = plr.Character:FindFirstChild("Knife") or plr:FindFirstChildOfClass("Backpack"):FindFirstChild("Knife")
							if knife and target.Character:FindFirstChildOfClass("Humanoid") then
								local ogrip = knife.Grip
								if ogrip == CFrame.new(Vector3.new(0, 50, 0)) then
									ogrip = CFrame.new(Vector3.new(0, 0, 0))
								end
								knife.Grip = CFrame.new(Vector3.new(0, 50, 0))
								animate.Disabled = true
								knife.Parent = plr:FindFirstChildOfClass("Backpack")
								knife.Parent = plr.Character
								local ra = target.Character:FindFirstChild("Right Arm") or target.Character:FindFirstChild("RightHand")
								if ra then
									ra:BreakJoints()
									ra.Transparency = 1
									ra.CFrame = knife.Handle.CFrame
								end
								fireStab()
								task.wait(0.35)
								for i = 1, 5 do
									fireStab()
									wait()
								end
								if plr.Character then
									animate.Disabled = false
								end
								if knife then
									knife.Grip = ogrip
									knife.Parent = plr:FindFirstChildOfClass("Backpack")
								end
								local human = plr.Character:FindFirstChildOfClass("Humanoid")
								if human then
									for i, v in ipairs(human:GetPlayingAnimationTracks()) do
										v:Stop()
									end
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["KillAll"] = {
					["SourceText"] = "<btn>; innertxt='Kill All';",
					["Runner"] = function()
						if not plr.Character then
							return
						end
						local knife = plr.Character:FindFirstChild("Knife") or plr:FindFirstChildOfClass("Backpack"):FindFirstChild("Knife")
						if not knife then
							return
						end
						local animate = plr.Character:FindFirstChild("Animate")
						local ogrip = knife.Grip
						if ogrip == CFrame.new(Vector3.new(0, 50, 0)) then
							ogrip = CFrame.new(Vector3.new(0, 0, 0))
						end
						knife.Parent = plr:FindFirstChildOfClass("Backpack")
						knife.Grip = CFrame.new(Vector3.new(0, 50, 0))

						animate.Disabled = true
						knife.Parent = plr.Character
						for i, v in ipairs(game.Players:GetPlayers()) do
							if v.Character and plr.Character and v ~= plr and not isPlayerDied(v) then
								if knife and knife:FindFirstChild("Handle") then
									local ra = v.Character:FindFirstChild("Right Arm") or v.Character:FindFirstChild("RightHand")
									if ra then
										ra:BreakJoints()
										ra.Transparency = 1
										ra.CFrame = knife.Handle.CFrame
									end
								end
							end
						end
						fireStab()
						task.wait(0.35)
						for i = 1, 5 do
							fireStab()
							wait()
						end
						if plr.Character then
							animate.Disabled = false
						end
						if knife then
							knife.Grip = ogrip
							knife.Parent = plr:FindFirstChildOfClass("Backpack")
						end

						local human = plr.Character:FindFirstChildOfClass("Humanoid")
						if human then
							for i, v in ipairs(human:GetPlayingAnimationTracks()) do
								v:Stop()
							end
						end
					end,
				},
			},
			["Spray Paint Section"] = {
				["ResetPlayer"] = {
					["ID"] = 1,
					["SourceText"] = "<selector>; innertxt='Reset Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game.Players:GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						if target and target.Character and plr.Character then

						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["NoSprayPaintCooldown"] = {
					["ID"] = 7,
					["SourceText"] = "<option>; innertxt='No Spray-Paint Cooldown';",
					["Runner"] = function()

					end,
					["Stopper"] = function()

					end,
				},
				["ResetAll"] = {
					["ID"] = 2,
					["SourceText"] = "<btn>; innertxt='Reset All';",
					["Runner"] = function()

					end,
				},
				["LoopResetAll"] = {
					["ID"] = 3,
					["SourceText"] = "<option>; innertxt='Loop Reset All';",
					["Runner"] = function()

					end,
					["Stopper"] = function()

					end,
				},
				["GlitchAll"] = {
					["ID"] = 6,
					["SourceText"] = "<option>; innertxt='Glitch All';",
					["Runner"] = function()

					end,
					["Stopper"] = function()

					end,
				},
				["GlitchPlayer"] = {
					["ID"] = 4,
					["SourceText"] = "<selector>; innertxt='Glitch Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game.Players:GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						if target and target.Character and plr.Character then

						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["StopGlitchPlayer"] = {
					["ID"] = 5,
					["SourceText"] = "<btn>; innertxt='Stop Glitch Player';",
					["Runner"] = function()

					end,
				},
				["JailPlayer"] = {
					["ID"] = 9,
					["SourceText"] = "<selector>; innertxt='Jail Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game.Players:GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						if target and target.Character and plr.Character then

						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["Spray-Paint Size"] = {
					["ID"] = 8,
					["SourceText"] = "<rangeval>; innertxt='Spray-Paint Size';maxrange='100';minrange='0.2';currentrange='3';",
					["VariableName"] = "FlySpeed",
					["OnChanged"] = function()

					end,
				},
			},
			["Sheriff Section"] = {
				["Aim-bot"] = {
					["SourceText"] = "<option>; innertxt='Aim-bot';",
					["Runner"] = function()
						variables.mm2aimboton = true
						while variables.mm2aimboton do
							if not variables.autoshotmm2 then
								if uiClosed then
									break
								end
								local gun, sheriff = getSheriffGun()
								local char = plr.Character
								local root = char and char.PrimaryPart
								if root and gun and gun.Parent.Name ~= "Backpack" and sheriff and sheriff == plr and isGunAvailable(gun) then
									local murder = getMurder()
									local tchar = murder and murder.Character
									local humant = tchar and tchar:FindFirstChildOfClass("Humanoid")
									local troot = tchar and tchar.PrimaryPart
									local handle = gun:FindFirstChild("Handle")
									if troot and handle then
										local possibilityray = getRayOnLocation(root.Position, troot.Position)
										if possibilityray then
											if possibilityray.Instance:IsDescendantOf(tchar) or possibilityray.Instance == troot then
												local targetlocation = tchar.PrimaryPart.CFrame

												if variables.aimbotcalculatewping32 then
													targetlocation = calculatecharactercf(tchar.PrimaryPart, humant)
												end

												task.spawn(function()
													shootGun(gun, targetlocation.Position)
												end)
											end
										end
									end
								end
								task.wait()
							else
								task.wait()
							end
						end
					end,
					["Stopper"] = function(selectedN)
						variables.mm2aimboton = nil
					end,
				},
			},
		},
		["About"] = {
			["Icon"] = icons.About,
			["Id"] = 1,
			["About"] = {
				["PageInfo"] = {
					["SourceText"] = "<bodytxt>; innertxt='Made By SteveMNC & RealTelgg.\n\nLast Update Logs: \nMM2 TargetShoot improved \nMM2 StealGun improved teleport requirement has removed \nMM2 BreakGun improved \nOptimized Interface CheckPossibility Functions \nOptimized Universal AntiFling \nOptimized Noclip \nOptimized HitBox Size Controller \nFixed SafeChat could Chat in your name without permission. \nFlingAllWithTool fixed skips dead players \nChanged SelectorArrow Icons \nSimple Interface updates \nAdded ReloadScript button \nAdded AntiAFK \nAdded AutoAFK anchors your character when you dont move \nBuildABoat Invisible works fully';txtxalign='left';txtyalign='top';",
				}
			}
		},
		["Scripts"] = {
			["Icon"] = icons.Scripts,
			["Id"] = 2,
			["Scripts"] = {
				["PageInfo"] = {
					["SourceText"] = "<bodytxt>; innertxt='Murder Mystery 2 " ..
						nameH ..
						"HUB\nThe Underground War " ..
						nameH ..
						"HUB\nRevenge Of Slimes " ..
						nameH ..
						"HUB\nBuild a Boat for Treasure " ..
						nameH ..
						"HUB\nMurder Mystery 2 " ..
						nameH ..
						"HUB\nNatural Disaster Survival " ..
						nameH ..
						"HUB\nBrookhaven " ..
						nameH ..
						"HUB\nHardest Game Ever " ..
						nameH .. "HUB\n" .. "Troll People Obby " .. nameH .. "HUB\n';txtxalign='left';txtyalign='top';",
				}
			}
		},
		["Sniper"] = {
			["Icon"] = icons.Sniper,
			["Id"] = 12,
			["Stream-Sniper"] = {
				["PlaceId"] = {
					["ID"] = 1,
					["SourceText"] = "<txtbox>; innertxt='PlaceId';placeholder='Number';",
					["Runner"] = function(text)
						if tonumber(text) then
							variables.tptoplaceid = tonumber(text)
						end
					end,
				},
				["UseCurrentPlaceId"] = {
					["ID"] = 2,
					["SourceText"] = "<option>; innertxt='Use Current PlaceId';",
					["Runner"] = function(text)
						variables.tptocurrentplaceid = true
					end,
					["Stopper"] = function(text)
						variables.tptocurrentplaceid = nil
					end,
				},
				["Join"] = {
					["ID"] = 3,
					["SourceText"] = "<btn>; innertxt='Join';",
					["Runner"] = function()
						local gameid = (variables.tptocurrentplaceid and tostring(game.PlaceId)) or variables.tptoplaceid

						if not gameid then
							Notification(nameH .. "UI", "PlaceId not entered.", 3, 3)
							return
						end

						local serverid = variables.streamsniperfoundserverid

						if not serverid then
							Notification(nameH .. "UI", "Could not find the server.", 3, 3)
							return
						end

						game:GetService("TeleportService"):TeleportToPlaceInstance(gameid, serverid)
						task.spawn(function() Notification(nameH .. "HUB", "Player Found. Teleporting...", 5, 2) end)
					end
				},
				["PageMain"] = {
					["ID"] = 4,
					["SourceText"] = "<searchbox>; innertxt='Username'; buttontxt='Snipe';",
					["Runner"] = function(username, loading, setState)
						loading:Play()
						local reqf = nil

						if syn and syn.request then
							reqf = syn.request
						elseif request then
							reqf = request
						elseif http and http.request then
							reqf = http.request
						elseif http_request then
							reqf = http_request
						end

						if coreui == gameui then
							loading:Stop()
							Notification(nameH .. "UI", "The current thread cannot access HttpGet and HttpRequests. U can use an executor.", 3, 3)
							return
						elseif not reqf then
							loading:Stop()
							Notification(nameH .. "UI", "Your executor does not support HttpRequests. U can use an executor.", 3, 3)
							return
						end

						local success, userid = pcall(function() return tostring(game:GetService("Players"):GetUserIdFromNameAsync(
							username)) end)
						local gameid = (variables.tptocurrentplaceid and tostring(game.PlaceId)) or variables.tptoplaceid
						if not gameid then
							loading:Stop()
							Notification(nameH .. "UI", "PlaceId not entered.", 3, 3)
							return
						end
						if success and userid then
							if loading then
								loading:Play()
							end
							local function HttpGet(url, b)
								local json = game:HttpGet(url, b)
								if json then
									return JSONDecode(json)
								end
							end

							local image_url = HttpGet("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. userid .. "&size=150x150&format=Png&isCircular=false").data[1].imageUrl
							local servers, cursor = {}, nil
							local index = 0
							local alltokens = {}

							local requests = 0
							local completedrequests = 0
							local broken = false

							while true do
								local cursortxt = cursor and "&cursor=" .. cursor or ""
								local data = JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. gameid .. "/servers/Public?limit=100" .. cursortxt))
								cursor = data.nextPageCursor

								for i = 1, #data.data do
									local place = data.data[i]
									for _, token in ipairs(place.playerTokens) do
										table.insert(alltokens, {
											["token"] = token,
											["place"] = place
										})
									end
								end

								if not cursor then
									break
								end

								index = index + 1
								setState("x" .. index .. "...")
							end

							setState("Scanning has completed.")
							task.wait(2)
							setState("Searching")

							local function fetchThumbs(tokens, f)
								local bodyx = {}

								for _, entry in ipairs(tokens) do
									table.insert(bodyx, {
										requestId = string.format("0:%s:AvatarHeadshot:150x150:png:regular", entry.token),
										type = "AvatarHeadShot",
										targetId = 0,
										token = entry.token,
										format = "png",
										size = "150x150"
									})
								end

								local postreq = reqf({
									Url = "https://thumbnails.roblox.com/v1/batch",
									Method = "POST",
									Headers = {
										["Content-Type"] = "application/json",
										["Accept"] = "application/json"
									},
									Body = JSONEncode(bodyx)
								})

								f(JSONDecode(postreq.Body))
							end

							local i = 1
							local chunkSize = 100

							local function nextChunk()
								if broken then
									return
								end
								local chunk

								if i + chunkSize > #alltokens then
									chunk = {unpack(alltokens, i)}
								else
									chunk = {unpack(alltokens, i, i + chunkSize - 1)}
								end

								if i > #alltokens then
									return 1
								end

								if not chunk then
									broken = true
									return
								end

								i = i + chunkSize

								setState(string.format("searching %d%%", math.floor((i / #alltokens) * 100)))

								fetchThumbs(chunk, function(response)
									local serverThumbs = response.data
									if serverThumbs then
										local thumbFound = false
										for k = 1, #serverThumbs do
											local thumb = serverThumbs[k]
											if thumb and thumb.imageUrl == image_url then
												thumbFound = true

												setState("FOUND THEM!")

												local thumbToken = split(thumb.requestId, ":")[2]
												local foundToken = nil

												for _, x in ipairs(chunk) do
													if x.token == thumbToken then
														foundToken = x.place
														break
													end
												end

												if foundToken then
													variables.streamsniperfoundserverid = foundToken.id
													game:GetService("TeleportService"):TeleportToPlaceInstance(gameid, foundToken.id)
													task.spawn(function()
														Notification(nameH .. "HUB", "Player Found. Teleporting...", 5, 2)
													end)
													broken = true
													return
												end
											end
										end
									end
								end)
							end

							while true do
								local res = nextChunk()
								if broken or res == 1 then
									break
								end
							end

							setState("couldn't find 'em")

							if loading then
								loading:Stop()
							end
						end
						loading:Stop()
					end,
				}
			}
		},
		["Universal"] = {
			["Icon"] = icons.Universal,
			["Id"] = 3,
			["If Players Have Collision"] = {
				["DisableScriptsOff"] = {
					["ID"] = 7,
					["SourceText"] = "<option>; innertxt='Turn Off Disable Scripts';",
					["Runner"] = function()
						variables.turnoffdisablescripts32 = true
					end,
					["Stopper"] = function()
						variables.turnoffdisablescripts32 = false
					end
				},
				["UseResetForFPWT"] = {
					["ID"] = 8,
					["SourceText"] = "<option>; innertxt='Use Reset ToolFling';",
					["Runner"] = function()
						variables.useresettoolfling32 = true
					end,
					["Stopper"] = function()
						variables.useresettoolfling32 = false
					end
				},
				["FE Fling Player With Tool"] = {
					["ID"] = 4,
					["SourceText"] = "<selector>; innertxt='FE Fling Player With Tool';",
					["Runner"] = function(selectedN)
						variables.refswordfalse = true
						variables.settingLocation = true
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						local char = plr.Character
						if target and char and char.PrimaryPart and target.Character and target.Character.PrimaryPart and plr.Character:FindFirstChildOfClass("Humanoid") then
							local human = char:FindFirstChildOfClass("Humanoid")
							if human then
								local tool = nil
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA("Tool") and v:FindFirstChild("Handle") then
										if not tool or tool:FindFirstChild("Handle").Size.Magnitude < v:FindFirstChild("Handle").Size.Magnitude then
											tool = v
										end
									end
								end
								if not tool then
									for i, v in ipairs(char:GetChildren()) do
										if v:IsA("Tool") and v:FindFirstChild("Handle") then
											tool = v
											break
										end
									end
								end
								if tool and not variables["rtblis2"] then
									local handle = tool:FindFirstChild("Handle")

									if variables.useresettoolfling32 then
										local human = char:FindFirstChildOfClass("Humanoid")
										if human then
											human.Health = 0
										end
									else
										char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, wspace.FallenPartsDestroyHeight + 5, 0)))
										repeat task.wait() until not char.PrimaryPart
									end

									local guit = {}

									if not variables.turnoffdisablescripts32 then
										for i, v in ipairs(plr.PlayerGui:GetChildren()) do
											if v:IsA("ScreenGui") then
												table.insert(guit, v)
												v.Parent = nil
											end
										end

										for i, v in ipairs(plr.PlayerScripts:GetChildren()) do
											if v:IsA("LocalScript") and v ~= script then
												table.insert(guit, v)
												v.Parent = nil
											end
										end
									end

									tool.Parent = char
									handle.Massless = true
									handle.CanCollide = false
									handle.Size = Vector3.new(8, 8, 8)

									if not variables["fpds54"] then
										variables.fpds54 = wspace.FallenPartsDestroyHeight
									end

									handle.Velocity = Vector3.new()
									handle.CFrame = CFrame.new()

									for i, v in ipairs(tool:GetChildren()) do
										if v ~= handle then
											v:Destroy()
										end
									end

									handle:ClearAllChildren()

									local tchar = target.Character
									local THumanoid = tchar:FindFirstChildOfClass("Humanoid")
									local human = char:FindFirstChildOfClass("Humanoid")
									local started = tick()
									wspace.CurrentCamera.CameraSubject = tchar

									local FPos = function(BP, TP, Pos, Ang)
										BP.CFrame = CFrame.new(TP.Position) * Pos * Ang
										BP.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
										BP.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
									end

									local SFBasePart = function(BP, TP)
										if not BP or not TP then
											return
										end
										local TimeToWait = 5
										local Time = tick()
										local Angle = 0
										repeat
											task.wait()
											if BP and TP then
												if TP.Velocity.Magnitude < 50 then
													Angle = Angle + 100
													FPos(BP, TP, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
														CFrame.Angles(math.rad(Angle), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
														CFrame.Angles(math.rad(Angle), 0, 0))
													task.wait()
													FPos(BP, TP,
														CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
														CFrame.Angles(math.rad(Angle), 0, 0))
													task.wait()
													FPos(BP, TP,
														CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
														CFrame.Angles(math.rad(Angle), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,
														CFrame.Angles(math.rad(Angle), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,
														CFrame.Angles(math.rad(Angle), 0, 0))
													task.wait()
												else
													FPos(BP, TP, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, 1.5, TP.Velocity.Magnitude / 1.25),
														CFrame.Angles(math.rad(90), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, -TP.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, 1.5, TP.Velocity.Magnitude / 1.25),
														CFrame.Angles(math.rad(90), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
													task.wait()
													FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
													task.wait()
												end
											else
												break
											end
										until TP.Velocity.Magnitude > 500 or TP.Parent ~= target.Character or target.Parent ~= game:GetService("Players") or target.Character ~= tchar or THumanoid.Sit or char ~= plr.Character or tick() > Time + TimeToWait or THumanoid.Health <= 0
									end

									local BV = Instance.new("BodyVelocity")
									BV.Name = "EpixVel"
									BV.Parent = handle
									BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
									BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

									variables.rtblis2 = true

									task.spawn(function()
										plr.CharacterAdded:Wait()
										variables.rtblis2 = false
										wait()
										for i, v in ipairs(guit) do
											if v:IsA("LocalScript") then
												v.Parent = plr.PlayerScripts
											else
												v.Parent = plr.PlayerGui
											end
										end
									end)

									SFBasePart(handle, tchar.PrimaryPart)
								end
							end
						end
						variables.settingLocation = false
						variables.refswordfalse = false
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["FE Fling All With Tool"] = {
					["ID"] = 3,
					["SourceText"] = "<btn>; innertxt='FE Fling All With Tool';",
					["Runner"] = function(selectedN)
						variables.refswordfalse = true
						variables.settingLocation = true
						local char = plr.Character
						if char and char.PrimaryPart and char:FindFirstChildOfClass("Humanoid") then
							local human = char:FindFirstChildOfClass("Humanoid")
							if human then
								local tool = nil
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA("Tool") and v:FindFirstChild("Handle") then
										if not tool or tool:FindFirstChild("Handle").Size.Magnitude < v:FindFirstChild("Handle").Size.Magnitude then
											tool = v
										end
									end
								end
								if not tool then
									for i, v in ipairs(char:GetChildren()) do
										if v:IsA("Tool") and v:FindFirstChild("Handle") then
											tool = v
											break
										end
									end
								end
								if tool and not variables["rtblis2"] then
									local handle = tool:FindFirstChild("Handle")

									if variables.useresettoolfling32 then
										local human = char:FindFirstChildOfClass("Humanoid")
										if human then
											human.Health = 0
										end
									else
										char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, wspace.FallenPartsDestroyHeight + 5, 0)))
										repeat task.wait() until not char.PrimaryPart
									end

									local guit = {}

									if not variables.turnoffdisablescripts32 then
										for i, v in ipairs(plr.PlayerGui:GetChildren()) do
											if v:IsA 'ScreenGui' then
												table.insert(guit, v)
												v.Parent = nil
											end
										end

										for i, v in ipairs(plr.PlayerScripts:GetChildren()) do
											if v:IsA 'LocalScript' and v ~= script then
												table.insert(guit, v)
												v.Parent = nil
											end
										end
									end

									task.spawn(function()
										plr.CharacterAdded:Wait()
										variables.rtblis2 = false
										wait()
										for i, v in ipairs(guit) do
											if v:IsA("LocalScript") then
												v.Parent = plr.PlayerScripts
											else
												v.Parent = plr.PlayerGui
											end
										end
									end)

									tool.Parent = char
									handle.Massless = true
									handle.CanCollide = false
									handle.Size = Vector3.new(8, 8, 8)

									if not variables["fpds54"] then
										variables.fpds54 = wspace.FallenPartsDestroyHeight
									end

									handle.Velocity = Vector3.new()
									handle.CFrame = CFrame.new()

									for i, v in ipairs(tool:GetChildren()) do
										if v ~= handle then
											v:Destroy()
										end
									end

									handle:ClearAllChildren()

									local human = char:FindFirstChildOfClass("Humanoid")
									variables.rtblis2 = true

									local plrtabl = game:GetService("Players"):GetPlayers()

									for i, _ in ipairs(game:GetService("Players"):GetPlayers()) do
										local randomindex = math.random(1, #plrtabl)
										local target = plrtabl[randomindex]
										table.remove(plrtabl, randomindex)
										if target ~= plr then
											local started = tick()
											local tchar = target.Character
											local THumanoid = tchar and tchar:FindFirstChildOfClass("Humanoid")
											if THumanoid then
												wspace.CurrentCamera.CameraSubject = tchar
												local FPos = function(BP, TP, Pos, Ang)
													BP.CFrame = CFrame.new(TP.Position) * Pos * Ang
													BP.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
													BP.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
												end

												local SFBasePart = function(BP, TP)
													if not BP or not TP then
														return
													end
													if TP.Velocity.Magnitude > 500 or TP.Parent ~= target.Character or target.Parent ~= game:GetService("Players") or target.Character ~= tchar or char ~= plr.Character then
														return
													end
													local TimeToWait = 2
													local Time = tick()
													local Angle = 0
													repeat
														task.wait()
														if BP and TP then
															if TP.Velocity.Magnitude < 50 then
																Angle = Angle + 100
																FPos(BP, TP,
																	CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
																	CFrame.Angles(math.rad(Angle), 0, 0))
																task.wait()
																FPos(BP, TP,
																	CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
																	CFrame.Angles(math.rad(Angle), 0, 0))
																task.wait()
																FPos(BP, TP,
																	CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
																	CFrame.Angles(math.rad(Angle), 0, 0))
																task.wait()
																FPos(BP, TP,
																	CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * TP.Velocity.Magnitude / 1.25,
																	CFrame.Angles(math.rad(Angle), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,
																	CFrame.Angles(math.rad(Angle), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,
																	CFrame.Angles(math.rad(Angle), 0, 0))
																task.wait()
															else
																FPos(BP, TP, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, 1.5, TP.Velocity.Magnitude / 1.25),
																	CFrame.Angles(math.rad(90), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, -1.5, -TP.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, 1.5, TP.Velocity.Magnitude / 1.25),
																	CFrame.Angles(math.rad(90), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
																task.wait()
																FPos(BP, TP, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
																task.wait()
															end
														else
															break
														end
													until TP.Velocity.Magnitude > 500 or TP.Parent ~= target.Character or target.Parent ~= game:GetService("Players") or target.Character ~= tchar or char ~= plr.Character or THumanoid.Sit or tick() > Time + TimeToWait or THumanoid.Health <= 0
												end

												SFBasePart(handle, tchar.PrimaryPart)

												if char ~= plr.Character then
													break
												end
											end
										end
									end

									local BV = Instance.new("BodyVelocity")
									BV.Name = "EpixVel"
									BV.Parent = handle
									BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
									BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
								end
							end
						end
						variables.settingLocation = false
						variables.refswordfalse = false
					end
				},
				["Fling Player"] = {
					["ID"] = 2,
					["SourceText"] = "<selector>; innertxt='Fling Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						if target and plr.Character and plr.Character.PrimaryPart and target.Character and target.Character.PrimaryPart and plr.Character:FindFirstChildOfClass("Humanoid") then
							disablechartouch(plr.Character)
							variables.usingnexusflings32 = true

							local Character = plr.Character
							local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
							local RootPart = Humanoid and Humanoid.RootPart
							local TCharacter = target.Character
							local THumanoid
							local TRootPart
							local THead
							local Accessory
							local Handle

							if TCharacter:FindFirstChildOfClass("Humanoid") then
								THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
							end
							if THumanoid and THumanoid.RootPart then
								TRootPart = THumanoid.RootPart
							end
							if TCharacter:FindFirstChild("Head") then
								THead = TCharacter.Head
							end
							if TCharacter:FindFirstChildOfClass("Accessory") then
								Accessory = TCharacter:FindFirstChildOfClass("Accessory")
							end
							if Accessory and Accessory:FindFirstChild("Handle") then
								Handle = Accessory.Handle
							end
							if Character and Humanoid and RootPart then
								if RootPart.Velocity.Magnitude < 50 then
									variables.OldPos = RootPart.CFrame
								end
								if THumanoid and THumanoid.Sit then
									task.spawn(function() Notification("Error Occurred", "Targeting is sitting", 5, 3) end)
									return
								end
								if THead then
									wspace.CurrentCamera.CameraSubject = THead
								elseif not THead and Handle then
									wspace.CurrentCamera.CameraSubject = Handle
								elseif THumanoid and TRootPart then
									wspace.CurrentCamera.CameraSubject = THumanoid
								end
								if not TCharacter:FindFirstChildWhichIsA("BasePart") then
									return
								end
								local FPos = function(BasePart, Pos, Ang)
									RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
									Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
									RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
									RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
								end
								local SFBasePart = function(BasePart)
									local TimeToWait = 2
									local Time = tick()
									local Angle = 0
									repeat
										if RootPart and THumanoid then
											if BasePart.Velocity.Magnitude < 50 then
												Angle = Angle + 100
												FPos(BasePart,
													CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
													CFrame.Angles(math.rad(Angle), 0, 0))
												task.wait()
												FPos(BasePart,
													CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
													CFrame.Angles(math.rad(Angle), 0, 0))
												task.wait()
												FPos(BasePart,
													CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
													CFrame.Angles(math.rad(Angle), 0, 0))
												task.wait()
												FPos(BasePart,
													CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
													CFrame.Angles(math.rad(Angle), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,
													CFrame.Angles(math.rad(Angle), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,
													CFrame.Angles(math.rad(Angle), 0, 0))
												task.wait()
											else
												FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25),
													CFrame.Angles(math.rad(90), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25),
													CFrame.Angles(math.rad(90), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
												task.wait()
												FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
												task.wait()
											end
										else
											break
										end
									until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= target.Character or target.Parent ~= game:GetService("Players") or target.Character ~= TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
								end
								local BV = Instance.new("BodyVelocity")
								BV.Name = "EpixVel"
								BV.Parent = RootPart
								BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
								BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
								if TRootPart and THead then
									if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
										SFBasePart(THead)
									else
										SFBasePart(TRootPart)
									end
								elseif TRootPart and not THead then
									SFBasePart(TRootPart)
								elseif not TRootPart and THead then
									SFBasePart(THead)
								elseif not TRootPart and not THead and Accessory and Handle then
									SFBasePart(Handle)
								else
									task.spawn(function() Notification("Error Occurred", "Target is missing everything", 5, 3) end)
									return
								end
								BV:Destroy()
								Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
								wspace.CurrentCamera.CameraSubject = Humanoid
								repeat
									RootPart.CFrame = variables.OldPos * CFrame.new(0, .5, 0)
									Character:SetPrimaryPartCFrame(variables.OldPos * CFrame.new(0, .5, 0))
									Humanoid:ChangeState("GettingUp")
									for _, x in ipairs(Character:GetChildren()) do
										if x:IsA("BasePart") then
											x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
										end
									end
									task.wait()
								until (RootPart.Position - variables.OldPos.p).Magnitude < 25
								wspace.FallenPartsDestroyHeight = -500
							else
								task.spawn(function() Notification("Error Occurred", "Random error", 5, 3) end)
								return
							end
							variables.usingnexusflings32 = nil
							enablechartouch(plr.Character)
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["Fling All"] = {
					["ID"] = 1,
					["SourceText"] = "<btn>; innertxt='Fling All';",
					["Runner"] = function()
						disablechartouch(plr.Character)
						variables.usingnexusflings32 = true
						for i, target in ipairs(game:GetService("Players"):GetPlayers()) do
							if target ~= plr then
								if target and plr.Character and plr.Character.PrimaryPart and target.Character and target.Character.PrimaryPart and plr.Character:FindFirstChildOfClass("Humanoid") then
									local Character = plr.Character
									local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
									local RootPart = Humanoid and Humanoid.RootPart
									local TCharacter = target.Character
									local THumanoid
									local TRootPart
									local THead
									local Accessory
									local Handle

									if TCharacter:FindFirstChildOfClass("Humanoid") then
										THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
									end
									if THumanoid and THumanoid.RootPart then
										TRootPart = THumanoid.RootPart
									end
									if TCharacter:FindFirstChild("Head") then
										THead = TCharacter.Head
									end
									if TCharacter:FindFirstChildOfClass("Accessory") then
										Accessory = TCharacter:FindFirstChildOfClass("Accessory")
									end
									if Accessory and Accessory:FindFirstChild("Handle") then
										Handle = Accessory.Handle
									end
									if Character and Humanoid and RootPart then
										if RootPart.Velocity.Magnitude < 50 then
											variables.OldPos = RootPart.CFrame
										end
										if THumanoid and THumanoid.Sit then
											task.spawn(function() Notification("Error Occurred", "Targeting is sitting", 5, 3) end)
											return
										end
										if THead then
											wspace.CurrentCamera.CameraSubject = THead
										elseif not THead and Handle then
											wspace.CurrentCamera.CameraSubject = Handle
										elseif THumanoid and TRootPart then
											wspace.CurrentCamera.CameraSubject = THumanoid
										end
										if not TCharacter:FindFirstChildWhichIsA("BasePart") then
											return
										end
										local FPos = function(BasePart, Pos, Ang)
											RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
											Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
											RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
											RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
										end
										local SFBasePart = function(BasePart)
											local TimeToWait = 2
											local Time = tick()
											local Angle = 0
											repeat
												if RootPart and THumanoid then
													if BasePart.Velocity.Magnitude < 50 then
														Angle = Angle + 100
														FPos(BasePart,
															CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
															CFrame.Angles(math.rad(Angle), 0, 0))
														task.wait()
														FPos(BasePart,
															CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
															CFrame.Angles(math.rad(Angle), 0, 0))
														task.wait()
														FPos(BasePart,
															CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
															CFrame.Angles(math.rad(Angle), 0, 0))
														task.wait()
														FPos(BasePart,
															CFrame.new(-2.25, -1.5, 2.25) +
																THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,
															CFrame.Angles(math.rad(Angle), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,
															CFrame.Angles(math.rad(Angle), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,
															CFrame.Angles(math.rad(Angle), 0, 0))
														task.wait()
													else
														FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25),
															CFrame.Angles(math.rad(90), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25),
															CFrame.Angles(0, 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25),
															CFrame.Angles(math.rad(90), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
														task.wait()
														FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
														task.wait()
													end
												else
													break
												end
											until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= target.Character or target.Parent ~= game:GetService("Players") or target.Character ~= TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
										end
										local BV = Instance.new("BodyVelocity")
										BV.Name = "EpixVel"
										BV.Parent = RootPart
										BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
										BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
										Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
										if TRootPart and THead then
											if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
												SFBasePart(THead)
											else
												SFBasePart(TRootPart)
											end
										elseif TRootPart and not THead then
											SFBasePart(TRootPart)
										elseif not TRootPart and THead then
											SFBasePart(THead)
										elseif not TRootPart and not THead and Accessory and Handle then
											SFBasePart(Handle)
										else
											task.spawn(function() Notification("Error Occurred", "Target is missing everything", 5, 3) end)
											return
										end
										BV:Destroy()
										Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
										wspace.CurrentCamera.CameraSubject = Humanoid
										repeat
											RootPart.CFrame = variables.OldPos * CFrame.new(0, .5, 0)
											Character:SetPrimaryPartCFrame(variables.OldPos * CFrame.new(0, .5, 0))
											Humanoid:ChangeState("GettingUp")
											for _, x in ipairs(Character:GetChildren()) do
												if x:IsA("BasePart") then
													x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
												end
											end
											task.wait()
										until (RootPart.Position - variables.OldPos.p).Magnitude < 25
									else
										task.spawn(function() Notification("Error Occurred", "Random error", 5, 3) end)
										return
									end
								end
							end
						end
						variables.usingnexusflings32 = nil
						enablechartouch(plr.Character)
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["Fling2 Player"] = {
					["ID"] = 6,
					["SourceText"] = "<selector>; innertxt='Fling2 Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						if target and plr.Character and plr.Character.PrimaryPart and target.Character and target.Character.PrimaryPart and plr.Character:FindFirstChildOfClass("Humanoid") then
							local char = plr.Character

							disablechartouch(char)
							variables.usingnexusflings32 = true

							local tchar = target.Character
							local human = char:FindFirstChildOfClass("Humanoid")
							local humant = tchar:FindFirstChildOfClass("Humanoid")
							local root = char.PrimaryPart
							local troot = tchar.PrimaryPart
							local ocf = char.PrimaryPart.CFrame
							local timestart = tick()
							local maxtimeout = 3

							local function checkstop()
								if not troot or troot.Velocity.Magnitude >= 500 or not char or not tchar or not human or not human.Parent or not humant or not humant.Parent or plr.Character ~= char or target.Character ~= tchar or human.Health <= 0 or humant.Health <= 0 or tick() - timestart > maxtimeout then
									return true
								end
								return false
							end

							local y = 0

							local BV = Instance.new("BodyVelocity")
							BV.Name = "EpixVel"
							BV.Parent = root
							BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
							BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

							local function getPos(t)
								return t.Position + ((calculateMovePoint(humant, troot) / 2) * (1 + math.random(0, 40) / 20))
							end

							while task.wait() do
								if checkstop() then
									root.Velocity = Vector3.new(0, 0, 0)
									root.RotVelocity = Vector3.new(0, 0, 0)
									BV:Destroy()
									char:SetPrimaryPartCFrame(ocf)
									break
								end

								root.Velocity = Vector3.new(9e7, -9e7, 9e7)
								root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)

								local pos = getPos(troot) - Vector3.new(0, (y / 50) - 3.5, 0)
								char:SetPrimaryPartCFrame(CFrame.fromOrientation(math.rad(90), 0, 0) + pos)

								y = y + 10
								if y > 250 then
									y = 0
								end
							end
							variables.usingnexusflings32 = nil
							enablechartouch(char)
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["Fling2 All"] = {
					["ID"] = 5,
					["SourceText"] = "<btn>; innertxt='Fling2 All';",
					["Runner"] = function()
						local char = plr.Character
						disablechartouch(char)
						variables.usingnexusflings32 = true
						local human = char and char:FindFirstChildOfClass("Humanoid")
						local root = human and char.PrimaryPart

						if not root then
							return
						end

						local ocf = root.CFrame

						local BV = Instance.new("BodyVelocity")
						BV.Name = "EpixVel"
						BV.Parent = root
						BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
						BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

						for i, target in ipairs(game:GetService("Players"):GetPlayers()) do
							if target ~= plr then
								if target and target.Character and target.Character.PrimaryPart and plr.Character:FindFirstChildOfClass("Humanoid") then
									local tchar = target.Character
									local humant = tchar:FindFirstChildOfClass("Humanoid")
									local troot = tchar.PrimaryPart
									local timestart = tick()
									local maxtimeout = 2

									local function checkstop()
										if not troot or troot.Velocity.Magnitude >= 500 or not char or not tchar or not human or not human.Parent or not humant or not humant.Parent or plr.Character ~= char or target.Character ~= tchar or human.Health <= 0 or humant.Health <= 0 or tick() - timestart > maxtimeout then
											return true
										end
										return false
									end

									local function getPos(t)
										return t.Position + ((calculateMovePoint(humant, troot) / 2) * (1 + math.random(0, 40) / 20))
									end

									local y = 0

									while task.wait() do
										if checkstop() then
											break
										end

										root.Velocity = Vector3.new(9e7, -9e7, 9e7)
										root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)

										local pos = getPos(troot) - Vector3.new(0, (y / 50) - 3.5, 0)
										char:SetPrimaryPartCFrame(CFrame.fromOrientation(math.rad(90), 0, 0) + pos)

										y = y + 10
										if y > 250 then
											y = 0
										end
									end
								end
							end
						end

						root.Velocity = Vector3.new(0, 0, 0)
						root.RotVelocity = Vector3.new(0, 0, 0)
						BV:Destroy()
						char:SetPrimaryPartCFrame(ocf)

						variables.usingnexusflings32 = nil
						enablechartouch(char)
					end,
				},
				["Fling"] = {
					["ID"] = 7,
					["SourceText"] = "<option>; innertxt='Fling'; dontsavethis='true';",
					["Runner"] = function()
						local vel = nil
						local lastchar = nil
						local function reApply(char)
							if char == lastchar then
								return
							end

							lastchar = char

							repeat task.wait() until char.PrimaryPart
							vel = Instance.new("BodyAngularVelocity")
							vel.Name = "EpixVel"
							vel.Parent = char.PrimaryPart
							vel.AngularVelocity = Vector3.new(0, 99999, 0)
							vel.MaxTorque = Vector3.new(0, math.huge, 0)
							vel.P = math.huge

							variables.fling32 = true

							for i, v in next, char:GetChildren() do
								if v:IsA("BasePart") then
									v.CanCollide = false
									v.Massless = true
									v.Velocity = Vector3.new(0, 0, 0)
								end
							end
						end

						local char = plr.Character

						reApply(char)
						local l = plr.CharacterAdded:Connect(function(c)
							reApply(c)
						end)
						noclipf()

						repeat
							if vel then
								vel.AngularVelocity = Vector3.new(0, 99999, 0)
							end
							task.wait(0.2)
							if vel then
								vel.AngularVelocity = Vector3.new(0, 0, 0)
							end
							task.wait(0.1)
						until not variables.fling32

						if vel then
							vel:Destroy()
						end

						l:Disconnect()

						if not variables.manualnoclip32 then
							clipf()
						end
					end,
					["OnRemove"] = function(uiobject)
						variables.fling32 = nil
					end,
					["Stopper"] = function(uiobject)
						variables.fling32 = nil
					end,
				}
			},
			["Visuals"] = {
				["TeleportToPlayer"] = {
					["ID"] = 17,
					["SourceText"] = "<selector>; innertxt='Teleport to Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and target and target.Character and target.Character.PrimaryPart then
							local char = plr.Character
							if not variables.usingnexusflings32 then
								variables.usingnexusflings32 = 1
							end
							char:SetPrimaryPartCFrame(target.Character.PrimaryPart.CFrame)
							task.wait(0.5)
							if variables.usingnexusflings32 == 1 then
								variables.usingnexusflings32 = nil
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["UseNilInstances"] = {
					["ID"] = 15,
					["SourceText"] = "<option>; innertxt='Use Nil Instances';",
					["Runner"] = function()
						variables.usegetnilinstances32 = true
					end,
					["Stopper"] = function()
						variables.usegetnilinstances32 = nil
					end
				},
				["ViewPlayer"] = {
					["ID"] = 16,
					["SourceText"] = "<option>; innertxt='View Player';",
					["Runner"] = function()
						variables["appliedviewplayerloop32"] = true
						while variables["appliedviewplayerloop32"] do
							wspace.CurrentCamera.CameraSubject = (variables["appliedviewplayer32"] and variables["appliedviewplayer32"].Character and variables["appliedviewplayer32"].Character:FindFirstChildOfClass("Humanoid")) or
								wspace.CurrentCamera.CameraSubject
							task.wait()
						end
					end,
					["Stopper"] = function()
						variables["appliedviewplayerloop32"] = nil
						wspace.CurrentCamera.CameraSubject = (plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")) or
							wspace.CurrentCamera.CameraSubject
					end,
				},
				["ApplyViewPlayer"] = {
					["ID"] = 16,
					["SourceText"] = "<selector>; innertxt='Apply Player to View';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						variables["appliedviewplayer32"] = target
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["TeleportToPlace"] = {
					["ID"] = 21,
					["SourceText"] = "<txtbox>; innertxt='Teleport';placeholder='PlaceId';",
					["Runner"] = function(text)
						if tonumber(text) then
							teleportplr(tonumber(text))
						end
					end,
				},
				["TeleportToInstance"] = {
					["ID"] = 21,
					["SourceText"] = "<txtbox>; innertxt='Teleport to Instance';placeholder='InstanceId';",
					["Runner"] = function(text)
						teleportplrplaceinstance(game.PlaceId, text)
					end,
				},
				["R15Animations"] = {
					["ID"] = 14,
					["SourceText"] = "<option>; innertxt='R15 Animations';",
					["Runner"] = function()
						local anim = {}
						anim.cheer = {}
						anim.climb = {}
						anim.dance = {}
						anim.dance2 = {}
						anim.dance3 = {}
						anim.fall = {}
						anim.idle = {}
						anim.jump = {}
						anim.laugh = {}
						anim.point = {}
						anim.run = {}
						anim.sit = {}
						anim.swim = {}
						anim.swimidle = {}
						anim.toollunge = {}
						anim.toolnone = {}
						anim.toolslash = {}
						anim.walk = {}
						anim.wave = {}
						anim.cheer.CheerAnim = "http://www.roblox.com/asset/?id=507770677"
						anim.climb.ClimbAnim = "http://www.roblox.com/asset/?id=616003713"
						anim.dance.Animation1 = "http://www.roblox.com/asset/?id=507771019"
						anim.dance.Animation2 = "http://www.roblox.com/asset/?id=507771955"
						anim.dance.Animation3 = "http://www.roblox.com/asset/?id=507772104"
						anim.dance2.Animation1 = "http://www.roblox.com/asset/?id=507776043"
						anim.dance2.Animation2 = "http://www.roblox.com/asset/?id=507776720"
						anim.dance2.Animation3 = "http://www.roblox.com/asset/?id=507776879"
						anim.dance3.Animation1 = "http://www.roblox.com/asset/?id=507777268"
						anim.dance3.Animation2 = "http://www.roblox.com/asset/?id=507777451"
						anim.dance3.Animation3 = "http://www.roblox.com/asset/?id=507777623"
						anim.fall.FallAnim = "http://www.roblox.com/asset/?id=616005863"
						anim.idle.Animation1 = "http://www.roblox.com/asset/?id=616006778"
						anim.idle.Animation2 = "http://www.roblox.com/asset/?id=616008087"
						anim.jump.JumpAnim = "http://www.roblox.com/asset/?id=616008936"
						anim.laugh.LaughAnim = "http://www.roblox.com/asset/?id=507770818"
						anim.point.PointAnim = "http://www.roblox.com/asset/?id=507770453"
						anim.run.RunAnim = "http://www.roblox.com/asset/?id=616010382"
						anim.sit.SitAnim = "http://www.roblox.com/asset/?id=507768133"
						anim.swim.Swim = "http://www.roblox.com/asset/?id=616011509"
						anim.swimidle.SwimIdle = "http://www.roblox.com/asset/?id=616012453"
						anim.toollunge.ToolLungeAnim = "http://www.roblox.com/asset/?id=507768375"
						anim.toolnone.ToolNoneAnim = "http://www.roblox.com/asset/?id=507768375"
						anim.toolslash.ToolSlashAnim = "http://www.roblox.com/asset/?id=507768375"
						anim.walk.WalkAnim = "http://www.roblox.com/asset/?id=616013216"
						anim.wave.WaveAnim = "http://www.roblox.com/asset/?id=507770239"

						local function setchar(char)
							repeat task.wait() until char.Parent and char.PrimaryPart and char:FindFirstChild("Animate") and char:FindFirstChildOfClass("Humanoid")
							local animate = char.Parent and char:FindFirstChild("Animate")
							local human = char:FindFirstChildOfClass("Humanoid")
							animate.Disabled = true
							if human then
								for i, v in ipairs(human:GetPlayingAnimationTracks()) do
									v:Stop()
								end
							end

							for i, v in pairs(anim) do
								local r = animate:FindFirstChild(i)
								if r then
									for l, x in pairs(v) do
										if r:FindFirstChild(l) then
											setAttribute(r:FindFirstChild(l), "OldId", r:FindFirstChild(l).AnimationId)
											r:FindFirstChild(l).AnimationId = x
										end
									end
								end
							end

							animate.Disabled = false
						end

						if plr.Character then
							setchar(plr.Character)
						end

						variables.r15charanimationapplier = plr.CharacterAdded:Connect(function(char)
							setchar(char)
						end)
					end,
					["OnRemove"] = function()
						if variables.r15charanimationapplier then
							variables.r15charanimationapplier:Disconnect()
						end
					end,
					["Stopper"] = function()
						if variables.r15charanimationapplier then
							variables.r15charanimationapplier:Disconnect()

							if plr.Character then
								local anim = {}
								anim.cheer = {}
								anim.climb = {}
								anim.dance = {}
								anim.dance2 = {}
								anim.dance3 = {}
								anim.fall = {}
								anim.idle = {}
								anim.jump = {}
								anim.laugh = {}
								anim.point = {}
								anim.run = {}
								anim.sit = {}
								anim.swim = {}
								anim.swimidle = {}
								anim.toollunge = {}
								anim.toolnone = {}
								anim.toolslash = {}
								anim.walk = {}
								anim.wave = {}

								anim.cheer.CheerAnim = "http://www.roblox.com/asset/?id=507770677"
								anim.climb.ClimbAnim = "http://www.roblox.com/asset/?id=616003713"
								anim.dance.Animation1 = "http://www.roblox.com/asset/?id=507771019"
								anim.dance.Animation2 = "http://www.roblox.com/asset/?id=507771955"
								anim.dance.Animation3 = "http://www.roblox.com/asset/?id=507772104"
								anim.dance2.Animation1 = "http://www.roblox.com/asset/?id=507776043"
								anim.dance2.Animation2 = "http://www.roblox.com/asset/?id=507776720"
								anim.dance2.Animation3 = "http://www.roblox.com/asset/?id=507776879"
								anim.dance3.Animation1 = "http://www.roblox.com/asset/?id=507777268"
								anim.dance3.Animation2 = "http://www.roblox.com/asset/?id=507777451"
								anim.dance3.Animation3 = "http://www.roblox.com/asset/?id=507777623"
								anim.fall.FallAnim = "http://www.roblox.com/asset/?id=616005863"
								anim.idle.Animation1 = "http://www.roblox.com/asset/?id=616006778"
								anim.idle.Animation2 = "http://www.roblox.com/asset/?id=616008087"
								anim.jump.JumpAnim = "http://www.roblox.com/asset/?id=616008936"
								anim.laugh.LaughAnim = "http://www.roblox.com/asset/?id=507770818"
								anim.point.PointAnim = "http://www.roblox.com/asset/?id=507770453"
								anim.run.RunAnim = "http://www.roblox.com/asset/?id=616010382"
								anim.sit.SitAnim = "http://www.roblox.com/asset/?id=507768133"
								anim.swim.Swim = "http://www.roblox.com/asset/?id=616011509"
								anim.swimidle.SwimIdle = "http://www.roblox.com/asset/?id=616012453"
								anim.toollunge.ToolLungeAnim = "http://www.roblox.com/asset/?id=507768375"
								anim.toolnone.ToolNoneAnim = "http://www.roblox.com/asset/?id=507768375"
								anim.toolslash.ToolSlashAnim = "http://www.roblox.com/asset/?id=507768375"
								anim.walk.WalkAnim = "http://www.roblox.com/asset/?id=616013216"
								anim.wave.WaveAnim = "http://www.roblox.com/asset/?id=507770239"

								local char = plr.Character
								repeat task.wait() until char.Parent and char.PrimaryPart and char:FindFirstChild("Animate") and char:FindFirstChildOfClass("Humanoid")
								local animate = char.Parent and char:FindFirstChild("Animate")
								local human = char:FindFirstChildOfClass("Humanoid")
								animate.Disabled = true
								if human then
									for i, v in ipairs(human:GetPlayingAnimationTracks()) do
										v:Stop()
									end
								end

								for i, v in pairs(anim) do
									local r = animate:FindFirstChild(i)
									if r then
										for l, x in pairs(v) do
											if r:FindFirstChild(l) then
												r:FindFirstChild(l).AnimationId = getAttribute(r:FindFirstChild(l), "OldId")
											end
										end
									end
								end

								animate.Disabled = false
							end
						end
					end,
				},
				["AutoAFK"] = {
					["ID"] = 14,
					["SourceText"] = "<option>; innertxt='Auto AFK';",
					["Runner"] = function()
						local disconnectfunctions = {}

						if variables.autoAFK32disconnector then
							variables.autoAFK32disconnector()
						end

						variables.autoAFK32disconnector = function()
							for i,v in ipairs(disconnectfunctions) do
								pcall(v)
							end
						end

						local function anchorParts(char,anchored)
							for i,v in ipairs(char:GetChildren()) do
								if v:IsA("BasePart") and v.Anchored ~= anchored then
									v.Anchored = anchored
								end
							end
						end

						local function onHumanoid(human,char)
							local function retry()
								if human.MoveDirection == Vector3.new(0,0,0) then
									anchorParts(char,true)
								else
									anchorParts(char,false)
								end
							end

							retry()
							local c
							table.insert(disconnectfunctions,function()
								anchorParts(char,false)
								c:Disconnect()
							end)
							c = human.Changed:Connect(function()
								if uiClosed or not human.Parent then
									c:Disconnect()
									return
								end
								retry()
							end)
						end

						local function applyCharacter(char)
							repeat task.wait() until char:FindFirstChild("Humanoid")
							local human = char:FindFirstChild("Humanoid")
							onHumanoid(human,char)
							local c
							table.insert(disconnectfunctions,function()
								c:Disconnect()
							end)
							c = char.ChildAdded:Connect(function(v)
								if uiClosed or not char.Parent then
									c.b:Disconnect()
									return
								end
								if v:IsA("Humanoid") then
									onHumanoid(v,char)
								end
							end)
						end

						if plr.Character then
							applyCharacter(plr.Character)
						end

						local c
						table.insert(disconnectfunctions,function()
							c:Disconnect()
						end)
						c = plr.CharacterAdded:Connect(function(char)
							if uiClosed then
								c.b:Disconnect()
								return
							end
							applyCharacter(char)
						end)
					end,
					["OnRemove"] = function()
						if variables.autoAFK32disconnector then
							variables.autoAFK32disconnector()
							variables.autoAFK32disconnector = nil
						end
					end,
					["Stopper"] = function()
						if variables.autoAFK32disconnector then
							variables.autoAFK32disconnector()
							variables.autoAFK32disconnector = nil
						end
					end,
				},
				["AntiAFK"] = {
					["ID"] = 14,
					["SourceText"] = "<option>; innertxt='Anti AFK';",
					["Runner"] = function()
						if variables.antiafk32 then
							variables.antiafk32:Disconnect()
						end

						variables.antiafk32 = plr.Idled:connect(function()
							vUser:CaptureController()
							vUser:ClickButton2(Vector2.new())
						end)
					end,
					["OnRemove"] = function()
						if variables.antiafk32 then
							variables.antiafk32:Disconnect()
							variables.antiafk32 = nil
						end
					end,
					["Stopper"] = function()
						if variables.antiafk32 then
							variables.antiafk32:Disconnect()
							variables.antiafk32 = nil
						end
					end,
				},
				["PanicKey"] = {
					["ID"] = 14,
					["SourceText"] = "<keybind>; innertxt='Panic Key'; currentKey='0x70';",
					["Runner"] = function()
						if mainframe.Visible then
							mainframe.Visible = false
						else
							mainframe.Visible = true
						end
					end,
				},
				["CTRLCLICKTP"] = {
					["ID"] = 13,
					["SourceText"] = "<option>; innertxt='CTRL+CLICK=TP'",
					["Runner"] = function()
						if onmobile() then
							if not variables.bindfortp34 then
								variables.bindfortp34 = createBindableButton("Click TP")
								variables.bindfortp34.OnClick(function()
									if variables.ctrl32fortp then
										variables.ctrl32fortp = false
										variables.bindfortp34:SetLightOff()
									else
										variables.ctrl32fortp = true
										variables.bindfortp34:SetLightOn()
									end
								end)
							end
						end
						if variables.ctrlclick32fortp == false or variables.ctrlclick32fortp == true then
							variables.ctrlclick32fortp = true
							return
						end
						variables.ctrlclick32fortp = true
						local function tp()
							if not plr.Character or not plr.Character.PrimaryPart then
								return
							end
							local ray = getMouseRay(true)
							if ray then
								local charsize = (plr.Character:GetExtentsSize() / 2) * ray.Normal
								local cf = CFrame.fromOrientation(plr.Character.PrimaryPart.CFrame:ToOrientation()) + ray.Position +
									charsize
								plr.Character:SetPrimaryPartCFrame(cf)
							end
						end
						onTouched(function()
							if not variables.ctrlclick32fortp then
								return
							end
							local result = variables.ctrl32fortp and tp()
						end, true)
						uis.InputBegan:Connect(function(key)
							if key.KeyCode == Enum.KeyCode.LeftControl then
								variables.ctrl32fortp = true
							end
						end)
						uis.InputEnded:Connect(function(key)
							if key.KeyCode == Enum.KeyCode.LeftControl then
								variables.ctrl32fortp = false
							end
						end)
					end,
					["Stopper"] = function()
						if variables.bindfortp34 then
							variables.bindfortp34:Destroy()
							variables.bindfortp34 = nil
						end
						variables.ctrl32fortp = false
						variables.ctrlclick32fortp = false
					end
				},
				["Aim-botCalculateWPing"] = {
					["ID"] = 13,
					["SourceText"] = "<option>; innertxt='Aim-bot Calculate w Ping'",
					["Runner"] = function()
						variables.aimbotcalculatewping32 = true
					end,
					["OnRemove"] = function()
						variables.aimbotcalculatewping32 = nil
					end,
					["Stopper"] = function()
						variables.aimbotcalculatewping32 = nil
					end
				},
				["DisableCharacterTouch"] = {
					["ID"] = 12,
					["SourceText"] = "<option>; innertxt='Disable Character Touch';",
					["Runner"] = function()
						disablechartouch(plr.Character)
						variables.chartouchdisabler32 = plr.CharacterAdded:Connect(function(char)
							repeat task.wait() until char.PrimaryPart
							disablechartouch(char)
						end)
					end,
					["Stopper"] = function()
						enablechartouch(plr.Character, true)
						if variables.chartouchdisabler32 then
							variables.chartouchdisabler32:Disconnect()
							variables.chartouchdisabler32 = nil
						end
					end,
					["OnRemove"] = function()
						enablechartouch(plr.Character, true)
						if variables.chartouchdisabler32 then
							variables.chartouchdisabler32:Disconnect()
							variables.chartouchdisabler32 = nil
						end
					end,
				},
				["SetCheckPoint"] = {
					["ID"] = 12,
					["SourceText"] = "<option>; innertxt='Set Checkpoint';",
					["Runner"] = function()
						variables.rbreaksrsl34 = false
						variables.runResLoc34 = plr.CharacterAdded:Connect(function(char)
							if variables.settingLocation then return end
							variables.settingLocation = true
							repeat task.wait() until char and char.PrimaryPart and char:FindFirstChildOfClass("Humanoid")
							glitchhumanoid()
							if variables["lastCharLoc34"] then
								local start = tick()
								repeat
									task.wait()
									char:FindFirstChild("HumanoidRootPart").CFrame = variables["lastCharLoc34"]
								until tick() - start > 0.2
							end
							variables.settingLocation = false
						end)
						task.spawn(function()
							while wait(0.3) do
								if variables.rbreaksrsl34 then
									break
								end
								local char = plr.Character
								if char and char.PrimaryPart and not variables.settingLocation and char:FindFirstChildOfClass("Humanoid") and char:FindFirstChildOfClass("Humanoid").Health > 0 then
									if char:FindFirstChild("HumanoidRootPart"):FindFirstChildOfClass("Motor6D") or char:FindFirstChild("Head"):FindFirstChildOfClass("Motor6D") then
										variables.lastCharLoc34 = char:FindFirstChild("HumanoidRootPart").CFrame
									end
								end
							end
						end)
					end,
					["Stopper"] = function()
						if variables.runResLoc34 then
							variables.runResLoc34:Disconnect()
							variables.rbreaksrsl34 = true
						end
					end,
				},
				["InfiniteYield"] = {
					["ID"] = 5,
					["SourceText"] = "<btn>; innertxt='Load Infinite Yield';",
					["Runner"] = function()
						if not variables["infyieldloaded34"] then
							variables.infyieldloaded34 = true
							--_G.LoadIY()
							loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
						end
					end,
				},
				["RemoteSpyMobile"] = {
					["ID"] = 5,
					["SourceText"] = "<btn>; innertxt='Load RemoteSpy Mobile';",
					["Runner"] = function()
						if not variables["infyieldloaded34"] then
							variables.infyieldloaded34 = true
							--_G.LoadIY()
							loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile'))()
						end
					end,
				},
				["DexMobile"] = {
					["ID"] = 5,
					["SourceText"] = "<btn>; innertxt='Load Dex Mobile';",
					["Runner"] = function()
						if not variables["infyieldloaded34"] then
							variables.infyieldloaded34 = true
							--_G.LoadIY()
							loadstring(game:HttpGet('https://raw.githubusercontent.com/JustAP1ayer/ugc/main/Dex'))()
						end
					end,
				},
				["PrivateChat"] = {
					["ID"] = 11,
					["SourceText"] = "<option>; innertxt='Private Chat';",
					["Runner"] = function()
						variables.privatemessage32 = true
					end,
					["OnRemove"] = function()
						variables.privatemessage32 = nil
					end,
					["Stopper"] = function()
						variables.privatemessage32 = nil
					end,
				},
				["UseChatService"] = {
					["ID"] = 11,
					["SourceText"] = "<option>; innertxt='Use ChatService';",
					["Runner"] = function()
						variables.usechatservice32 = true
					end,
					["OnRemove"] = function()
						variables.usechatservice32 = nil
					end,
					["Stopper"] = function()
						variables.usechatservice32 = nil
					end,
				},
				["SafeChat"] = {
					["ID"] = 11,
					["SourceText"] = "<option>; innertxt='Safe Chat';",
					["Runner"] = function()
						if not variables["schat34"] then
							local chatevent = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") and
								game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild(
							"SayMessageRequest")
							variables.schat34 = Instance.new("Frame", ui)

							local chatService = game:GetService("TextChatService")

							local tag = "*m "

							local chat = variables.schat34
							chat.ZIndex = 3
							chat.ClipsDescendants = true
							chat.BorderSizePixel = 0
							setAttribute(chat, "IgnoreTransparentObjects", true)
							pcall(function() Instance.new("UICorner", chat).CornerRadius = UDim.new(0, 4) end)

							local stroke321 = nil
							pcall(function()
								stroke321 = Instance.new("UIStroke", chat)
								stroke321.Thickness = 3
								stroke321.LineJoinMode = Enum.LineJoinMode.Bevel
								stroke321.Color = blackb
							end)
							chat.Name = "SafeChatFrame"
							chat.BackgroundColor3 = black
							chat.Size = UDim2.new(0, 200, 0, 300)

							if onmobile() then
								chat.Size = UDim2.new(0, 150, 0, 200)
							end

							chat.Position = UDim2.new(1, -chat.Size.X.Offset, 1, -chat.Size.Y.Offset)

							local ctitle = Instance.new("TextLabel", chat)
							Instance.new("UIPadding", ctitle).PaddingLeft = UDim.new(0, 32)
							ctitle.Name = "Title"
							ctitle.ZIndex = 4
							ctitle.Font = classicFont
							ctitle.TextColor3 = whitew
							ctitle.Text = "Safe Chat"
							ctitle.TextSize = 25
							ctitle.Size = UDim2.new(1, 0, 0, 32)
							ctitle.TextXAlignment = Enum.TextXAlignment.Left
							ctitle.BorderSizePixel = 0
							ctitle.BackgroundColor3 = blackb

							if not chatevent then
								task.spawn(function() Notification(nameH .. "UI",
									"SafeChatService not found (there is NewChatService), if you type anything moderation will see this.",
									3) end)
							end

							local icon = Instance.new("ImageLabel", chat)
							icon.Name = "Icon"
							icon.ZIndex = 4
							icon.Size = UDim2.new(0, 32, 0, 32)
							icon.BackgroundTransparency = 1

							local itemcon = Instance.new("ScrollingFrame", chat)
							itemcon.Name = "ItemContainer"
							itemcon.ScrollBarThickness = 3
							pcall(function() itemcon.ScrollBarImageColor3 = whitew end)
							itemcon.Position = UDim2.new(0, 0, 0, 32)
							itemcon.Size = UDim2.new(1, 0, 1, -64)
							itemcon.BackgroundColor3 = black
							itemcon.BorderSizePixel = 0
							itemcon.ZIndex = 4
							itemcon.BorderSizePixel = 0
							itemcon.CanvasSize = UDim2.new(0, 0, 0, -1)
							Instance.new("UIListLayout", itemcon).SortOrder = Enum.SortOrder.Name

							local typebar = Instance.new("TextBox", chat)
							typebar.Name = "TypeBar"
							typebar.Position = UDim2.new(0, 0, 1, -32)
							typebar.Size = UDim2.new(1, 0, 0, 32)
							typebar.BackgroundColor3 = blackb
							typebar.ZIndex = 4
							typebar.Font = classicFont
							typebar.TextSize = 25
							typebar.TextXAlignment = Enum.TextXAlignment.Left
							typebar.TextColor3 = whitew
							pcall(function() typebar.PlaceholderText = "Type" end)
							typebar.BorderSizePixel = 0
							typebar.Text = ""
							typebar.ClearTextOnFocus = false

							local indx = 0

							local function updatescrolllistlayout()
								local lastsize = 0
								for i, v in ipairs(itemcon:GetChildren()) do
									if v:IsA("Frame") then
										lastsize = lastsize + v.Size.Y.Offset
									end
								end
								itemcon.CanvasSize = UDim2.new(0, 0, 0, lastsize)
							end

							local function addmsg(target, msg, to32)
								indx = indx + 1
								local color = getplayercolor(target) or target.TeamColor.Color
								color = math.floor(color.R * 255) .. "," .. math.floor(color.G * 255) .. "," .. math.floor(color.B * 255)

								local namec = target.Name
								if to32 then
									namec = namec .. " To " .. tostring(to32)
								end

								local str = "<font color='rgb(" .. color .. ")'>[" .. namec .. "]:</font> " .. msg
								local msgframe = Instance.new("Frame", itemcon)
								local newmessage = Instance.new("TextLabel", msgframe)

								newmessage.Font = classicFont
								newmessage.TextSize = 25
								newmessage.TextColor3 = whitew
								newmessage.TextXAlignment = Enum.TextXAlignment.Left
								newmessage.RichText = true
								newmessage.Text = str
								newmessage.Size = UDim2.new(1, -3, 1, 0)
								newmessage.TextWrapped = true
								newmessage.TextYAlignment = Enum.TextYAlignment.Top
								newmessage.BackgroundTransparency = 1
								msgframe.BackgroundTransparency = 1
								msgframe.ZIndex = 4
								newmessage.ZIndex = 4
								msgframe.Size = UDim2.new(1, 0, 1, 0)
								task.wait()
								msgframe.Size = UDim2.new(1, 0, 0, newmessage.TextBounds.Y)
								local csizey = itemcon.CanvasSize.Y.Offset
								updatescrolllistlayout()

								local state = false
								if itemcon.CanvasPosition.Y >= csizey-itemcon.AbsoluteSize.Y then
									task.wait()
									itemcon.CanvasPosition = Vector2.new(0, itemcon.CanvasSize.Y.Offset-itemcon.AbsoluteSize.Y)
								end
							end

							local function applynew(v)
								v.Chatted:Connect(function(msg, to32)
									if variables.usechatservice32 then
										return
									end

									if uiClosed then
										return
									end

									if string.len(split(msg, tag)[1]) <= 0 then
										msg = decodetext(string.gsub(msg, tag, "", 1))
									end

									addmsg(v, msg, to32)
								end)
							end

							for i, v in pairs(game:GetService("Players"):GetPlayers()) do
								applynew(v)
							end

							game:GetService("Players").PlayerAdded:Connect(function(v)
								applynew(v)
							end)

							setAttribute(ctitle, "Ignore", true)

							onMouseButton1Down(chat, function(pos)
								variables.dragpoint74 = getCursorPoint() - chat.AbsolutePosition
								variables.drag74 = true
							end)

							functions[#functions + 1] = {typebar.FocusLost,
								function(ep)
									if not ep then
										return
									end

									local text = typebar.Text

									if string.len(text) <= 0 then
										return
									end

									if variables.privatemessage32 then
										text = tag..encodetext(text)
									end

									if chatevent then
										if variables.privatemessage32 then
											game:GetService("Players"):Chat(text)
										else
											chatevent:FireServer(text, "All")
											addmsg(plr, text)
										end
									elseif variables.privatemessage32 and not variables.usechatservice32 then
										game:GetService("Players"):Chat(text)
									elseif variables.usechatservice32 and chatService:FindFirstChild("TextChannels") and chatService:FindFirstChild("TextChannels"):FindFirstChild("RBXGeneral") then
										chatService:FindFirstChild("TextChannels"):FindFirstChild("RBXGeneral"):SendAsync(text)
									else
										addmsg(plr, text)
									end
								end
							}

							local incomingids = {}

							chatService.OnIncomingMessage = function(textChatMessage)
								task.spawn(function()
									if not variables.usechatservice32 then
										return
									end

									if uiClosed then
										return
									end

									local msg = textChatMessage.Text
									local player = game:GetService("Players"):FindFirstChild(textChatMessage.TextSource.Name)
									local id = textChatMessage.MessageId

									if table_find(incomingids, id) then
										return
									end

									table.insert(incomingids, id)

									if string.len(split(msg, tag)[1]) <= 0 then
										msg = decodetext(string.gsub(msg, tag, "", 1))
									end

									addmsg(player, msg)

									task.wait(1)

									table.remove(incomingids, table_find(incomingids, id))
								end)
							end

							onTouchEnded(function()
								variables.drag74 = false
							end)

							onMouseMove(function()
								if variables.drag74 and chat.Visible then
									local newp = UDim2.new(0, getCursorPoint().X - variables.dragpoint74.X, 0,
										getCursorPoint().Y - variables.dragpoint74.Y)
									local xs = math.min(math.max(newp.X.Offset, 0), wspace.CurrentCamera.ViewportSize.X -
										chat.AbsoluteSize.X)
									local ysize = chat.AbsoluteSize.Y + guiinset.Y
									local ys = math.min(math.max(newp.Y.Offset, 0), wspace.CurrentCamera.ViewportSize.Y - ysize)
									newp = UDim2.new(0, xs, 0, ys)
									local tween = TS:Create(chat, TweenInfo.new(0.1), {Position = newp})
									tween:Play()
								end
							end)
						elseif variables.schat34 then
							variables.schat34.Visible = true
						end
					end,
					["Stopper"] = function()
						if variables.schat34 and variables.schat34.Visible then
							variables.schat34.Visible = false
						end
					end,
				},
				["Esp"] = {
					["ID"] = 10,
					["SourceText"] = "<option>; innertxt='Esp';",
					["Runner"] = function()
						variables.espon213 = true

						if variables.espobjects32 then
							for i, v in ipairs(variables.espobjects32) do
								if v:IsA("Highlight") then
									v.Enabled = true
								elseif v:IsA("Frame") or v:IsA("TextLabel") then
									v.Visible = true
								end
							end
							return
						end

						variables.espobjects32 = {}

						local function prepareHighlights(v)
							if v ~= plr then
								if variables.espon213 == nil then
									return
								end

								local billboardgui = Instance.new("BillboardGui", coreui)
								billboardgui.AlwaysOnTop = true
								billboardgui.ResetOnSpawn = false
								billboardgui.Name = v.Name
								billboardgui.StudsOffset = Vector3.new(0, 1, 0)
								billboardgui.Size = UDim2.new(0, 200, 0, 40)

								local textlabel = Instance.new("TextLabel")
								textlabel.Size = UDim2.new(1, 0, 0, 20)
								textlabel.Text = v.Name
								textlabel.BackgroundTransparency = 1
								textlabel.TextSize = 20
								textlabel.TextColor3 = whitew
								textlabel.Position = UDim2.new(0, 0, 0, 0)
								textlabel.Font = classicFont
								textlabel.TextStrokeTransparency = 0.75
								textlabel.Parent = billboardgui

								local frame = Instance.new("Frame", billboardgui)
								frame.Size = UDim2.new(0, 10, 0, 10)
								frame.Position = UDim2.new(0.5, -7, 0, 30)
								frame.BackgroundColor3 = whitew
								frame.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0) end)
								local stroke = nil
								pcall(function()
									stroke = Instance.new("UIStroke", frame)
									stroke.Color = Color3.new(0.3, 0.3, 0.3)
								end)

								local highlight = nil
								pcall(function()
									highlight = Instance.new("Highlight", coreui)
									highlight.Name = v.Name
									highlight.OutlineColor = whitew
									highlight.FillColor = whitew
									highlight.FillTransparency = 0.5
									highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
								end)

								table.insert(variables.espobjects32, textlabel)
								table.insert(variables.espobjects32, frame)
								table.insert(variables.espobjects32, highlight)

								if variables.espon213 == false then
									textlabel.Visible = false
									frame.Visible = false
									if highlight then
										highlight.Visible = false
									end
								end

								addtocolorfunctions(function()
									if billboardgui then
										local xcolor = getplayercolor(v) or whitew
										if highlight then
											highlight.OutlineColor = xcolor
											highlight.FillColor = xcolor
										end
										textlabel.TextColor3 = xcolor
										frame.BackgroundColor3 = xcolor
									end
								end)

								functions[#functions + 1] = {game:GetService("Players").PlayerRemoving,
									function(x)
										if x == v then
											if highlight then
												highlight:Destroy()
											end
											billboardgui:Destroy()
											highlight = nil
											billboardgui = nil
										end
									end
								}

								functions[#functions + 1] = {game:GetService("RunService").Stepped,
									function()
										if v.Character and billboardgui then
											if highlight then
												highlight.Adornee = v.Character
											end
											local head = v.Character:FindFirstChild("Head")
											if head then
												billboardgui.Adornee = head
											end
										end
									end
								}

								task.wait(0.1)
								updateCoreUI()
							end
						end

						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							task.spawn(function()
								prepareHighlights(v)
							end)
						end

						functions[#functions + 1] = {game:GetService("Players").PlayerAdded,
							function(v)
								prepareHighlights(v)
							end
						}
					end,
					["Stopper"] = function()
						variables.espon213 = false
						if variables.espobjects32 then
							for i, v in ipairs(variables.espobjects32) do
								if v:IsA("Highlight") then
									v.Enabled = false
								elseif v:IsA("Frame") or v:IsA("TextLabel") then
									v.Visible = false
								end
							end
						end
					end,
					["OnRemove"] = function()
						variables.espon213 = nil
						if variables.espobjects32 then
							for i, v in ipairs(variables.espobjects32) do
								if v.Parent then
									v:Destroy()
								end
							end
						end
					end
				},
				["ToggleFly"] = {
					["ID"] = 7,
					["SourceText"] = "<option>; innertxt='Toggle Fly';",
					["Runner"] = function()
						if onmobile() then
							if not variables.flybtn32 then
								variables.flybtn32 = createBindableButton("Fly")
							end
							variables.flybtn32.OnClick(function()
								if flying then
									variables.flybtn32:SetLightOff()
									flying = false
									flyoff()
								else
									variables.flybtn32:SetLightOn()
									flying = true
									flyon()
								end
							end)
						end
						togglefly = true
					end,
					["Stopper"] = function()
						if flying then
							flyoff()
						end
						if variables.flybtn32 then
							variables.flybtn32:Destroy()
							variables.flybtn32 = nil
						end
						togglefly = false
					end,
					["OnRemove"] = function()
						if flying then
							flyoff()
						end
						togglefly = nil
					end
				},
				["FlySpeed"] = {
					["ID"] = 8,
					["SourceText"] = "<rangeval>; innertxt='Fly Speed';maxrange='10';currentrange='2.5';",
					["VariableName"] = "FlySpeed",
				},
				["FOV"] = {
					["ID"] = 9,
					["SourceText"] = "<rangeval>; innertxt='Field Of View';maxrange='120';minrange='20';currentrange='70';",
					["VariableName"] = "FOV34",
				},
				["HitBoxSize"] = {
					["ID"] = 9,
					["SourceText"] = "<rangeval>; innertxt='HitBox Size';maxrange='100';minrange='1';currentrange='1';",
					["VariableName"] = "hitboxsize32",
					["OnChanged"] = function()
						local function applyCharacter(char)
							repeat task.wait() until char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid")

							local human = char:FindFirstChildOfClass("Humanoid")

							if human.RigType == Enum.HumanoidRigType.R6 then
								return
							end

							local root = char:FindFirstChild("HumanoidRootPart")
							root.Size = Vector3.new(variables.hitboxsize32,variables.hitboxsize32,variables.hitboxsize32)
							root.CanCollide = false
						end

						for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v ~= plr and v.Character then
								-- task.spawn(function() applyCharacter(v.Character) end)
							end
						end
					end,
					["AutoRun"] = function()
						local function applyCharacter(char)
							repeat task.wait() until char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid")

							local root = char:FindFirstChild("HumanoidRootPart")
							local human = char:FindFirstChildOfClass("Humanoid")

							if human.RigType == Enum.HumanoidRigType.R6 then
								return
							end

							root.Size = Vector3.new(variables.hitboxsize32, variables.hitboxsize32, variables.hitboxsize32)
							root.CanCollide = false
						end

						local function applyPlayer(player)
							if player == plr then
								return
							end
							if player.Character then
								task.spawn(function() applyCharacter(player.Character) end)
							end
							local c
							c = player.CharacterAdded:Connect(function(char)
								if uiClosed then
									c:Disconnect()
									return
								end
								applyCharacter(char)
							end)
						end

						for _,v in ipairs(game:GetService("Players"):GetPlayers()) do
							-- applyPlayer(v)
						end

						functions[#functions+1] = {game:GetService("Players").PlayerAdded,
							function(v)
								-- applyPlayer(v)
							end
						}
					end
				},
				["ToggleRun"] = {
					["ID"] = 19,
					["SourceText"] = "<option>; innertxt='Toggle Run';",
					["Runner"] = function()
						if not variables.shiftbindable32 then
							if onmobile() then
								variables.shiftbindable32 = createBindableButton("Run")
							end
						end
						togglerun = true
						if variables.shiftbindable32 then
							local toggleshift = false
							variables.shiftbindable32.OnClick(function()
								if toggleshift then
									toggleshift = false
									variables.shiftbindable32:SetLightOff()
									walk()
								else
									toggleshift = true
									variables.shiftbindable32:SetLightOn()
									run()
								end
							end)
						end
					end,
					["Stopper"] = function()
						if variables.shiftbindable32 then
							variables.shiftbindable32:Destroy()
							variables.shiftbindable32 = nil
						end
						if running then
							walk()
						end
						togglerun = false
					end,
					["OnRemove"] = function()
						if running then
							walk()
						end
						togglerun = nil
					end
				},
				["Noclip"] = {
					["ID"] = 20,
					["SourceText"] = "<option>; innertxt='Noclip';",
					["Runner"] = function()
						variables.manualnoclip32 = true
						noclipf()
					end,
					["Stopper"] = function()
						variables.manualnoclip32 = nil
						clipf()
					end,
					["OnRemove"] = function()
						variables.manualnoclip32 = nil
						clipf()
					end
				},
				["InfJump"] = {
					["ID"] = 20,
					["SourceText"] = "<option>; innertxt='Inf Jump';",
					["Runner"] = function()
						variables.infjump32 = uis.JumpRequest:Connect(function()
							if uiClosed then
								variables.infjump32:Disconnect()
								return
							end
							local char = plr.Character
							local human = char and char:FindFirstChildOfClass("Humanoid")
							if human then
								human:ChangeState(Enum.HumanoidStateType.Jumping)
							end
						end)
					end,
					["Stopper"] = function()
						if variables.infjump32 then
							variables.infjump32:Disconnect()
						end
					end,
				},
				["AntiFling"] = {
					["ID"] = 22,
					["SourceText"] = "<option>; innertxt='Anti Fling';",
					["Runner"] = function()
						local id = math.random(1, 10000)
						variables.antiflingbroken = id

						local function blockchar(char)
							local c
							c = game:GetService("RunService").Stepped:Connect(function()
								if variables.antiflingbroken ~= id or uiClosed or not char.Parent then
									c:Disconnect()
									return
								end
								for i, v in ipairs(char:GetChildren()) do
									if v:IsA("BasePart") and v.Velocity ~= Vector3.new(0,0,0) and not getAttribute(v, "KnownPart") then
										v.Velocity = Vector3.new(0,0,0)
									end
								end
							end)
						end

						local function blockplr(v)
							if v == plr then
								return
							end
							if v.Character then
								blockchar(v.Character)
							end
							local c
							c = v.CharacterAdded:Connect(function(char)
								if variables.antiflingbroken ~= id or uiClosed then
									c:Disconnect()
									return
								end
								blockchar(char)
							end)
						end

						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							blockplr(v)
						end

						local c
						c = game:GetService("Players").PlayerAdded:Connect(function(v)
							if variables.antiflingbroken ~= id or uiClosed then
								c:Disconnect()
								return
							end
							blockplr(v)
						end)
					end,
					["Stopper"] = function()
						variables.antiflingbroken = 0
					end,
				},
				["NoCollidedPlayers"] = {
					["ID"] = 22,
					["SourceText"] = "<option>; innertxt='No Collided Players';",
					["Runner"] = function()
						local id = math.random(1, 10000)
						variables.anticollisionbroken = id

						local function blockchar(char)
							local c
							c = game:GetService("RunService").Stepped:Connect(function()
								if variables.anticollisionbroken ~= id or uiClosed or not char.Parent then
									c:Disconnect()
									return
								end
								for i, v in ipairs(char:GetChildren()) do
									if v:IsA("BasePart") and v.CanCollide and not getAttribute(v, "KnownPart") then
										v.CanCollide = false
									end
								end
							end)
						end

						local function blockplr(v)
							if v == plr then
								return
							end
							if v.Character then
								blockchar(v.Character)
							end
							local c
							c = v.CharacterAdded:Connect(function(char)
								if variables.anticollisionbroken ~= id or uiClosed then
									c:Disconnect()
									return
								end
								blockchar(char)
							end)
						end

						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							blockplr(v)
						end

						local c
						c = game:GetService("Players").PlayerAdded:Connect(function(v)
							if variables.anticollisionbroken ~= id or uiClosed then
								c:Disconnect()
								return
							end
							blockplr(v)
						end)
					end,
					["Stopper"] = function()
						variables.anticollisionbroken = 0
					end,
				},
				["AutoLoadFriendsViewer"] = {
					["ID"] = 23,
					["SourceText"] = "<option>; innertxt='Auto Load Friends Viewer';",
					["Runner"] = function()
						local mod = {}

						function mod:SetupFriendsViewer()
							local Players = game:GetService("Players")

							if coreui:FindFirstChild("FriendsViewer") then
								return
							end

							local ui = Instance.new("ScreenGui")
							local text = Instance.new("TextLabel")
							text.Position = UDim2.new(0.6, 0, 0.2, 0)
							text.Size = UDim2.new(0.4, 0, 0.8, 0)
							text.TextStrokeTransparency = 0
							text.TextStrokeColor3 = Color3.new(0, 0, 0)
							text.TextColor3 = Color3.new(0.85, 0.85, 0.85)
							setFontFace(text, classicFontFaceBold)
							text.TextSize = 25
							text.TextXAlignment = Enum.TextXAlignment.Left
							text.TextYAlignment = Enum.TextYAlignment.Top
							text.Text = "Friends List: "
							text.BackgroundTransparency = 1

							local newtext = ""

							ui.Parent = coreui
							ui.Name = "FriendsViewer"
							text.Parent = ui

							local inserted = {}

							local function iterPageItems(pages)
								return coroutine.wrap(function()
									local pagenum = 1
									while true do
										for _, item in ipairs(pages:GetCurrentPage()) do
											coroutine.yield(item, pagenum)
										end
										if pages.IsFinished then
											break
										end
										pages:AdvanceToNextPageAsync()
										pagenum = pagenum + 1
									end
								end)
							end

							local function checkList(a, b)
								local got = 0
								for i, v in ipairs(inserted) do
									if v[1] == a or v[1] == b then
										if v[2] == a or v[2] == b then
											got = 1
											break
										end
									end
								end
								return got
							end

							local function addToList(a, b)
								if checkList(a, b) == 1 then
									return 1
								end

								table.insert(inserted, {a, b})

								local addText = a.Name .. ": " .. b.Name
								newtext = newtext .. "\n" .. addText
							end

							local function renderB(plrX, retry)
								retry = retry or 0

								if retry > 5 then
									return
								end

								local success, friendPages = pcall(function() return Players:GetFriendsAsync(plrX.UserId) end)

								if not success then
									retry = retry + 1
									task.wait(1)
									renderB(plrX)
									return
								end

								local usernames = {}
								for item, _pageNo in iterPageItems(friendPages) do
									if item.IsOnline then
										table.insert(usernames, item.Username)
									end
								end

								for i, v in ipairs(usernames) do
									if Players:FindFirstChild(v) then
										addToList(plrX, Players:FindFirstChild(v))
									end
								end
							end

							local rewriting = false

							local function rewritelist()
								repeat task.wait() until not rewriting

								rewriting = true
								newtext = ""

								table_clear(inserted)
								for i, v in ipairs(Players:GetPlayers()) do
									renderB(v)
								end

								text.Text = "Friends List: \n" .. newtext

								task.wait(1)

								rewriting = false
							end

							local function rwlist()
								task.spawn(function() rewritelist() end)
							end

							rwlist()

							Players.PlayerAdded:Connect(function()
								wait()
								rwlist()
							end)

							Players.PlayerRemoving:Connect(function()
								wait()
								rwlist()
							end)
						end

						mod:SetupFriendsViewer()
					end,
				},
				["RejoinSameServer"] = {
					["ID"] = 4,
					["SourceText"] = "<btn>; innertxt='Rejoin Same Server';",
					["Runner"] = function()
						teleportplrplaceinstance(tonumber(game.PlaceId), game.JobId)
					end,
				},
				["Rejoin"] = {
					["ID"] = 4,
					["SourceText"] = "<btn>; innertxt='Rejoin';",
					["Runner"] = function()
						teleportplr(game.PlaceId)
					end,
				},
				["JoinLastServer"] = {
					["ID"] = 4,
					["SourceText"] = "<btn>; innertxt='Join Last Server';",
					["Runner"] = function()
						local lastserver = settingsHUB["LastServer"]
						if lastserver then
							local placeid = lastserver.PlaceId or game.PlaceId
							local jobid = lastserver.JobId
							if jobid then
								teleportplrplaceinstance(placeid, jobid)
							end
						end
					end,
				},
				["ServerHop"] = {
					["ID"] = 4,
					["SourceText"] = "<btn>; innertxt='Server-Hop';",
					["Runner"] = function()
						if coreui == gameui then
							Notification(nameH .. "UI", "The current thread cannot access HttpGet. U can use an executor.", 3, 3)
							return
						end

						local AllIDs = {}
						local PlaceID = game.PlaceId
						local foundAnything = ""
						local actualHour = os.date("!*t").hour
						local found = false

						local function TPReturner()
							local Site;
							if foundAnything == "" then
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
									PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
							else
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
									PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
							end
							local ID = ""
							if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
								foundAnything = Site.nextPageCursor
							end
							local num = 0;
							for i, v in pairs(Site.data) do
								local Possible = true
								ID = tostring(v.id)
								if tonumber(v.maxPlayers) > tonumber(v.playing) then
									for _, Existing in pairs(AllIDs) do
										if num ~= 0 then
											if ID == tostring(Existing) then
												Possible = false
											end
										else
											if tonumber(actualHour) ~= tonumber(Existing) then
												local delFile = pcall(function()
													AllIDs = {}
													table.insert(AllIDs, actualHour)
												end)
											end
										end
										num = num + 1
									end
									if Possible == true then
										found = true
										table.insert(AllIDs, ID)
										task.wait()
										local xsuccess, result = pcall(function()
											game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
										end)
										task.wait(4)
										if xsuccess then
											break
										end
									end
								end
							end
						end

						while wait() do
							pcall(function()
								TPReturner()
								if foundAnything ~= "" then
									TPReturner()
								end
							end)
						end

						if not found then
							task.spawn(function() Notification(nameH .. "HUB", "Error could not find a server.", 2, 3) end)
						end
					end,
				},
				["RefreshThreads"] = {
					["ID"] = 1,
					["SourceText"] = "<btn>; innertxt='Refresh Threads';",
					["Runner"] = function()
						disconnectThreads()
						task.wait()
						connectThreads()
					end,
				},
				["ReloadSameScript"] = {
					["ID"] = 1,
					["SourceText"] = "<btn>; innertxt='Reload Same Script';",
					["Runner"] = function()
						saveSettings()
						unloadtheHUB()
						task.spawn(function() mod:P4H() end)
					end,
				},
				["BackToDefaultSettings"] = {
					["ID"] = 1,
					["SourceText"] = "<btn>; innertxt='Back to Default Settings';",
					["Runner"] = function()
						settingsHUB = JSONDecode(defaultSettings)
						saveSettings()
						unloadtheHUB()
						task.spawn(function() mod:P4H() end)
					end,
				},
				["AntiLag"] = {
					["ID"] = 3,
					["SourceText"] = "<option>; innertxt='AntiLag';",
					["Runner"] = function()
						if variables.optimized34 then
							return
						end
						local lighting = game:GetService("Lighting")
						lighting.ClockTime = 0
						lighting.OutdoorAmbient = Color3.new()
						lighting.GlobalShadows = false
						lighting.ShadowSoftness = 0
						lighting.Ambient = Color3.new(1, 1, 1)
						lighting.ColorShift_Bottom = Color3.new()
						lighting.ColorShift_Top = Color3.new()
						lighting.EnvironmentDiffuseScale = 0
						lighting.EnvironmentSpecularScale = 0
						lighting.FogColor = Color3.new()
						local function check(v)
							local reting = false
							for _, d in ipairs(game.Players:GetPlayers()) do
								if d.Character and v:IsDescendantOf(d.Character) then
									reting = true
									break
								end
							end
							if reting then
								return
							end
							if (string.match(v.ClassName, "Mesh") and not v:IsA("MeshPart")) or v:IsA("Texture") or v:IsA("Decal") then
								v:Destroy()
								return
							elseif v:IsA("Part") then
								v.Shape = Enum.PartType.Block
								v.Material = Enum.Material.SmoothPlastic
								return
							end
							if v:IsA("MeshPart") then
								v.TextureID = ""
							end
							if v:IsA("BasePart") and not v:IsA("Terrain") then
								v.Material = Enum.Material.SmoothPlastic
							end
						end
						for i, v in ipairs(getDescendants(wspace)) do
							check(v)
						end
						variables.optimized34 = wspace.DescendantAdded:Connect(function(v)
							check(v)
						end)
					end,
					["Stopper"] = function()
						if variables.optimized34 then
							variables.optimized34:Disconnect()
							variables.optimized34 = nil
						end
					end,
				},
				["FreeCam"] = {
					["ID"] = 2,
					["SourceText"] = "<option>; innertxt='FreeCam';",
					["Runner"] = function()
						local pm = plr:FindFirstChild("PlayerScripts"):FindFirstChild("PlayerModule") and
							require(plr:FindFirstChild("PlayerScripts"):FindFirstChild("PlayerModule"))

						if variables["fcon32"] ~= nil then
							if pm then
								pm:GetControls():Disable()
							elseif plr.Character and plr.Character.PrimaryPart then
								plr.Character.PrimaryPart.Anchored = true
							end
							variables["fcon32"] = true
							wspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
							return
						end

						if pm then
							pm:GetControls():Disable()
						elseif plr.Character and plr.Character.PrimaryPart then
							plr.Character.PrimaryPart.Anchored = true
						end

						variables["fcon32"] = true
						wspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable

						local keys = {0, 0, 0, 0, 0, 0, 0}
						local delta = Vector3.new()
						local camera = workspace.CurrentCamera
						local moving = false
						local move = nil
						local target = nil
						local target_ = nil
						local targetdist = 0
						local campos = camera.CFrame.Position

						functions[#functions + 1] = {uis.InputBegan, function(key)
							if variables["fcon32"] == false then
								return
							end
							if key.KeyCode == Enum.KeyCode.W or key.KeyCode == Enum.KeyCode.Up then
								keys[1] = 1
							end
							if key.KeyCode == Enum.KeyCode.A or key.KeyCode == Enum.KeyCode.Left then
								keys[2] = 1
							end
							if key.KeyCode == Enum.KeyCode.S or key.KeyCode == Enum.KeyCode.Down then
								keys[3] = 1
							end
							if key.KeyCode == Enum.KeyCode.D or key.KeyCode == Enum.KeyCode.Right then
								keys[4] = 1
							end
							if key.KeyCode == Enum.KeyCode.E then
								keys[5] = 1
							end
							if key.KeyCode == Enum.KeyCode.Q then
								keys[6] = 1
							end
							if key.KeyCode == Enum.KeyCode.RightShift or key.KeyCode == Enum.KeyCode.LeftShift then
								variables["fcspeed34"] = variables["fcspeed34"] / 8
							end
						end}

						functions[#functions + 1] = {uis.InputEnded, function(key)
							if variables["fcon32"] == false then
								return
							end
							if key.KeyCode == Enum.KeyCode.W or key.KeyCode == Enum.KeyCode.Up then
								keys[1] = 0
							end
							if key.KeyCode == Enum.KeyCode.A or key.KeyCode == Enum.KeyCode.Left then
								keys[2] = 0
							end
							if key.KeyCode == Enum.KeyCode.S or key.KeyCode == Enum.KeyCode.Down then
								keys[3] = 0
							end
							if key.KeyCode == Enum.KeyCode.D or key.KeyCode == Enum.KeyCode.Right then
								keys[4] = 0
							end
							if key.KeyCode == Enum.KeyCode.E then
								keys[5] = 0
							end
							if key.KeyCode == Enum.KeyCode.Q then
								keys[6] = 0
							end
							if key.KeyCode == Enum.KeyCode.RightShift or key.KeyCode == Enum.KeyCode.LeftShift then
								variables["fcspeed34"] = variables["fcspeed34"] * 8
							end
						end}

						local function moveCamera()
							if variables["fcon32"] == false then
								return
							end
							local cframe = camera.CFrame +
								(keys[1] * camera.CFrame.LookVector - keys[2] * camera.CFrame.RightVector - keys[3] * camera.CFrame.LookVector + keys[4] * camera.CFrame.RightVector + keys[5] * camera.CFrame.UpVector - keys[6] * camera.CFrame.UpVector) *
								variables["fcspeed34"]
							for i, v in ipairs(keys) do
								if v == 1 then
									variables["fccampos32"] = cframe.Position
									targetdist = 0
									target_ = nil
									break
								end
							end
							if onmobile() then
								cframe = camera.CFrame + getmovedir()
							end
							camera.CFrame = cframe
						end

						local function cameramove(key)
							if variables["fcon32"] == false then
								return
							end
							if key.UserInputType == Enum.UserInputType.MouseMovement then
								local delt = key.Delta
								delta = delta + (delt / 2)
								delta = Vector3.new(delta.X, math.clamp(delta.Y, -100, 100), 0)
								local cf = (CFrame.fromOrientation(-delta.Y / 100 * math.pi / 2, -delta.X / 100 * math.pi / 2, 0) + camera.CFrame.Position)
								camera.CFrame = cf:ToWorldSpace(CFrame.new(Vector3.new(0, 0, targetdist)))
							end
						end

						local gstart = tick()

						functions[#functions + 1] = {uis.InputBegan, function(key, l)
							if variables["fcon32"] == false or onmobile() then
								return
							end
							if key.UserInputType == Enum.UserInputType.MouseButton2 then
								local start = tick()
								local target2 = mouse.Target
								target = target2
								local got = false

								task.spawn(function()
									mouse.Button2Up:Wait()
									got = true
								end)

								moving = true
								uis.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
								move = uis.InputChanged:Connect(cameramove)

								repeat task.wait() until got or tick() - start > xtimeout

								if tick() - gstart <= xtimeout then
									if target2 and target2 == target then
										moving = false
										uis.MouseBehavior = Enum.MouseBehavior.Default
										if move then
											move:Disconnect()
											move = nil
										end

										targetdist = target2.Size.Magnitude
										campos = target2.Position
										local x, y, z = camera.CFrame:ToOrientation()
										local cf = (CFrame.fromOrientation(x, y, z) + campos)
										camera.CFrame = cf:ToWorldSpace(CFrame.new(Vector3.new(0, 0, targetdist)))
										target_ = target2
									end
								end

								gstart = tick()
							end
						end}

						functions[#functions + 1] = {uis.InputEnded, function(key, l)
							if variables["fcon32"] == false then
								return
							end
							if key.UserInputType == Enum.UserInputType.MouseButton2 then
								moving = false
								uis.MouseBehavior = Enum.MouseBehavior.Default
								if move then
									move:Disconnect()
									move = nil
								end
							end
						end}

						functions[#functions + 1] = {mouse.WheelForward, function()
							if variables["fcon32"] == false then
								return
							end
							if targetdist <= 0 then
								local x = mouse.X
								local y = mouse.Y
								local vpx = camera.ViewportSize.X
								local vpy = camera.ViewportSize.Y
								local direc = mouse.UnitRay.Direction
								local direction = mouse.Hit.LookVector
								camera.CFrame = camera.CFrame + (direction * variables["fcspeed34"] * 8)
								campos = camera.CFrame.Position
							else
								for i = 1, 5 do
									task.wait()
									if targetdist >= 1 then
										targetdist = math.max(targetdist - 4, 0.01)
										local x, y, z = camera.CFrame:ToOrientation()
										local cf = (CFrame.fromOrientation(x, y, z) + campos)
										camera.CFrame = cf:ToWorldSpace(CFrame.new(Vector3.new(0, 0, targetdist)))
									end
								end
							end
						end}

						functions[#functions + 1] = {mouse.WheelBackward, function()
							if variables["fcon32"] == false then
								return
							end
							if targetdist <= 0 then
								local x = mouse.X
								local y = mouse.Y
								local vpx = camera.ViewportSize.X
								local vpy = camera.ViewportSize.Y
								local direc = mouse.UnitRay.Direction
								local direction = mouse.Hit.LookVector
								camera.CFrame = camera.CFrame - (direction * variables["fcspeed34"] * 8)
								campos = camera.CFrame.Position
							else
								for i = 1, 5 do
									task.wait()
									targetdist = targetdist + 4
									local x, y, z = camera.CFrame:ToOrientation()
									local cf = (CFrame.fromOrientation(x, y, z) + campos)
									camera.CFrame = cf:ToWorldSpace(CFrame.new(Vector3.new(0, 0, targetdist)))
								end
							end
						end}

						game:GetService("RunService"):BindToRenderStep("Move", 1, moveCamera)

						functions[#functions + 1] = {game:GetService("RunService").RenderStepped, function()
							if variables["fcon32"] == false then
								return
							end
							if onmobile() then
								wspace.CurrentCamera.CameraType = Enum.CameraType.Custom
								wspace.CurrentCamera.CameraSubject = nil
							else
								wspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
							end
							if target_ then
								campos = target_.Position
								local x, y, z = camera.CFrame:ToOrientation()
								local cf = (CFrame.fromOrientation(x, y, z) + campos)
								camera.CFrame = cf:ToWorldSpace(CFrame.new(Vector3.new(0, 0, targetdist)))
							end
						end}
					end,
					["Stopper"] = function()
						local pm = plr:FindFirstChild("PlayerScripts"):FindFirstChild("PlayerModule") and
							require(plr:FindFirstChild("PlayerScripts"):FindFirstChild("PlayerModule"))
						if pm then
							pm:GetControls():Enable()
						elseif plr.Character and plr.Character.PrimaryPart then
							plr.Character.PrimaryPart.Anchored = false
						end
						variables["fcon32"] = false
						wspace.CurrentCamera.CameraType = Enum.CameraType.Custom
					end,
				},
				["FreeCamSpeed"] = {
					["ID"] = 6,
					["SourceText"] = "<rangeval>; innertxt='FreeCam Speed';maxrange='10';minrange='0';currentrange='2';",
					["VariableName"] = "fcspeed34",
				},
				["FERemoveTool"] = {
					["ID"] = 18,
					["SourceText"] = "<selector>; innertxt='FE Remove Tool';",
					["Runner"] = function(selectedN)
						local char = plr.Character
						local bp = plr:FindFirstChildOfClass("Backpack")
						local found = nil

						if bp and bp:FindFirstChild(selectedN) then
							found = bp:FindFirstChild(selectedN)
						elseif char and char:FindFirstChild(selectedN) then
							found = char:FindFirstChild(selectedN)
						end

						if char and bp and found then
							local fpdh = wspace.FallenPartsDestroyHeight
							if found:FindFirstChild("Handle") then
								found:FindFirstChild("Handle").CFrame = CFrame.new(Vector3.new(0,fpdh+5,0))
							end
							equipToolWithoutWeld(found)
						end
					end,
					["SelectorRunner"] = function(uiobject)
						local function updatelist()
							local sz = 0
							for i, v in ipairs(uiobject:GetChildren()) do
								if v:IsA 'TextButton' and v.Name ~= "Hover" then
									sz = sz + 1
								end
							end
							uiobject.CanvasSize = UDim2.new(0, 0, 0, optionsizey * sz + (selectorpadding * (sz - 1)))
						end

						local function addtolist(v)
							if typeof(v) == "string" then
								local button = prepareoption(uiobject, v, whitew)
								updatelist()
								return button
							end
						end

						local function onObject(v)
							if v:IsA("Tool") then
								local bp = plr:FindFirstChildOfClass("Backpack")
								local char = plr.Character
								repeat task.wait() until v:FindFirstChild("Handle")
								local button = addtolist(v.Name)
								local a1
								a1 = v.Changed:Connect(function()
									if not bp.Parent or not char.Parent or (v.Parent ~= bp and v.Parent ~= char)  then
										if button then
											button:Destroy()
										end
										a1:Disconnect()
										a1 = nil
										return
									end
								end)
							end
						end

						local function onNewCharacter(char)
							repeat task.wait() until plr:FindFirstChildOfClass("Backpack") and char.PrimaryPart
							local bp = plr:FindFirstChildOfClass("Backpack")

							local tools = {}

							for i,v in ipairs(bp:GetChildren()) do
								if v:IsA("Tool") then
									table.insert(tools, v)
									task.spawn(function() onObject(v) end)
								end
							end

							for i,v in ipairs(char:GetChildren()) do
								if v:IsA("Tool") then
									table.insert(tools, v)
									task.spawn(function() onObject(v) end)
								end
							end

							local a1
							a1 = bp.ChildAdded:Connect(function(v)
								if uiClosed or not bp.Parent or not char.Parent then
									a1:Disconnect()
									a1 = nil
									return
								end
								if not table_find(tools, v) and v:IsA("Tool") then
									table.insert(tools, v)
									onObject(v)
								end
							end)

							local a2
							a2 = char.ChildAdded:Connect(function(v)
								if uiClosed or not bp.Parent or not char.Parent then
									a2:Disconnect()
									a2 = nil
									return
								end
								if not table_find(tools, v) and v:IsA("Tool") and v.Parent ~= bp then
									table.insert(tools, v)
									onObject(v)
								end
							end)
						end

						if plr.Character then
							onNewCharacter(plr.Character)
						end

						local a1
						a1 = plr.CharacterAdded:Connect(function(char)
							if uiClosed then
								a1:Disconnect()
								a1 = nil
								return
							end
							onNewCharacter(char)
						end)
					end
				},
				["TouchPlayersToTool"] = {
					["ID"] = 18,
					["SourceText"] = "<option>; innertxt='Touch Players to Tool'; dontsavethis='true'",
					["Runner"] = function()
						local char = plr.Character

						local lastf = plr.CharacterAdded:Connect(function(charx)
							char = charx
						end)

						variables.teleportplrstotool32 = true

						local lasttool = nil
						local lasttooltouchable = nil

						while variables.teleportplrstotool32 and not uiClosed do
							task.wait()
							if char then
								local tool = char:FindFirstChildOfClass("Tool")
								local handle = tool and tool:FindFirstChild("Handle")

								if handle then
									if lasttool ~= tool then
										if lasttool and lasttool:FindFirstChild("Handle") then
											lasttool:FindFirstChild("Handle").CanTouch = lasttooltouchable
										end

										lasttool = tool
										lasttooltouchable = handle.CanTouch
									end

									handle.CanTouch = true

									for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
										local tchar = v.Character
										local ra = tchar and (tchar:FindFirstChild("Left Arm") or tchar:FindFirstChild("LeftHand"))

										if ra and v ~= plr then
											ra:BreakJoints()
											ra.CFrame = handle.CFrame
											ra.CanCollide = false
										end
									end
								end
							end
						end

						if lastf then
							lastf:Disconnect()
						end

						if lasttool then
							if lasttool and lasttool:FindFirstChild("Handle") then
								lasttool:FindFirstChild("Handle").CanTouch = lasttooltouchable
							end
						end
					end,
					["OnRemove"] = function()
						variables.teleportplrstotool32 = nil
					end,
					["Stopper"] = function()
						variables.teleportplrstotool32 = nil
					end
				},
				["CreateRandomRightGrip"] = {
					["ID"] = 18,
					["SourceText"] = "<btn>; innertxt='Create Random RightGrip';",
					["Runner"] = function()
						local bp = plr:FindFirstChildOfClass("Backpack")
						local char = plr.Character
						local tool = nil
						local handle = nil
						for i, v in ipairs(bp:GetChildren()) do
							if v:IsA("Tool") and v:FindFirstChild("Handle") then
								tool = v
								handle = v:FindFirstChild("Handle")
								break;
							end
						end
						if tool and handle and char then
							local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
							if ra then
								local gripattachment = ra:FindFirstChild("RightGripAttachment")
								local weld = Instance.new("Weld")
								weld.Name = "RightGrip"
								weld.Part0 = ra
								weld.Part1 = handle
								if gripattachment then
									weld.C0 = gripattachment.CFrame
								else
									weld.C0 = CFrame.fromOrientation(-math.rad(90), 0, 0)
								end
								weld.C1 = tool.Grip
								weld.Parent = ra
							end
						else
							Notification(nameH .. "UI", "Any tool required.", 2, 3)
						end
					end,
				},
				["BuildInterfaceGraphics"] = {
					["ID"] = 22,
					["SourceText"] = "<option>; innertxt='Build Interface Graphics';",
					["Runner"] = function()
						repeat task.wait() until variables.buildInterfaceGraphics
						variables.interfacegraphics32 = variables.buildInterfaceGraphics()
					end,
					["OnRemove"] = function()
						if variables.interfacegraphics32 then
							variables.interfacegraphics32:Unload()
							variables.interfacegraphics32 = nil
						end
					end,
					["Stopper"] = function()
						if variables.interfacegraphics32 then
							variables.interfacegraphics32:Unload()
							variables.interfacegraphics32 = nil
						end
					end
				},
			},
			["If RejectCharacterDeletions Disabled"] = {
				["Bring&Void Protection"] = {
					["SourceText"] = "<option>; innertxt='Bring&Void Protection';",
					["Runner"] = function()
						local function applyCharacter(char)
							if variables.BVProtect32 then
								variables.BVProtect32:Disconnect()
								variables.BVProtect32 = nil
							end

							variables.BVProtect32 = char.ChildAdded:Connect(function(tool)
								if not tool:IsA("Tool") then
									return
								end

								local oldCFrame = char.PrimaryPart.CFrame
								local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")

								local function ifThreat()
									task.wait()
									tool.Parent = plr:FindFirstChildOfClass("Backpack")
									task.defer(function()
										tool:Destroy()
										char:SetPrimaryPartCFrame(oldCFrame)
									end)
								end

								if not ra then
									ifThreat()
								end

								local function clean()
									folder:Destroy()
									local rightGrip = Instance.new("Weld")
									local attachment = ra:FindFirstChild("RightGripAttachment")
									rightGrip.C0 = CFrame.new()
									rightGrip.C1 = attachment and attachment.CFrame or CFrame.new()
									rightGrip.Part0 = ra
									rightGrip.Part1 = tool:WaitForChild("Handle")
									rightGrip.Name = "RightGrip"
									rightGrip.Parent = ra
								end

								local grabber = checkGripJoint(tool:WaitForChild("Handle"))
								if grabber then
									if not getAttribute(grabber, "JobIdX") or getAttribute(char, "JobIdX") <= getAttribute(grabber, "JobIdX") then
										local folder = Instance.new("Folder")
										folder.Name = "RightGrip"
										folder.Parent = ra
										ifThreat()
										task.spawn(function() Notification(nameH.."UI", grabber.Name .. " tried to Bring or Void you.", 3, 2) end)
									end
								end
							end)
						end

						if plr.Character then
							applyCharacter(plr.Character)
						end

						local c
						c = plr.CharacterAdded:Connect(function(char)
							if not variables.BVProtect32 or uiClosed then
								c:Disconnect()
								return
							end
							applyCharacter(char)
						end)
					end,
					["OnRemove"] = function()
						if variables.BVProtect32 then
							variables.BVProtect32:Disconnect()
							variables.BVProtect32 = nil
						end
					end,
					["Stopper"] = function()
						if variables.BVProtect32 then
							variables.BVProtect32:Disconnect()
							variables.BVProtect32 = nil
						end
					end,
				},
				["GiveHats"] = {
					["ID"] = 7,
					["SourceText"] = "<selector>; innertxt='FE Give Hats';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v
								break
							end
						end
						local char = plr.Character
						if target and char and char.PrimaryPart and target.Character and target.Character.PrimaryPart and plr.Character:FindFirstChildOfClass("Humanoid") then
							local tchar = target.Character
							local human = char:FindFirstChildOfClass("Humanoid")
							local accessories = human:GetAccessories()
							local h2 = human:Clone()

							human:Destroy()
							h2.Parent = char

							local broken = false

							for i, v in ipairs(accessories) do
								local handle = v:FindFirstChild("Handle")
								if handle then
									handle.Anchored = true
									task.spawn(function()
										repeat
											tchar:SetPrimaryPartCFrame(handle.CFrame)
											task.wait()
										until v.Parent ~= char or not char.Parent or broken or not handle.Parent
										broken = true
										handle.Anchored = false
									end)
								end
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["BeInvisible"] = {
					["ID"] = 8,
					["SourceText"] = "<btn>; innertxt='Be Invisible';",
					["Runner"] = function()
						local char = plr.Character
						if char then
							local root = char:FindFirstChild("HumanoidRootPart") or char
							local torso = char:FindFirstChild("LowerTorso") or char
							local weld = root:FindFirstChild("RootJoint") or torso:FindFirstChild("Root")
							if weld then
								local newweld = weld:Clone()
								newweld.Parent = char
								weld:Destroy()

								if torso.Parent == char then
									torso:Destroy()
								end

								wspace.CurrentCamera.CameraSubject = root
							end
						end
					end,
				},
				["NoArms"] = {
					["ID"] = 6,
					["SourceText"] = "<btn>; innertxt='FE NoArms';",
					["Runner"] = function()
						local char = plr.Character

						if char then
							local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightUpperArm")
							local la = char:FindFirstChild("Left Arm") or char:FindFirstChild("LeftUpperArm")
							if ra then
								ra:Destroy()
							end
							if la then
								la:Destroy()
							end
						end
					end,
				},
				["NoLegs"] = {
					["ID"] = 5,
					["SourceText"] = "<btn>; innertxt='FE NoLegs';",
					["Runner"] = function()
						local char = plr.Character

						if char then
							local ra = char:FindFirstChild("Right Leg") or char:FindFirstChild("RightUpperLeg")
							local la = char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftUpperLeg")
							if ra then
								ra:Destroy()
							end
							if la then
								la:Destroy()
							end
						end
					end,
				},
				["Bring Player"] = {
					["ID"] = 1,
					["SourceText"] = "<selector>; innertxt='Bring Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and target and target.Character and findRoot(target.Character) then
							local char = plr.Character
							local human = plr.Character:FindFirstChildOfClass("Humanoid");
							local tool = nil;
							for i, v in ipairs(plr.Character:GetChildren()) do
								if v:IsA("Tool") and v:FindFirstChild("Handle") then
									tool = v
								end
							end
							if not tool then
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA("Tool") and v:FindFirstChild("Handle") then
										tool = v
									end
								end
							end
							if tool then
								human:UnequipTools()
								local h2 = human:Clone()
								human:Destroy()
								h2.Parent = char
								turnOnJump(h2)
								h2:EquipTool(tool)
								local connection = touchCharacterToPart(target.Character, tool:FindFirstChild("Handle"))
								repeat task.wait() until (tool.Parent ~= wspace and tool.Parent ~= char and tool.Parent ~= plr:FindFirstChildOfClass("Backpack")) or not tool.Parent or not tool:FindFirstChild("Handle")
								connection:Disconnect()
								local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
								local rg = ra:FindFirstChild("RightGrip")
								task.wait(3)
								if rg.Parent then
									rg:Destroy()
								end
							else
								task.spawn(function() Notification("Error Occurred", "Any Tool Required!", 5, 3) end)
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["Void Player"] = {
					["ID"] = 2,
					["SourceText"] = "<selector>; innertxt='Void Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and target and target.Character and findRoot(target.Character) then
							local char = plr.Character
							local human = plr.Character:FindFirstChildOfClass("Humanoid");
							local tool = nil;
							for i, v in ipairs(plr.Character:GetChildren()) do
								if v:IsA("Tool") and v:FindFirstChild("Handle") then
									tool = v
								end
							end
							if not tool then
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA("Tool") and v:FindFirstChild("Handle") then
										tool = v
									end
								end
							end
							if tool then
								human:UnequipTools()
								local h2 = human:Clone()
								human:Destroy()
								h2.Parent = char
								turnOnJump(h2)
								h2:EquipTool(tool)
								local connection = touchCharacterToPart(target.Character, tool:FindFirstChild("Handle"))
								repeat task.wait() until (tool.Parent ~= wspace and tool.Parent ~= char and tool.Parent ~= plr:FindFirstChildOfClass("Backpack")) or not tool.Parent or not tool:FindFirstChild("Handle")
								connection:Disconnect()

								local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
								local rg = ra:FindFirstChild("RightGrip")
								local voidPart = Instance.new("Part", wspace)

								voidPart.Name = "VoidFloor"
								voidPart.Position = Vector3.new(500, wspace.FallenPartsDestroyHeight + 5, 500)
								voidPart.Anchored = true
								voidPart.Color = Color3.new(0.2, 0.2, 0.2)
								voidPart.Transparency = 0.5
								voidPart.Size = Vector3.new(25, 1, 25)

								if char and char.PrimaryPart and human then
									local prevCF = char.PrimaryPart.CFrame
									char:SetPrimaryPartCFrame(voidPart.CFrame + Vector3.new(0, 5, 0))
									wait(2)
									if human then
										rg:Destroy()
										wait(0.5)
										if char and char.PrimaryPart then
											char:SetPrimaryPartCFrame(prevCF)
										end
									end
								end

								voidPart:Destroy()
							else
								task.spawn(function() Notification("Error Occurred", "Any Tool Required!", 5, 3) end)
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["CrashPlayer"] = {
					["ID"] = 3,
					["SourceText"] = "<selector>; innertxt='Crash Player';",
					["Runner"] = function(selectedN)
						local target = nil;
						for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
							if v.Name == selectedN then
								target = v;
							end
						end
						if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and target and target.Character and findRoot(target.Character) then
							local char = plr.Character
							local human = plr.Character:FindFirstChildOfClass("Humanoid");
							local tool = nil;
							for i, v in ipairs(plr.Character:GetChildren()) do
								if v:IsA("Tool") and v:FindFirstChild("Handle") then
									tool = v
								end
							end
							if not tool then
								for i, v in ipairs(plr:FindFirstChildOfClass("Backpack"):GetChildren()) do
									if v:IsA("Tool") and v:FindFirstChild("Handle") then
										tool = v
									end
								end
							end
							if tool then
								local x = flying
								flyoff()
								flying = x

								human:UnequipTools()
								local h2 = human:Clone()
								human:Destroy()
								h2.Parent = char
								turnOnJump(h2)
								h2:EquipTool(tool)
								local connection = touchCharacterToPart(target.Character, tool:FindFirstChild("Handle"))
								repeat task.wait() until (tool.Parent ~= wspace and tool.Parent ~= char and tool.Parent ~= plr:FindFirstChildOfClass("Backpack")) or not tool.Parent or not tool:FindFirstChild("Handle")
								connection:Disconnect()

								if char and char.PrimaryPart and human then
									char:SetPrimaryPartCFrame(CFrame.new(Vector3.new(500, wspace.FallenPartsDestroyHeight + 5, 500)))
								end

								local ra = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
								local rg = ra:FindFirstChild("RightGrip")
								task.wait(3)
								if rg.Parent then
									rg:Destroy()
								end
							else
								task.spawn(function() Notification("Error Occurred", "Any Tool Required!", 5, 3) end)
							end
						end
					end,
					["SelectorRunner"] = function(uiobject)
						runSelectorObject(uiobject, {plr.Name})
					end,
				},
				["God Mode"] = {
					["ID"] = 4,
					["SourceText"] = "<btn>; innertxt='God Mode';",
					["Runner"] = function()
						local char = plr.Character
						if char then
							glitchhumanoid()
						end
					end
				},
			},
		},
	}

	variables.API16 = API

	mainframe.Name = "MainFrame"
	pageframe.Name = "Pages"
	tabs.Name = "Tabs"

	local padding = 7
	local alphabet = split("0123456789abcdefghijklmnopqrsvwxwyz", "")

	local function setup()
		local cpage = nil

		local function updatetabs()
			local y = UDim.new()
			for i, v in ipairs(tabs:GetChildren()) do
				if v:IsA 'TextButton' and v.Visible then
					y = y + (v.Size.Y + UDim.new(0, 3))
				end
			end
			tabs.CanvasSize = UDim2.new(0, 0, y.Scale, y.Offset)
		end

		for i, v in pairs(API) do
			local page = Instance.new("ScrollingFrame", pageframe)
			Instance.new("UIListLayout", page).Padding = UDim.new(0, 5);
			page.TopImage = ""
			page.BottomImage = ""
			page.Position = UDim2.new(0, 0, 0, 0)
			page.Size = UDim2.new(1, 0, 1, 0)
			page.ScrollBarThickness = 3
			pcall(function() page.ScrollBarImageColor3 = Color3.new(0.5, 0.5, 0.5) end)
			page.BorderSizePixel = 0
			page.BackgroundColor3 = white
			page.BackgroundTransparency = 1
			page.Name = i
			local icon = nil;

			local function updatepage()
				local y = UDim.new()
				local lastx = 0
				for i, v in ipairs(page:GetChildren()) do
					if v:IsA 'Frame' and v.Visible and v.Name ~= "Hover" then
						if v.AbsoluteSize.X > lastx then
							lastx = v.AbsoluteSize.X
						end
						y = y + (v.Size.Y + UDim.new(0, 5))
					end
				end
				page.CanvasSize = UDim2.new(0, math.max(lastx,page.AbsoluteSize.X-padding), y.Scale, y.Offset)
			end

			for ix, s in pairs(v) do
				if ix ~= "Icon" and ix ~= "Id" then
					local section = Instance.new("Frame", page)
					section.BorderSizePixel = 0
					pcall(function() Instance.new("UICorner", section).CornerRadius = UDim.new(0, 4); end)
					section.BackgroundColor3 = blackb
					section.Name = ix
					section.Size = UDim2.new(1,0,1,0)

					local sectiononoff = Instance.new("TextButton", section)
					sectiononoff.Text = "";
					sectiononoff.Size = UDim2.new(1, 0, 0, buttonsizey - 2)
					sectiononoff.BackgroundColor3 = blackb
					sectiononoff.Position = UDim2.new(0, 0, 0, 2)
					sectiononoff.BorderSizePixel = 0
					sectiononoff.ZIndex = 2

					local zxyss = 0.05
					local zxyso = sectiononoff.Size.Y.Offset

					local sectionb = Instance.new("ImageLabel", sectiononoff)
					pcall(function() sectionb.Image = icons.Hide; end)
					sectionb.Size = UDim2.new(0, zxyso-3, 1, -8)
					sectionb.Position = UDim2.new(0, 2, 0, 4)
					sectionb.ImageColor3 = lastw
					sectionb.BackgroundTransparency = 1
					sectionb.Rotation = -90
					sectionb.ZIndex = 2

					local ttextt = Instance.new("TextLabel", sectiononoff)
					ttextt.Position = UDim2.new(0, zxyso, 0, 0)
					ttextt.Size = UDim2.new(1, -zxyso, 1, 0)
					setFontFace(ttextt, classicFontFaceSemiBold)
					ttextt.BackgroundTransparency = 1
					ttextt.TextColor3 = lastw
					ttextt.TextSize = 20
					ttextt.TextXAlignment = Enum.TextXAlignment.Left
					ttextt.Text = " " .. ix
					ttextt.ZIndex = 2

					local sectionframe = Instance.new("Frame", section)
					sectionframe.Size = UDim2.new(1, 0, 1, -(buttonsizey+8))
					sectionframe.Position = UDim2.new(0, 0, 0, buttonsizey)
					sectionframe.BackgroundTransparency = 1
					sectionframe.Name = "Section"
					Instance.new("UIPadding", sectionframe).PaddingLeft = UDim.new(0, padding)

					local xll = Instance.new("UIListLayout", sectionframe)
					xll.Padding = UDim.new(0, 2);
					xll.SortOrder = Enum.SortOrder.Name

					local function updatesection()
						local lastx = 0
						local lasty = 0
						if sectionframe.Visible then
							for i, v in ipairs(getDescendants(sectionframe)) do
								if table_find(uiObjectClasses, v.ClassName) and v.Name ~= "Hover" and v.Visible then
									if v.AbsoluteSize.X > lastx then
										lastx = v.AbsoluteSize.X
									end
									if v.AbsolutePosition.Y + v.AbsoluteSize.Y > lasty then
										if not table_find(uiObjectClasses, v.Parent.ClassName) then
											local lp = v.AbsolutePosition.Y
											lasty = lp + v.AbsoluteSize.Y + 5
										elseif v.Parent.Visible and not v.Parent:IsA("ScrollingFrame") then
											local lp = v.AbsolutePosition.Y
											lasty = lp + v.AbsoluteSize.Y + 5
										end
									end
								end
							end
							lasty = lasty - sectionframe.AbsolutePosition.Y
						end
						section.Size = UDim2.new(0, math.max(lastx+3,page.AbsoluteSize.X-padding), 0, lasty + 27)
					end

					local waitingForTween = false
					local osize

					functions[#functions + 1] = {sectiononoff.MouseButton1Click,
						function()
							if waitingForTween == true then
								return
							end
							if sectionframe.Visible then
								waitingForTween = true
								sectionb.Rotation = 180
								osize = section.Size
								section.ClipsDescendants = true
								local tween = TS:Create(section, TweenInfo.new(0.4),{Size = UDim2.new(osize.X.Scale, osize.X.Offset, 0, buttonsizey+2)})
								tween:Play()
								tween.Completed:Wait()
								sectionframe.Visible = false
								waitingForTween = false
							else
								waitingForTween = true
								sectionb.Rotation = -90
								sectionframe.Visible = true
								local tween = TS:Create(section, TweenInfo.new(0.4), {Size = osize})
								tween:Play()
								tween.Completed:Wait()
								section.ClipsDescendants = false
								waitingForTween = false
								updatesection()
							end
							updatepage()
						end
					}

					local uiPadding = Instance.new("UIPadding", sectiononoff)
					uiPadding.PaddingLeft = UDim.new(0, 3)

					functions[#functions + 1] = {sectiononoff.MouseButton1Down, function()
						local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 13)})
						tween:Play()
					end}

					functions[#functions + 1] = {sectiononoff.MouseButton1Up, function()
						local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 7)})
						tween:Play()
					end}

					functions[#functions + 1] = {sectiononoff.MouseEnter,
						function()
							local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 7)})
							tween:Play()
						end
					}

					functions[#functions + 1] = {sectiononoff.MouseLeave,
						function()
							local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 3)})
							tween:Play()
							tween.Completed:Wait()
							task.wait()
							uiPadding.PaddingLeft = UDim.new(0, 3)
						end
					}

					functions[#functions + 1] = {sectionframe.ChildAdded, updatesection}
					functions[#functions + 1] = {sectionframe.ChildRemoved, updatesection}

					local tasks = 0
					local maxtasks = 0

					for index, item in pairs(s) do
						local source = item.SourceText
						if not source then
							return
						end
						local type = split(source, "<")

						if #type > 0 then
							type = split(type[2], ">")[1]

							local sizeString = getStringF(source, "size")
							local cancelled = (getStringF(source, "cancelled") == "true" and true) or false
							local size = UDim2.new(1, -padding, 0, buttonsizey)

							if sizeString and split(sizeString, "udim2")[1] and split(sizeString, "udim2(")[2] then
								local sizestr = split(split(sizeString, "udim2(")[2], ")")[1]
								local sizepack = split(sizestr, ",")
								local xx = tonumber(string.gsub(sizepack[1], " ", ""))
								local xy = tonumber(string.gsub(sizepack[2], " ", ""))
								local yx = tonumber(string.gsub(sizepack[3], " ", ""))
								local yy = tonumber(string.gsub(sizepack[4], " ", ""))
								local x, y, z, a = 0, 0, 0, 0
								if xx then x = xx end
								if xy then y = xy end
								if yx then z = yx end
								if yy then a = yy end
								size = UDim2.new(x, y, z, a)
							elseif sizeString == "fullpage" then
								size = UDim2.new(0, page.AbsoluteSize.X - padding, 0, page.AbsoluteSize.Y)
							end

							local id = item.ID and alphabet[item.ID]
							if type == "btn" then
								local uiobject = Instance.new("Frame", sectionframe)
								local label = Instance.new("TextLabel", uiobject)
								local uiPadding = Instance.new("UIPadding", uiobject)
								uiPadding.PaddingLeft = UDim.new(0, 3)
								uiobject.BorderSizePixel = 0
								uiobject.BackgroundColor3 = white
								uiobject.Size = UDim2.new(1, -padding, 0, buttonsizey)
								uiobject.Name = id or "Button"

								pcall(function() Instance.new("UICorner", uiobject).CornerRadius = UDim.new(0, 4); end)

								label.Text = getStringF(source, "innertxt")
								label.Size = UDim2.new(1, 0, 1, 0)
								label.Font = classicFont
								label.BackgroundTransparency = 1
								label.TextColor3 = whitew
								label.TextSize = uiobjecttextsize
								label.TextXAlignment = Enum.TextXAlignment.Left
								setAttribute(uiobject, "Type", "Button")

								if cancelled then
									local cancelled = Instance.new("TextLabel", uiobject)
									cancelled.Size = UDim2.new(0, 50, 1, 0)
									cancelled.Position = UDim2.new(1, -50, 0, 0)
									cancelled.TextColor3 = Color3.new(0.7, 0, 0)
									cancelled.Font = classicFont
									cancelled.TextSize = 20
									cancelled.BackgroundTransparency = 1
									cancelled.Text = "patched"
									cancelled.ZIndex = 2
								end

								task.spawn(function()
									maxtasks += 1
									runButton(uiobject, item, runUIObjectFunctions(uiobject,uiPadding))
									tasks += 1
								end)
							elseif type == "option" then
								local uiobject = Instance.new("Frame", sectionframe)
								local uiPadding = Instance.new("UIPadding", uiobject)
								uiPadding.PaddingLeft = UDim.new(0, 3)
								uiobject.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", uiobject).CornerRadius = UDim.new(0, 4); end)
								uiobject.Size = UDim2.new(1, -padding, 0, buttonsizey)
								uiobject.BackgroundColor3 = white
								uiobject.Name = id or "Option"
								setAttribute(uiobject, "Type", "Option")
								if cancelled then
									local cancelled = Instance.new("TextLabel", uiobject)
									cancelled.Size = UDim2.new(0, 50, 1, 0)
									cancelled.Position = UDim2.new(1, -50, 0, 0)
									cancelled.TextColor3 = Color3.new(0.7, 0, 0)
									cancelled.Font = classicFont
									cancelled.TextSize = 20
									cancelled.BackgroundTransparency = 1
									cancelled.Text = "patched"
									cancelled.ZIndex = 2
								end
								local bar = Instance.new("Frame", uiobject)
								bar.Name = "Bar"
								bar.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4); end)
								bar.Size = UDim2.new(0.15, 0, 0.8, 0)
								bar.Position = UDim2.new(0.675, 0, 0.1, 0)
								bar.BackgroundColor3 = black
								local title = Instance.new("TextLabel", uiobject)
								title.Font = classicFont
								title.BackgroundTransparency = 1
								title.TextColor3 = whitew
								title.TextSize = uiobjecttextsize
								title.Text = getStringF(source, "innertxt")
								title.TextXAlignment = Enum.TextXAlignment.Left
								title.Size = UDim2.new(0.5, 0, 1, 0)
								title.Name = "Title"
								local onoff = Instance.new("TextButton", bar)
								onoff.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", onoff).CornerRadius = UDim.new(0, 4); end)
								onoff.Text = ""
								onoff.Name = "On/Off"
								onoff.Size = UDim2.new(0.5, 0, 1, 0)
								task.spawn(function()
									maxtasks += 1
									runOption(uiobject, item, runUIObjectFunctions(uiobject,uiPadding), index)
									tasks += 1
								end)
								functions[#functions + 1] = {uiobject.MouseEnter,
									function()
										local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
										tween:Play()
									end}
								functions[#functions + 1] = {uiobject.MouseLeave,
									function()
										local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 3)})
										tween:Play()
										tween.Completed:Wait()
										uiPadding.PaddingLeft = UDim.new(0, 3)
									end
								}
							elseif type == "selector" then
								local uiobject = Instance.new("Frame", sectionframe)
								local uiPadding = Instance.new("UIPadding", uiobject)
								uiPadding.PaddingLeft = UDim.new(0, 3)
								uiobject.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", uiobject).CornerRadius = UDim.new(0, 4); end)
								uiobject.Size = UDim2.new(1, -padding, 0, buttonsizey)
								uiobject.BackgroundColor3 = white
								uiobject.Name = id or "Selector"
								setAttribute(uiobject, "Type", "Selector")
								if cancelled then
									local cancelled = Instance.new("TextLabel", uiobject)
									cancelled.Size = UDim2.new(0, 50, 1, 0)
									cancelled.Position = UDim2.new(1, -50, 0, 0)
									cancelled.TextColor3 = Color3.new(0.7, 0, 0)
									cancelled.Font = classicFont
									cancelled.TextSize = 20
									cancelled.BackgroundTransparency = 1
									cancelled.Text = "patched"
									cancelled.ZIndex = 2
								end
								local titleT = Instance.new("TextLabel", uiobject)
								titleT.Font = classicFont
								titleT.BackgroundColor3 = white
								titleT.TextColor3 = whitew
								titleT.Text = getStringF(source, "innertxt")
								titleT.TextSize = uiobjecttextsize
								titleT.Size = UDim2.new(0.5, 0, 1, 0)
								titleT.BorderSizePixel = 0
								titleT.Name = "Title"
								titleT.TextXAlignment = Enum.TextXAlignment.Left
								local selector = Instance.new("TextButton", uiobject)
								selector.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", selector).CornerRadius = UDim.new(0, 2); end)
								selector.Size = UDim2.new(0.4, 0, 0.85, 0)
								selector.Position = UDim2.new(0.55, 0, 0.075, 0)
								selector.Font = classicFont
								selector.BackgroundColor3 = black
								selector.TextColor3 = whitew
								selector.BorderSizePixel = 0
								selector.Text = "None"
								selector.TextScaled = true
								selector.Name = "Selector"
								local onoff = Instance.new("Frame", selector)
								onoff.Position = UDim2.new(1, -17, 0.5, -8)
								onoff.Size = UDim2.new(0, 15, 0, 15)
								onoff.BackgroundTransparency = 1
								local onoffi = Instance.new("ImageLabel", onoff)
								pcall(function() onoffi.Image = icons.Hide end)
								onoffi.BackgroundTransparency = 1
								onoffi.Position = UDim2.new(0.5, -8, 0.5, -7)
								onoffi.Size = UDim2.new(0, 17, 0, 15)
								onoffi.Rotation = 0
								local UIStroke = nil
								pcall(function()
									UIStroke = Instance.new("UIStroke", selector)
									UIStroke.Color = whitew
									UIStroke.Enabled = false
									UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
									UIStroke.Thickness = 1
								end)
								local selectorscroll = Instance.new("ScrollingFrame", selector)
								Instance.new("UIListLayout", selectorscroll).Padding = UDim.new(0, selectorpadding);
								selectorscroll.ZIndex = 10
								selectorscroll.Size = UDim2.new(1, 0, 0, 0)
								selectorscroll.Position = UDim2.new(0, 0, 1, 1)
								selectorscroll.BackgroundColor3 = black
								selectorscroll.BorderSizePixel = 0
								selectorscroll.Visible = false
								selectorscroll.TopImage = ""
								selectorscroll.BottomImage = ""
								task.spawn(function()
									maxtasks += 1
									runSelector(uiobject, item, runUIObjectFunctions(uiobject,uiPadding), onoffi, updatesection, updatepage, UIStroke)
									tasks += 1
								end)
								functions[#functions + 1] = {uiobject.MouseEnter,
									function()
										local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
										tween:Play()
									end}
								functions[#functions + 1] = {uiobject.MouseLeave,
									function()
										local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 3)})
										tween:Play()
										tween.Completed:Wait()
										uiPadding.PaddingLeft = UDim.new(0, 3)
									end
								}
							elseif type == "bodytxt" then
								local uiobject = Instance.new("TextLabel", sectionframe)
								uiobject.Font = classicFont
								uiobject.BackgroundTransparency = 1
								uiobject.TextColor3 = whitew
								uiobject.Name = id or "PageInfo"
								setAttribute(uiobject, "Type", "PageInfo")
								if getStringF(source, "txtxalign") == "left" then
									uiobject.TextXAlignment = Enum.TextXAlignment.Left
								elseif getStringF(source, "txtxalign") == "center" then
									uiobject.TextXAlignment = Enum.TextXAlignment.Center
								elseif getStringF(source, "txtxalign") == "right" then
									uiobject.TextXAlignment = Enum.TextXAlignment.Right
								end
								if getStringF(source, "txtyalign") == "top" then
									uiobject.TextYAlignment = Enum.TextYAlignment.Top
								elseif getStringF(source, "txtyalign") == "center" then
									uiobject.TextYAlignment = Enum.TextYAlignment.Center
								elseif getStringF(source, "txtyalign") == "bottom" then
									uiobject.TextYAlignment = Enum.TextYAlignment.Bottom
								end
								uiobject.Size = UDim2.new(1,0,1,0)
								uiobject.TextSize = uiobjecttextsize
								uiobject.Text = getStringF(source, "innertxt")
								task.wait()
								uiobject.Size = UDim2.new(0,uiobject.TextBounds.X, 0, uiobject.TextBounds.Y)
								functions[#functions + 1] = {uiobject.MouseEnter,
									function()
										local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
										tween:Play()
									end}
								functions[#functions + 1] = {uiobject.MouseLeave,
									function()
										local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 3)})
										tween:Play()
										tween.Completed:Wait()
										uiPadding.PaddingLeft = UDim.new(0, 3)
									end
								}
							elseif type == "rangeval" then
								local maxrange = tonumber(getStringF(source, "maxrange"))
								local minrange = tonumber(getStringF(source, "minrange")) or 0
								local currentrange = tonumber(getSetting(index)) or tonumber(getStringF(source, "currentrange")) or minrange
								if maxrange then
									variables[item.VariableName] = currentrange
									local uiobject = Instance.new("Frame", sectionframe)
									local uiPadding = Instance.new("UIPadding", uiobject)
									uiPadding.PaddingLeft = UDim.new(0, 3)
									uiobject.BorderSizePixel = 0
									pcall(function() Instance.new("UICorner", uiobject).CornerRadius = UDim.new(0, 4); end)
									uiobject.Size = UDim2.new(1, -padding, 0, buttonsizey)
									uiobject.BackgroundColor3 = white
									uiobject.Name = id or "RangeValue"
									setAttribute(uiobject, "Type", "RangeValue")
									local bar = Instance.new("TextButton", uiobject)
									bar.Text = ""
									bar.Name = "Bar"
									bar.BorderSizePixel = 0
									pcall(function() Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4); end)
									bar.Size = UDim2.new(0.3, 0, 0.8, 0)
									bar.Position = UDim2.new(0.6, 0, 0.1, 0)
									bar.BackgroundColor3 = black
									local title = Instance.new("TextLabel", uiobject)
									title.Font = classicFont
									title.BackgroundTransparency = 1
									title.TextColor3 = whitew
									title.TextSize = uiobjecttextsize
									title.Text = getStringF(source, "innertxt") .. " : " .. currentrange
									title.TextXAlignment = Enum.TextXAlignment.Left
									title.Size = UDim2.new(0.5, 0, 1, 0)
									title.Name = "Title"
									local width = math.max(1 / (maxrange - minrange), 0.1)
									local rangebar = Instance.new("Frame", bar)
									rangebar.Name = "RangeBar"
									rangebar.Size = UDim2.new(0, 0, 1, 0)
									rangebar.BackgroundColor3 = whitew
									rangebar.BorderSizePixel = 0
									pcall(function() Instance.new("UICorner", rangebar).CornerRadius = UDim.new(0, 4); end)
									task.spawn(function()
										maxtasks += 1
										runRangeVal(uiobject, item, runUIObjectFunctions(uiobject,uiPadding), index)
										tasks += 1
									end)
									functions[#functions + 1] = {uiobject.MouseEnter,
										function()
											local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
											tween:Play()
										end}
									functions[#functions + 1] = {uiobject.MouseLeave,
										function()
											local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 3)})
											tween:Play()
											tween.Completed:Wait()
											uiPadding.PaddingLeft = UDim.new(0, 3)
										end
									}
								end
							elseif type == "txtbox" then
								local uiobject = Instance.new("Frame", sectionframe)
								local uiPadding = Instance.new("UIPadding", uiobject)
								uiPadding.PaddingLeft = UDim.new(0, 3)
								uiobject.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", uiobject).CornerRadius = UDim.new(0, 4); end)
								uiobject.Size = UDim2.new(1, -padding, 0, buttonsizey)
								uiobject.BackgroundColor3 = white
								uiobject.Name = id or "TextBox"
								setAttribute(uiobject, "Type", "TextBox")
								local box = Instance.new("TextBox", uiobject)
								box.Name = "Box"
								box.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4); end)
								box.Size = UDim2.new(0.3, 0, 0.85, 0)
								box.Position = UDim2.new(0.6, 0, 0.075, 0)
								box.BackgroundColor3 = black
								box.Font = classicFont
								pcall(function() box.PlaceholderText = getStringF(source, "placeholder") or ""; end)
								box.TextColor3 = whitew
								box.TextSize = 20
								box.TextXAlignment = Enum.TextXAlignment.Left
								box.Text = ""
								box.ClearTextOnFocus = false
								local title = Instance.new("TextLabel", uiobject)
								title.Font = classicFont
								title.BackgroundTransparency = 1
								title.TextColor3 = whitew
								title.TextSize = 20
								title.Text = getStringF(source, "innertxt")
								title.TextXAlignment = Enum.TextXAlignment.Left
								title.Size = UDim2.new(0.5, 0, 1, 0)
								title.Name = "Title"
								task.spawn(function()
									maxtasks += 1
									runTextBox(uiobject, item, runUIObjectFunctions(uiobject,uiPadding))
									tasks += 1
								end)
							elseif type == "keybind" then
								local uiobject = Instance.new("Frame", sectionframe)
								local uiPadding = Instance.new("UIPadding", uiobject)
								uiPadding.PaddingLeft = UDim.new(0, 3)
								uiobject.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", uiobject).CornerRadius = UDim.new(0, 4); end)
								uiobject.Size = UDim2.new(1, -padding, 0, buttonsizey)
								uiobject.BackgroundColor3 = white
								uiobject.Name = id or "KeyBind"
								setAttribute(uiobject, "Type", "KeyBind")
								local button = Instance.new("TextButton", uiobject)
								button.Name = "Button"
								button.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4); end)
								button.Size = UDim2.new(0.15, 0, 0.85, 0)
								button.Position = UDim2.new(0.675, 0, 0.075, 0)
								button.BackgroundColor3 = black
								button.Font = classicFont
								button.TextColor3 = whitew
								button.TextSize = uiobjecttextsize
								local title = Instance.new("TextLabel", uiobject)
								title.Font = classicFont
								title.BackgroundTransparency = 1
								title.TextColor3 = whitew
								title.TextSize = uiobjecttextsize
								title.Text = getStringF(source, "innertxt")
								title.TextXAlignment = Enum.TextXAlignment.Left
								title.Size = UDim2.new(0.5, 0, 1, 0)
								title.Name = "Title"
								task.spawn(function()
									maxtasks += 1
									runKeyBind(uiobject, item, runUIObjectFunctions(uiobject,uiPadding), index)
									tasks += 1
								end)
							elseif type == "searchbox" then
								local uiobject = Instance.new("Frame", sectionframe)
								uiobject.Size = size
								uiobject.BackgroundColor3 = white
								uiobject.BorderSizePixel = 0
								uiobject.Name = id or "SearchBox"
								pcall(function() Instance.new("UICorner", uiobject).CornerRadius = UDim.new(0, 4); end)
								local textbox = Instance.new("TextBox", uiobject)
								textbox.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 4); end)
								textbox.Size = UDim2.new(1, -100, 0, buttonsizey)
								textbox.ClearTextOnFocus = false
								pcall(function() textbox.PlaceholderText = getStringF(source, "innertxt") or "Type" end)
								textbox.Text = ""
								textbox.TextXAlignment = Enum.TextXAlignment.Left
								textbox.TextColor3 = whitew
								textbox.BackgroundColor3 = black
								setFontFace(textbox, classicFontFaceSemiBold)
								textbox.TextSize = 20
								local search = Instance.new("TextButton", uiobject)
								search.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", search).CornerRadius = UDim.new(0, 4); end)
								search.Size = UDim2.new(0, 100, 0, buttonsizey)
								search.Position = UDim2.new(1, -100, 0, 0)
								search.BackgroundColor3 = blackb
								search.TextColor3 = lastw
								search.Text = getStringF(source, "buttontxt") or "Search"
								setFontFace(search, classicFontFaceBold)
								search.TextSize = 20
								local loadingbar = Instance.new("Frame", uiobject)
								loadingbar.Size = UDim2.new(0, 100, 0, 10)
								loadingbar.Position = UDim2.new(1, -100, 1, 0)
								loadingbar.BackgroundTransparency = 1
								loadingbar.Visible = false

								local function setstate(txt)
									search.Text = txt
								end

								local load = SetLoadingFrame(loadingbar,3,0.15,0.2)
								local anim = nil

								local loader = {
									["Play"] = function(self)
										loadingbar.Visible = true
										updatesection()
										anim = load:Connect()
									end,
									["Stop"] = function(self)
										if anim then
											loadingbar.Visible = false
											anim:Disconnect()
											updatesection()
										end
									end
								}

								search.MouseButton1Click:Connect(function()
									item.Runner(textbox.Text, loader, setstate)
									local state = getStringF(source, "buttontxt") or "Search"
									setstate(state)
								end)
							end

							local statevar = getStringF(source, "statevariable")
							if statevar then
								local stateobject = Instance.new("Frame", sectionframe)
								local uiPadding = Instance.new("UIPadding", stateobject)
								uiPadding.PaddingLeft = UDim.new(0, 3)
								stateobject.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", stateobject).CornerRadius = UDim.new(0, 4); end)
								stateobject.Size = UDim2.new(1, -padding, 0, buttonsizey)
								stateobject.BackgroundColor3 = white
								stateobject.Name = id or "State"
								setAttribute(stateobject, "Type", "State")
								local statehighlight = Instance.new("Frame", stateobject)
								statehighlight.BorderSizePixel = 0
								pcall(function() Instance.new("UICorner", statehighlight).CornerRadius = UDim.new(1, 0); end)
								statehighlight.Size = UDim2.new(0, 14, 0, 14)
								statehighlight.Position = UDim2.new(0, 0, 0.5, -7)
								statehighlight.BackgroundColor3 = (variables[statevar] and Color3.new(0, 0.7, 0)) or Color3.new(0.7, 0, 0)
								stateobject.Name = "StateBar"
								local statetext = Instance.new("TextLabel", stateobject)
								statetext.BorderSizePixel = 0
								statetext.Text = "Current " .. getStringF(source, "innertxt") .. " Possibility: No"
								statetext.Size = UDim2.new(1, 0, 1, 0)
								statetext.BackgroundTransparency = 1
								statetext.TextXAlignment = Enum.TextXAlignment.Left
								statetext.Font = classicFont
								statetext.TextSize = uiobjecttextsize
								statetext.TextColor3 = whitew
								Instance.new("UIPadding", statetext).PaddingLeft = UDim.new(0, 19)
								task.spawn(function()
									item.CheckState(
										function()
											local xstate = (variables[statevar] and "Yes") or "No"
											statetext.Text = "Current " .. getStringF(source, "innertxt") .. " Possibility: " .. xstate
											local tween = TS:Create(statehighlight, TweenInfo.new(0.3),{BackgroundColor3 = (variables[statevar] and Color3.new(0, 0.7, 0)) or Color3.new(0.7, 0, 0)})
											tween:Play()
										end
									)
								end)
							end
						end
					end
					updatesection()
				elseif ix == "Icon" and typeof(s) == "string" then
					icon = s;
				end
			end
			updatepage()
			functions[#functions + 1] = {page.ChildAdded, updatepage}
			functions[#functions + 1] = {page.ChildRemoved, updatepage}
			local ttext = i
			if i == "GamePage" then
				ttext = gameName
			end
			local tab = Instance.new("TextButton", tabs)
			tab.Size = UDim2.new(1, -3, 0, tabsizey)
			tab.Text = ""
			tab.BackgroundColor3 = blackb
			tab.BorderSizePixel = 0
			tab.Name = ((v.Id and alphabet[v.Id]) or 1) .. "Tab"
			local xs = tab.AbsoluteSize.Y / tab.AbsoluteSize.X
			local xo = tab.AbsoluteSize.Y
			local iconpadding = 2
			local text = Instance.new("TextLabel", tab)
			text.Size = UDim2.new(1, 0, 1, 0)
			text.TextSize = 22
			text.TextXAlignment = Enum.TextXAlignment.Left
			setFontFace(text, classicFontFaceBold)
			text.TextColor3 = whitew
			text.BackgroundTransparency = 1
			text.Name = "Text"
			text.Text = ttext
			text.TextWrapped = true
			if icon then
				local image = Instance.new("ImageLabel", tab)
				pcall(function() image.Image = icon end)
				image.Size = UDim2.new(0, xo - iconpadding * 2, 0, xo - iconpadding * 2)
				image.Position = UDim2.new(0, iconpadding, 0, iconpadding)
				image.Name = "Icon"
				image.BackgroundTransparency = 1
				text.Size = UDim2.new(1 - xs, 0, 1, 0)
				text.Position = UDim2.new(xs, 2, 0, 0)
			end
			local bar = Instance.new("Frame", tab)
			functions[#functions + 1] = {game:GetService("RunService").RenderStepped,
				function()
					bar.BackgroundColor3 = getRGBColor() or Color3.new(1, 0, 0)
				end
			}
			local paddingbartotext = 0
			bar.BorderSizePixel = 0
			pcall(function() Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4); end)
			bar.Name = "Bar"
			bar.BackgroundColor3 = Color3.new(1, 0, 0)
			bar.Size = UDim2.new(0.05, 0, 0.1, 0)
			bar.Position = UDim2.new(0.4975 + (xs / 2 * paddingbartotext), 0, 0.9, 0)
			if not cpage and (v.Id == 1 or not v.Id) then
				cpage = page
				bar.Size = UDim2.new(1 - xs * paddingbartotext - 0.2, 0, 0.1, 0)
				bar.Position = UDim2.new(xs * paddingbartotext + 0.1, 0, 0.9, 0)
			else
				page.Visible = false
			end
			local uiPadding = Instance.new("UIPadding", tab)
			uiPadding.PaddingLeft = UDim.new(0, 1)
			functions[#functions + 1] = {tab.MouseButton1Down,
				function()
					local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 10)})
					tween:Play()
				end
			}
			functions[#functions + 1] = {tab.MouseButton1Up,
				function()
					local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
					tween:Play()
				end
			}
			functions[#functions + 1] = {tab.MouseEnter,
				function()
					local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 5)})
					tween:Play()
				end
			}
			functions[#functions + 1] = {tab.MouseLeave,
				function()
					local tween = TS:Create(uiPadding, TweenInfo.new(0.2), {PaddingLeft = UDim.new(0, 1)})
					tween:Play()
					tween.Completed:Wait()
					uiPadding.PaddingLeft = UDim.new(0, 1)
				end
			}
			functions[#functions + 1] = {tab.MouseButton1Click,
				function()
					for i, v in ipairs(tabs:GetChildren()) do
						if v:IsA("TextButton") and v:FindFirstChild("Bar") and v.Name ~= "Hover" then
							local tween = TS:Create(v:FindFirstChild("Bar"), TweenInfo.new(0.2),
								{Size = UDim2.new(0.05, 0, 0.1, 0), Position = UDim2.new(0.4975 + (xs / 2 * paddingbartotext), 0, 0.9, 0)})
							tween:Play()
							task.spawn(function()
								tween.Completed:Wait()
								task.wait()
								v:FindFirstChild("Bar").Size = UDim2.new(0.05, 0, 0.1, 0)
								v:FindFirstChild("Bar").Position = UDim2.new(0.4975 + (xs / 2 * paddingbartotext), 0, 0.9, 0)
							end)
						end
					end
					local tween2r = TS:Create(hideframe, TweenInfo.new(0.4), {BackgroundTransparency = 0})
					tween2r:Play()
					local tween = TS:Create(bar, TweenInfo.new(0.3),
						{Size = UDim2.new(1 - xs * paddingbartotext - 0.2, 0, 0.1, 0), Position = UDim2.new(xs * paddingbartotext +
							0.1, 0, 0.9, 0)})
					tween:Play()
					tween.Completed:Wait()
					hideframe.BackgroundTransparency = 0
					task.spawn(function()
						bar.Size = UDim2.new(1 - xs * paddingbartotext - 0.2, 0, 0.1, 0)
						bar.Position = UDim2.new(xs * paddingbartotext + 0.1, 0, 0.9, 0)
					end)
					if cpage then
						cpage.Visible = false
					end
					cpage = page
					cpage.Visible = true
					tween2r = TS:Create(hideframe, TweenInfo.new(0.4), {BackgroundTransparency = 1})
					tween2r:Play()
					tween2r.Completed:Wait()
					hideframe.BackgroundTransparency = 1
				end
			}
		end
		functions[#functions + 1] = {tabs.ChildAdded, updatetabs}
		functions[#functions + 1] = {tabs.ChildRemoved, updatetabs}
		updatetabs()
	end

	task.spawn(function()
		updateplayercolordata()
	end)

	task.wait(1)

	setup()

	local drag = false;
	local dragpoint = Vector2.new();

	function buildMainThreads()
		onMouseButton1Down(mainframe, function(pos)
			dragpoint = getCursorPoint() - mainframe.AbsolutePosition
			drag = true
		end)

		onMouseMove(function()
			if drag and mainframe.Visible then
				local newp = UDim2.new(0, getCursorPoint().X - dragpoint.X, 0, getCursorPoint().Y - dragpoint.Y)
				local xs = math.min(math.max(newp.X.Offset, 0), wspace.CurrentCamera.ViewportSize.X - mainframe.AbsoluteSize.X)
				local ysize = mainframe.AbsoluteSize.Y + guiinset.Y
				if not contentframe.Visible then
					ysize = title.Size.Y.Offset + guiinset.Y + 6
				end
				local ys = math.min(math.max(newp.Y.Offset, 0), wspace.CurrentCamera.ViewportSize.Y - ysize)
				newp = UDim2.new(0, xs, 0, ys)
				local tween = TS:Create(mainframe, TweenInfo.new(0.1), {Position = newp})
				tween:Play()
			end
		end)

		functions[#functions + 1] = {uis.InputBegan,
			function(key, inputingame)
				if key.KeyCode == Enum.KeyCode.F then
					if game.PlaceId == 142823291 or not inputingame then
						if togglefly then
							if not flying then
								flyon()
							else
								flyoff()
							end
						end
					end
				elseif key.KeyCode == Enum.KeyCode.W and not inputingame then
					flykeys[1] = 1
				elseif key.KeyCode == Enum.KeyCode.A and not inputingame then
					flykeys[2] = 1
				elseif key.KeyCode == Enum.KeyCode.S and not inputingame then
					flykeys[3] = 1
				elseif key.KeyCode == Enum.KeyCode.D and not inputingame then
					flykeys[4] = 1
				elseif key.KeyCode == Enum.KeyCode.E then
					flykeys[5] = 1
				elseif key.KeyCode == Enum.KeyCode.Q then
					flykeys[6] = 1
				elseif key.KeyCode == Enum.KeyCode.LeftShift and togglerun then
					run()
				end
			end
		}

		onTouchEnded(function()
			drag = false
		end)

		functions[#functions + 1] = {uis.InputEnded,
			function(key, inputingame)
				if key.KeyCode == Enum.KeyCode.W then
					flykeys[1] = 0
				elseif key.KeyCode == Enum.KeyCode.A and not inputingame then
					flykeys[2] = 0
				elseif key.KeyCode == Enum.KeyCode.S and not inputingame then
					flykeys[3] = 0
				elseif key.KeyCode == Enum.KeyCode.D and not inputingame then
					flykeys[4] = 0
				elseif key.KeyCode == Enum.KeyCode.E and not inputingame then
					flykeys[5] = 0
				elseif key.KeyCode == Enum.KeyCode.Q and not inputingame then
					flykeys[6] = 0
				elseif key.KeyCode == Enum.KeyCode.LeftShift and togglerun then
					walk()
				end
			end
		}

		local hidetween = false

		functions[#functions + 1] = {hide.MouseButton1Click,
			function()
				if hidetween then return end
				hidetween = true
				if contentframe.Visible then
					local tween = TS:Create(mainframe, TweenInfo.new(0.2), {Size = UDim2.new(fsize.X.Scale, fsize.X.Offset, 0,
						aeroY - 4)})
					tween:Play()
					wait(0.2)
					contentframe.Visible = false
				else
					contentframe.Visible = true
					local tween = TS:Create(mainframe, TweenInfo.new(0.2),
						{Size = UDim2.new(fsize.X.Scale, fsize.X.Offset, fsize.Y.Scale, fsize.Y.Offset)})
					tween:Play()
					wait(0.2)
				end
				hidetween = false
			end
		}

		functions[#functions + 1] = {close.MouseButton1Click,
			function()
				if closescreen then return end
				closescreen = true
				local response = question(nameH .. "HUB", "Do you want to close " .. nameH .. "HUB?")
				if response == true then
					unloadtheHUB(true)
				else
					closescreen = false
				end
			end
		}

		functions[#functions + 1] = {game:GetService("RunService").Stepped,
			function()
				variables["rgbindex"] = (variables["rgbindex"] and variables["rgbindex"] + 2) or 0
				border.BackgroundColor3 = getRGBColor() or Color3.new(1, 0, 0)

				if variables.FOV34 then
					wspace.CurrentCamera.FieldOfView = variables.FOV34
				end

				if togglefly and flying then
					flyloop()
				end

				if variables.threads ~= #functions then
					connectThreads()
				end

				variables.threads = #functions
			end
		}

		variables.jobidindex = 0

		for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
			if v.Character then
				variables.jobidindex = variables.jobidindex + 1
				setAttribute(v.Character, "JobIdX", variables.jobidindex)
			end
			functions[#functions + 1] = {v.CharacterAdded,
				function(char)
					table.insert(characters, char)
					variables.jobidindex = variables.jobidindex + 1
					setAttribute(char, "JobIdX", variables.jobidindex)
				end
			}
		end

		functions[#functions + 1] = {game:GetService("Players").PlayerAdded,
			function(v)
				if v.Character then
					variables.jobidindex = variables.jobidindex + 1
					setAttribute(v.Character, "JobIdX", variables.jobidindex)
				end
				functions[#functions + 1] = {v.CharacterAdded,
					function(char)
						table.insert(characters, char)
						variables.jobidindex = variables.jobidindex + 1
						setAttribute(char, "JobIdX", variables.jobidindex)
					end
				}
			end
		}

		functions[#functions + 1] = {game:GetService("Players").PlayerRemoving,
			function(v)
				if v == plr then
					saveSettings()
				end
			end
		}
	end

	local function getMousePoint(frame)
		local ap = frame.AbsolutePosition
		local mp = uis:GetMouseLocation()
		return mp - ap
	end

	variables.buildInterfaceGraphics = function()
		if variables["buildedinterfacegraphics32"] then
			return
		end
		variables["buildedinterfacegraphics32"] = true
		local broken = nil
		local size = UDim2.new(0, 300, 0, 300)
		local hoverbuttons = {}
		local function applyButton(v)
			v.AutoButtonColor = false
			v.ClipsDescendants = true

			local c
			c = v.MouseButton1Click:Connect(function()
				if uiClosed or broken then
					c:Disconnect()
					return
				end
				local clickbutton = Instance.new("Frame")
				clickbutton.BorderSizePixel = 0
				pcall(function() Instance.new("UICorner", clickbutton).CornerRadius = UDim.new(1, 0) end)
				clickbutton.Size = UDim2.new()
				local pos = getMousePoint(v)
				clickbutton.Position = UDim2.new(0, pos.X, 0, pos.Y - guiinset.Y)
				clickbutton.Parent = v
				clickbutton.BackgroundTransparency = 0
				clickbutton.BackgroundColor3 = Color3.new(1, 1, 1)
				clickbutton.ZIndex = v.ZIndex + 2
				clickbutton.Name = "Hover"
				local tween = TS:Create(clickbutton, TweenInfo.new(0.5),
					{
						Size = size, 
						BackgroundTransparency = 1, 
						Position = clickbutton.Position - UDim2.new(0, size.X.Offset / 2, 0, size.Y.Offset / 2)
					}
				)
				tween:Play()
				tween.Completed:Wait()
				clickbutton:Destroy()
			end)
		end

		for i, v in ipairs(getDescendants(ui)) do
			if getAttribute(v.Parent, "Type") ~= "Selector" then
				if v:IsA("TextButton") and not broken then
					applyButton(v)
				end
			end
		end

		local c
		c = ui.DescendantAdded:Connect(function(v)
			if uiClosed or broken then
				c:Disconnect()
				c = nil
				return
			end
			if getAttribute(v.Parent, "Type") ~= "Selector" then
				if v:IsA("TextButton") and not broken then
					applyButton(v)
				end
			end
		end)

		return {
			Unload = function(self)
				broken = true
				variables["buildedinterfacegraphics32"] = nil
			end,
		}
	end

	local function buildButtonColors()
		for i, v in ipairs(getDescendants(ui)) do
			if v:IsA 'TextButton' then
				runMouseHover(v)
			end
		end
		ui.DescendantAdded:Connect(function(v)
			if v:IsA 'TextButton' then
				runMouseHover(v)
			end
		end)
	end

	buildMainThreads()
	connectThreads()
	buildButtonColors()

	local function setClickDetectorRange(detector)
		if detector:IsA("ClickDetector") then
			detector.MaxActivationDistance = math.huge
		end
	end

	local function refreshClickDetectorRange()
		for _, v in ipairs(getDescendants(wspace)) do
			setClickDetectorRange(v)
		end

		local a1

		local function onDescendantAdded(v)
			if uiClosed then
				a1:Disconnect()
				a1 = nil
				return
			end
			setClickDetectorRange(v)
		end

		a1 = wspace.DescendantAdded:Connect(onDescendantAdded)
	end

	local function updateSimulationRadius()
		if setsimulationradius then
			setsimulationradius(math.huge, math.huge)
		elseif sethiddenproperty then
			plr.MaxSimulationRadius = math.huge
			sethiddenproperty(plr, "SimulationRadius", math.huge)
		else
			pcall(function() plr.MaxSimulationRadius = math.huge end)
		end
		if sethiddenproperty then
			sethiddenproperty(wspace, "RejectCharacterDeletions", Enum.RejectCharacterDeletions.Disabled)
		end
	end

	refreshClickDetectorRange()

	task.spawn(function()
		while not uiClosed do
			task.wait()
			updateSimulationRadius()
		end
	end)

	task.spawn(function()
		if game.PlaceId == 142823291 then
			while not uiClosed do
				task.wait(0.8)
				pcall(updateplayercolordata)
				pcall(callcolorfunctions)
			end
		else
			while not uiClosed do
				task.wait()
				pcall(updateplayercolordata)
				pcall(callcolorfunctions)
			end
		end
	end)

	task.spawn(function()
		while task.wait(0.05) do
			pcall(SetIntersectingUIObjects)
		end
	end)

	return API

	--	Logs
	--	___________________________

	--	ADD
	--	___
	--	OOF...: Invisible Character + InvisFling

	--	FIX
	--	___
	--	Build Copier Tool BuildABoat - Waiting for fix D
	--	FreeCam on Mobile - Waiting for fix F-

	--	CHECK
	--	_____


	--	13.400 lines
end

pcall(notify)
mod:P4H()
