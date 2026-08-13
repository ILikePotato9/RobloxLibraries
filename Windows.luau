local function Window(name,title,screengui)
    local frame = Instance.new("Frame")
    local topbar = Instance.new("Frame")
    local titletext = Instance.new("TextLabel")
    local sidebar = Instance.new("ScrollingFrame")
    local layout = Instance.new("UIListLayout")
    local data = {
        Title = title,
        MainColor = Color3.fromHex("1e1e1e"),
        AccentColor = Color3.fromHex("00ffff"),
        MainColor2 = Color3.fromHex("000000"),
        TextColor = Color3.fromHex("ffffff")
    }
    frame.Name = name
    frame.Size = UDim2.new(0.5,0,0.5,0)
    frame.AnchorPoint = Vector2.new(0.5,0.5)
    frame.Position = UDim2.new(0.5,0,0.5,0)
    frame.BackgroundColor3 = data.MainColor
    topbar.Name = "TopBar"
    topbar.BackgroundColor3 = data.MainColor2
    topbar.Size = UDim2.new(1,0,0.1,0)
    topbar.Position = UDim2.new(0,0,0,0)
    topbar.Parent = frame
    titletext.Name = "Title"
    titletext.Text = data.Title
    titletext.TextScaled = true
    titletext.TextColor3 = data.TextColor
    titletext.BackgroundTransparency = 1
    titletext.Size = UDim2.new(0.5,0,1,0)
    titletext.Position = UDim2.new(0,0,0,0)
    titletext.Parent = topbar
    sidebar.Size = UDim2.new(0.2,0,0.9,0)
    sidebar.Position = UDim2.new(0,0,0.1,0)
    sidebar.BackgroundColor3 = data.MainColor2
    sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sidebar.ScrollBarThickness = 0
    layout.Padding = UDim.new(0,5)
    layout.Parent = sidebar
    sidebar.Parent = frame
    frame.Parent = screengui
    local window = {
        AddTab = function(name,title,color)
            local tab = {

            }
            local tabInstance = Instance.new("TextButton")
            tabInstance.BackgroundColor3 = color
            tabInstance.Text = title
            tabInstance.TextColor3 = data.TextColor
            tabInstance.Size = UDim2.new(1,0,0,40)
            tabInstance.Parent = sidebar
            return tab
        end
    }
    setmetatable(window,{
        __index = data,
        __newindex = function(self,key,value)
            data[key] = value
            if key == "Title" then
                titletext.Text = value
            elseif key == "MainColor" then
                frame.BackgroundColor3 = value
            elseif key == "TextColor" then
                for _,v in frame:GetDescendants() do
                    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                        v.TextColor3 = value
                    end
                end
            elseif key == "MainColor2" then
                topbar.BackgroundColor3 = value
                sidebar.BackgroundColor3 = value
            end
        end
    })
    return window
end
return Window
