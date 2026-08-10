local Library = {}
local function LibraryImport()
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local playergui = player:WaitForChild("PlayerGui")
    local screengui = Instance.new("ScreenGui")
    screengui.ResetOnSpawn = false
    screengui.Name = "ILikePotato9LibraryGui"
    screengui.Parent = playergui
    function Library:CreateWindow(title,name)
        local window = Instance.new("Frame")
        window.Name = name
        window.Size = UDim2.new(0.5,0,0.5,0)
        window.AnchorPoint = Vector2.new(0.5,0.5)
        window.Position = UDim2.new(0.5,0,0.5,0)
        window.BackgroundColor3 = Color3.fromHex("2e2e2e")
        local topbar = Instance.new("Frame")
        topbar.Name = "TopBar"
        topbar.Size = UDim2.new(1,0,0.1,0)
        topbar.BackgroundColor3 = Color3.fromHex("1e1e1e")
        topbar.Parent = window
        local titletext = Instance.new("TextLabel")
        titletext.Name = "Title"
        titletext.Size = UDim2.new(0.5,0,1,0)
        titletext.Text = title
        titletext.BackgroundTransparency = 1
        titletext.TextColor3 = Color3.fromHex("ffffff")
        titletext.TextScaled = true
        titletext.TextXAlignment = Enum.TextXAlignment.Left
        titletext.TextYAlignment = Enum.TextYAlignment.Center
        titletext.Font = Enum.Font.GothamBold
        titletext.Parent = topbar
        window.Parent = screengui
        return window
    end
end
LibraryImport()
return Library
