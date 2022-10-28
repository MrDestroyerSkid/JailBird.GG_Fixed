if not syn or not protectgui then
	print("Yes")
    getgenv().protectgui = function()end
end

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
--Library = loadstring(game:HttpGet('https://lindseyhost.com/UI/LinoriaLib.lua'))();

local Window = Library:CreateWindow({Title = "Jailbird.gg V3", Center = true, AutoShow = true})

local Fonts = {1,2,3};

local skinTable = {""}
for i,v in pairs(game:GetService("ReplicatedStorage").Items.Skin:GetChildren()) do	
	if v:IsA("Decal") or v:IsA("Texture") then
		table.insert(skinTable, v.Name)
		table.sort(skinTable)

	end
end

local Loadout = {""}
for i,v in pairs(game.Players.LocalPlayer.PlayerData.Loadout:GetChildren()) do
    if v:IsA("Folder") then
        table.insert(Loadout, v.Name)
        table.sort(Loadout)

    end
end

local flyBool = false
local Material1 = {"Plastic", "Neon", "ForceField"}
local Material2 = {"Plastic", "Neon", "ForceField"}
local AimParts = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
local SnapParts = {"Head", "Torso", "Legs"}
local UIFont = 1
--local chatMsgs = {"Stole your elo srry.", "Sit down kid", "Stay mad!", "They're in my walls", "I stripped the copper out of my walls so I could pay my electrical bills", "You may call me a skid, and you'd be correct.", "No kick pls.", "Free win fr fr", "I AM NOT A CHICOM", "They glow in the dark, you know.", "Want this script? Friend me!", "Im not cheating, im a high elo champ in siege", "L", "Your KD has been lowered mb", "The win rates only go up you know"}
-- saying i dont want to use quite yet , "I ♥ Jailbird.gg", "Start winning with Jailbird.gg!", 

Library:SetWatermark("Jailbird.gg: Fixed | " .. os.date("%x") .. " | 1.3")
Library:Notify("Loading UI...")
Library:Notify("Newest Version | 1.3")
Library:Notify("Right Shift to Open the Menu")

local AimTab = Window:AddTab("Aimbot")
local VisTab = Window:AddTab("Visuals")
local RageTab = Window:AddTab("Rage")
local SettingsTab = Window:AddTab("Settings")

local AimbotTabbox1 = AimTab:AddLeftTabbox("Aimbot")
local Aim1 = AimbotTabbox1:AddTab("Aimbot")
Aim1:AddToggle("aim_enabled", {Text = "Enable"}):AddKeyPicker("aim_key", {Text = "Aimbot", Default = "X", Mode = "Hold"})
Aim1:AddToggle("fov_Circle", {Text = "FOV Circle"}):AddColorPicker("fovColor", { Default = Color3.fromRGB(255, 255, 255) })
Aim1:AddSlider("aimbot_distance", {Text = "Aimbot Distance", Default = 500, Min = 50, Max = 500, Rounding = 0})
Aim1:AddSlider("circle_radius", {Text = "Circle Radius", Default = 250, Min = 50, Max = 600, Rounding = 0})
Aim1:AddDropdown("aim_part", {Text = "Aim Part", Default = 1, Values = AimParts})

local VisTabbox1 = VisTab:AddLeftTabbox("Enemy ESP")
local Esp1 = VisTabbox1:AddTab("Enemy ESP")
Esp1:AddToggle("name_tags", {Text = "Nametags"}):AddColorPicker("nameColor", { Default = Color3.fromRGB(255, 255, 255) })
Esp1:AddToggle("distance", {Text = "Distance"})
Esp1:AddToggle("boxes", { Text = "Boxes" }):AddColorPicker("bColor", { Default = Color3.fromRGB(255, 255, 255) })
Esp1:AddToggle("head_dot", {Text = "Head Dot"})
Esp1:AddToggle("health_bar", {Text = "Healthbar"})
Esp1:AddToggle("snaplines", {Text = "Snaplines"})

local Esp2 = VisTabbox1:AddTab("ESP Settings")
Esp2:AddSlider("FontSize", {Text = "Font Size", Default = 14, Min = 8, Max = 24, Rounding = 0})
Esp2:AddSlider("esp_distance", {Text = "ESP Distance", Default = 500, Min = 0, Max = 500, Rounding = 0})
Esp2:AddDropdown("SelectedFont", { Text = "ESP Font", Default = 1, Values = Fonts })
Esp2:AddDropdown("SnaplinePart", {Text = "Snapline Part", Default = 1, Values = SnapParts})

local VisTabbox2 = VisTab:AddLeftTabbox("Local Chams")
local Chams1 = VisTabbox2:AddTab("Local")
--Chams1:AddSlider("player_fov", {Text = "FOV", Default = 70, Min = 40, Max = 120, Rounding = 0})
Chams1:AddToggle("gun_chams", {Text = "Gun Chams"}):AddColorPicker("gunColor", { Default = Color3.fromRGB(255, 255, 255) })
--Chams1:AddSlider("gun_chams_transparency", { Text = "Gun Chams Transparency", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
Chams1:AddDropdown("gun_mat", {Text = "Gun Material", Default = 1, Values = Material1})
Chams1:AddToggle("hand_chams", {Text = "Local Player Model Chams"}):AddColorPicker("handColor", { Default = Color3.fromRGB(255, 255, 255) })
Chams1:AddSlider("hand_chams_transparency", { Text = "Hand Chams Transparency", Default = 100, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
Chams1:AddDropdown("hand_mat", {Text = "Hand Material", Default = 1, Values = Material2})

local Chams2 = VisTabbox2:AddTab("Enemy Chams")
Chams2:AddToggle("enemy_chams", {Text = "Enemy Chams"}):AddColorPicker("eColor", { Default = Color3.fromRGB(255, 255, 255) })
Chams2:AddToggle("enemy_chams_ontop", {Text = "Always on Top"})
Chams2:AddSlider("enemy_chams_transparency", { Text = "Chams Transparency", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
Chams2:AddSlider("enemy_transparency", { Text = "Enemy Transparency", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})

local VisTabbox3 = VisTab:AddRightTabbox("Crosshair")
local Cross1 = VisTabbox3:AddTab("Crosshair")
Cross1:AddToggle("crosshair", {Text = "Enable"}):AddColorPicker("crossColor", { Default = Color3.fromRGB(255, 255, 255) })
Cross1:AddSlider("cross_length", { Text = "Crosshair Length", Default = 12, Min = 2, Max = 64, Rounding = 0, Suffix = "px"})
Cross1:AddSlider("cross_thickness", { Text = "Crosshair Thickness", Default = 1, Min = 1, Max = 10, Rounding = 0})
Cross1:AddSlider("cross_trans", { Text = "Crosshair Transparency", Default = 100, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})

local VisTabbox4 = VisTab:AddRightTabbox("Render")
local Rend1 = VisTabbox4:AddTab("Render")
Rend1:AddToggle("clr_correction", {Text = "Color Correction"}):AddColorPicker("clrCorrct", {Default = Color3.fromRGB(255,255,255) })
Rend1:AddSlider("brightness", { Text = "Brightness", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
Rend1:AddSlider("contrast", { Text = "Contrast", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
Rend1:AddSlider("saturation", { Text = "Saturation", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
Rend1:AddToggle("bloom", {Text = "Bloom"})
Rend1:AddSlider("bloom_intensity", { Text = "Intensity", Default = 0, Min = 0, Max = 40, Rounding = 0})
Rend1:AddSlider("bloom_size", { Text = "Size", Default = 0, Min = 0, Max = 56, Rounding = 0})
Rend1:AddSlider("bloom_threshold", { Text = "Threshold", Default = 0, Min = 0, Max = 40, Rounding = 0})

local VisTabbox5 = VisTab:AddRightTabbox("Skin Changer")
local Skin1 = VisTabbox5:AddTab("Skin Changer")

Skin1:AddDropdown("primary", {Text = "Primary", Default = 1, Values = skinTable })
Skin1:AddDropdown("secondary", {Text = "Secondary", Default = 1, Values = skinTable })

local Load = VisTabbox5:AddTab("Loadout")
Load:AddDropdown("loadout", {Text = "Loadout", Default = 1, Values = Loadout })

local World1 = VisTabbox4:AddTab("World")
World1:AddToggle("transparent_walls", {Text = "Transparent Walls"})
World1:AddSlider("wall_transparency", { Text = "Wall Transparency", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})

local PlayerTabbox1 = RageTab:AddLeftTabbox("Player")
local Player1 = PlayerTabbox1:AddTab("Player")
Player1:AddToggle("plr_mod", {Text = "Player Modification"})
Player1:AddSlider("player_speed", { Text = "Player Speed", Default = 10, Min = 10, Max = 100, Rounding = 0})
Player1:AddSlider("player_height", { Text = "Player Jump Height", Default = 30, Min = 30, Max = 100, Rounding = 0})

local function TPSpawnBox()
    game:GetService"Players".LocalPlayer.Character:FindFirstChild"HumanoidRootPart".CFrame = game:GetService("Workspace").SpawnLocation.CFrame
end

local ExploitsTabbox1 = RageTab:AddRightTabbox("Exploits")
local Exploits1 = ExploitsTabbox1:AddTab("Exploits")
Exploits1:AddToggle("no_barricades", {Text = "Destroy All Barricades"})
Exploits1:AddToggle("no_barrier", {Text = "Destroy Pre-Round Barrier"})
Exploits1:AddLabel("Fly"):AddKeyPicker("flyKey", {Text = "Fly", Default = "LeftBracket"})
Exploits1:AddLabel("Teleport Peek"):AddKeyPicker("peekKey", {Text = "Teleport Peek", Default = "RightBracket"}) --:AddTooltip("When held your position is saved and once the keybind is let go you teleport back to the first position you held the button on")
Exploits1:AddLabel("Phase"):AddKeyPicker("phaseKey", {Text = "Phase Key", Default = "Semicolon", Mode = "Hold"}) --:AddTooltip("When held you can freely phase through objects")
Exploits1:AddLabel("TP Death Loop Key"):AddKeyPicker("tpLoopKey", {Text = "TP Death Loop Key", Default = "Comma"})
Exploits1:AddButton("TP To Spawn Box", TPSpawnBox)

local ExploitsTabbox2 = RageTab:AddLeftTabbox("Gun Mods")
local Exploits2 = ExploitsTabbox2:AddTab("Gun Mods")
Exploits2:AddToggle("gunMods", {Text = "Gun Mods"})
Exploits2:AddToggle("noSway", {Text = "No Sway"})
Exploits2:AddToggle("infAmmo", {Text = "Infinite Ammo"})
Exploits2:AddToggle("oneShot", {Text = "One Shot Anywhere"})
Exploits2:AddToggle("fullAuto", {Text = "Full Auto Every Gun"})
Exploits2:AddSlider("fireRate", { Text = "Fire Rate", Default = 2700, Min = 2500, Max = 5000, Rounding = 0})

local function UpdateTheme()
    Library.BackgroundColor = Options.BackgroundColor.Value;
    Library.MainColor = Options.MainColor.Value;
    Library.AccentColor = Options.AccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.OutlineColor = Options.OutlineColor.Value;
    Library.FontColor = Options.FontColor.Value;

    Library:UpdateColorsUsingRegistry();
end;

local function SetDefault()
    Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Options.MainColor:SetValueRGB(Color3.fromRGB(28, 28, 28));
    Options.BackgroundColor:SetValueRGB(Color3.fromRGB(20, 20, 20));
    Options.AccentColor:SetValueRGB(Color3.fromRGB(97, 14, 166));
    Options.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Toggles.Rainbow:SetValue(false);

    UpdateTheme();
end;

local Theme = SettingsTab:AddLeftGroupbox('Theme');
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default = Library.BackgroundColor });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default = Library.MainColor });
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default = Color3.fromRGB(97, 14, 166) });
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default = Library.OutlineColor });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Library.FontColor });
Theme:AddButton('Default Theme', SetDefault);
Theme:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = true }):OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.Keybinds.Value;
end);
Theme:AddToggle('Watermark', { Text = 'Show Watermark', Default = true }):OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.Watermark.Value);
end);

task.spawn(function()
    while game:GetService('RunService').RenderStepped:Wait() do
        if Toggles.Rainbow.Value then
            local Registry = Window.Holder.Visible and Library.Registry or Library.HudRegistry;

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                        local Instance = Object.Instance;
                        local yPos = Instance.AbsolutePosition.Y;

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);

                        if ColorIdx == 'AccentColorDark' then
                            Color = Library:GetDarkerColor(Color);
                        end;

                        Instance[Property] = Color;
                    end;
                end;
            end;
        end;
    end;
    
end);

task.spawn(function()
    while true do
        wait(1)

        if Library.Unloaded then break end
    end
end)

Toggles.Rainbow:OnChanged(function()
    if not Toggles.Rainbow.Value then
        UpdateTheme();
    end;
end);

Options.BackgroundColor:OnChanged(UpdateTheme);
Options.MainColor:OnChanged(UpdateTheme);
Options.AccentColor:OnChanged(UpdateTheme);
Options.OutlineColor:OnChanged(UpdateTheme);
Options.FontColor:OnChanged(UpdateTheme);

local function tp()
    local Player = game.Players.LocalPlayer
    local TP = game:GetService("TeleportService")
    TP:Teleport(6055959032, Player)
end;

Library:OnUnload(function()
    --print('Unloaded!')
    Library.Unloaded = true
end)

local Extra = SettingsTab:AddRightTabbox("Extras")
local Feats = Extra:AddTab("Extras")
Feats:AddButton("Teleport back to lobby", tp)
Feats:AddLabel("      discord.gg/u7psbSZBeM")

Theme:AddButton("Unload", function ()
    Library:Unload()
end)

Library:Notify("Loaded UI!");

-- Features below

local lplr = game:GetService"Players".LocalPlayer -- Local Player
local camera = game:GetService("Workspace").CurrentCamera -- Camera
local CurrentCamera = workspace.CurrentCamera -- Current Camera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint -- View Port Point
local UIS = game:GetService("UserInputService")

local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()

local HeadOff = Vector3.new(0, 0.2, 0)
local LegOff = Vector3.new(0,4.7,0)
local HeadOff2 = Vector3.new(0, 5.6, 0)
local SnapLeg = Vector3.new(0, 3.2, 0)
local HealthOff = Vector3.new(-6,0,0)
local currentGun = "M4A1"
local CurrentMap = "Gas Station"
local InGame = false
local DeathLoop = false
local PeekBool = false
local playerFolder = game:GetService("Workspace").PlayersFolder
local MapCache = game:GetService("Workspace")["Map_Cache"]

-- Box ESP
local BoxESP = function ()

    for i,v in pairs(game.Players:GetChildren()) do

        local BoxOutline = Drawing.new("Square")
        BoxOutline.Visible = false
        BoxOutline.Color = Color3.new(0,0,0)
        BoxOutline.Thickness = 2
        BoxOutline.Transparency = 1
        BoxOutline.Filled = false
    
        local Box = Drawing.new("Square")
        Box.Visible = false
        Box.Color = Options.bColor.Value
        Box.Thickness = 1
        Box.Transparency = 1
        Box.Filled = false

        local HealthBarOutline = Drawing.new("Square")
        HealthBarOutline.Thickness = 3
        HealthBarOutline.Filled = false
        HealthBarOutline.Color = Color3.new(0,0,0)
        HealthBarOutline.Transparency = 1
        HealthBarOutline.Visible = false
    
        local HealthBar = Drawing.new("Square")
        HealthBar.Thickness = 1
        HealthBar.Filled = false
        HealthBar.Transparency = 1
        HealthBar.Visible = false

        game:GetService("RunService").RenderStepped:Connect(function()

            if v.TeamColor ~= lplr.TeamColor and v ~= nil and v ~= lplr then

                if MapCache:FindFirstChild(v.Name) then
                    Box.Visible = false
                    BoxOutline.Visible = false
                    HealthBar.Visible = false
                    HealthBarOutline.Visible = false
                    --print("this is a dead test")

                else
                    local UserFolder = game:GetService"Players":FindFirstChild(v.Name).Character

                    if UserFolder ~= nil and UserFolder:FindFirstChild("Torso") and UserFolder:FindFirstChildOfClass"Humanoid".Health > 0 then
    
                        --print("this is a logic test")
                        --print(UserFolder.Torso.Position)
                        local Vector, onScreen = camera:worldToViewportPoint(UserFolder.HumanoidRootPart.Position)
                        local RootPart = UserFolder.HumanoidRootPart
                        local Head = UserFolder.Head
                        local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                        local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
                        local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                        Box.Color = Options.bColor.Value

                        if onScreen and Toggles.boxes.Value == true or onScreen and Toggles.health_bar.Value == true then

                            BoxOutline.Size = Vector2.new(1650 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                            BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                            --BoxOutline.Visible = true
            
                            Box.Size = Vector2.new(1650 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                            Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                            --Box.Visible = true

                            HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                            HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                        
                            HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (UserFolder.Humanoid.MaxHealth / math.clamp(UserFolder.Humanoid.Health, 0, UserFolder.Humanoid.MaxHealth)))
                            HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                            HealthBar.Color = Color3.fromRGB(255 - 255 / (UserFolder.Humanoid.MaxHealth / UserFolder.Humanoid.Health), 255 / (UserFolder.Humanoid.MaxHealth / UserFolder.Humanoid.Health), 0)

                            if Toggles.boxes.Value == true then
                                BoxOutline.Visible = true
                                Box.Visible = true
                            else
                                BoxOutline.Visible = false
                                Box.Visible = false
                            end

                            if Toggles.health_bar.Value == true then
                                HealthBar.Visible = true
                                HealthBarOutline.Visible = true
                            else
                                HealthBar.Visible = false
                                HealthBarOutline.Visible = false
                            end

                        else
                            Box.Visible = false
                            BoxOutline.Visible = false
                            HealthBar.Visible = false
                            HealthBarOutline.Visible = false
                        end
        
                    else
                        Box.Visible = false
                        BoxOutline.Visible = false
                        HealthBar.Visible = false
                        HealthBarOutline.Visible = false
                        --print("Player is out of health and this should show up briefly!")
                        
                    end
                end


            end


            
        end)



    end

    game.Players.PlayerAdded:Connect(function(v)

        local BoxOutline = Drawing.new("Square")
        BoxOutline.Visible = false
        BoxOutline.Color = Color3.new(0,0,0)
        BoxOutline.Thickness = 2
        BoxOutline.Transparency = 1
        BoxOutline.Filled = false
    
        local Box = Drawing.new("Square")
        Box.Visible = false
        Box.Color = Options.bColor.Value
        Box.Thickness = 1
        Box.Transparency = 1
        Box.Filled = false

        local HealthBarOutline = Drawing.new("Square")
        HealthBarOutline.Thickness = 3
        HealthBarOutline.Filled = false
        HealthBarOutline.Color = Color3.new(0,0,0)
        HealthBarOutline.Transparency = 1
        HealthBarOutline.Visible = false
    
        local HealthBar = Drawing.new("Square")
        HealthBar.Thickness = 1
        HealthBar.Filled = false
        HealthBar.Transparency = 1
        HealthBar.Visible = false

        game:GetService("RunService").RenderStepped:Connect(function()

            if v.TeamColor ~= lplr.TeamColor and v ~= nil and v ~= lplr then

                if MapCache:FindFirstChild(v.Name) then
                    Box.Visible = false
                    BoxOutline.Visible = false
                    HealthBar.Visible = false
                    HealthBarOutline.Visible = false
                    print("this is a dead test")

                else
                    local UserFolder = playerFolder[v.Name]

                    if UserFolder ~= nil and UserFolder:FindFirstChild("Torso") and UserFolder.Humanoid.Health > 0 then
    
                        --print("this is a logic test")
                        --print(UserFolder.Torso.Position)
                        local Vector, onScreen = camera:worldToViewportPoint(UserFolder.HumanoidRootPart.Position)
                        local RootPart = UserFolder.HumanoidRootPart
                        local Head = UserFolder.Head
                        local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                        local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
                        local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                        Box.Color = Options.bColor.Value

                        if onScreen and Toggles.boxes.Value == true or onScreen and Toggles.health_bar.Value == true then

                            BoxOutline.Size = Vector2.new(1650 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                            BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                            --BoxOutline.Visible = true
            
                            Box.Size = Vector2.new(1650 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                            Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                            --Box.Visible = true

                            HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                            HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                        
                            HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (UserFolder.Humanoid.MaxHealth / math.clamp(UserFolder.Humanoid.Health, 0, UserFolder.Humanoid.MaxHealth)))
                            HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                            HealthBar.Color = Color3.fromRGB(255 - 255 / (UserFolder.Humanoid.MaxHealth / UserFolder.Humanoid.Health), 255 / (UserFolder.Humanoid.MaxHealth / UserFolder.Humanoid.Health), 0)

                            if Toggles.boxes.Value == true then
                                BoxOutline.Visible = true
                                Box.Visible = true
                            else
                                BoxOutline.Visible = false
                                Box.Visible = false
                            end

                            if Toggles.health_bar.Value == true then
                                HealthBar.Visible = true
                                HealthBarOutline.Visible = true
                            else
                                HealthBar.Visible = false
                                HealthBarOutline.Visible = false
                            end

                        else
                            Box.Visible = false
                            BoxOutline.Visible = false
                            HealthBar.Visible = false
                            HealthBarOutline.Visible = false
                        end
        
                    else
                        Box.Visible = false
                        BoxOutline.Visible = false
                        HealthBar.Visible = false
                        HealthBarOutline.Visible = false
                        print("Player is out of health and this should show up briefly!")
                        
                    end
                end


            end


            
        end)

    end)
end
coroutine.wrap(BoxESP)()

-- Head Dot ESP
local HeadDotESP = function ()
    
    for i,v in pairs(game.Players:GetChildren()) do

        local CircleOutline = Drawing.new("Circle")
        CircleOutline.Visible = false
        CircleOutline.Radius = 30
        CircleOutline.Color = Color3.fromRGB(0, 0 ,0)
        CircleOutline.Thickness = 3
        CircleOutline.Filled = false
        CircleOutline.Transparency = 1
    
        local HeadCircle = Drawing.new("Circle")
        HeadCircle.Visible = false
        HeadCircle.Radius = 30
        HeadCircle.Color = Options.bColor.Value
        HeadCircle.Thickness = 1
        HeadCircle.Filled = false
        HeadCircle.Transparency = 1
    
            game:GetService("RunService").RenderStepped:Connect(function()
    
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    
                    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
    
                    HeadCircle.Color = Options.bColor.Value
    
                    if onScreen == true and Toggles.head_dot.Value == true then
    
                        local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)

                        HeadCircle.Position = Vector2.new(HeadPosition.X / 1, HeadPosition.Y / 1)
                        HeadCircle.Radius = 350 / RootPosition.Z
                        HeadCircle.Visible = true
    
                        CircleOutline.Position = Vector2.new(HeadPosition.X / 1, HeadPosition.Y / 1)
                        CircleOutline.Radius = 350 / RootPosition.Z
                        CircleOutline.Visible = true

                        if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                            HeadCircle.Visible = true
                            CircleOutline.Visible = true
                        else
                            HeadCircle.Visible = false
                            CircleOutline.Visible = false
                        end

                    else
                        HeadCircle.Visible = false
                        CircleOutline.Visible = false
                    end
    
                else
                    HeadCircle.Visible = false
                    CircleOutline.Visible = false
                end
    
            end)
            
    end
    
    game.Players.PlayerAdded:Connect(function(v)
        
        local CircleOutline = Drawing.new("Circle")
        CircleOutline.Visible = false
        CircleOutline.Radius = 30
        CircleOutline.Color = Color3.fromRGB(0, 0 ,0)
        CircleOutline.Thickness = 3
        CircleOutline.Filled = false
        CircleOutline.Transparency = 1
    
        local HeadCircle = Drawing.new("Circle")
        HeadCircle.Visible = false
        HeadCircle.Radius = 30
        HeadCircle.Color = Options.bColor.Value
        HeadCircle.Thickness = 1
        HeadCircle.Filled = false
        HeadCircle.Transparency = 1
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    
                    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
    
                    HeadCircle.Color = Options.bColor.Value
    
                    if onScreen == true and Toggles.head_dot.Value == true then
    
                        local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)

                        HeadCircle.Position = Vector2.new(HeadPosition.X / 1, HeadPosition.Y / 1)
                        HeadCircle.Radius = 350 / RootPosition.Z
                        HeadCircle.Visible = true
    
                        CircleOutline.Position = Vector2.new(HeadPosition.X / 1, HeadPosition.Y / 1)
                        CircleOutline.Radius = 350 / RootPosition.Z
                        CircleOutline.Visible = true
    
                        if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                            HeadCircle.Visible = true
                            CircleOutline.Visible = true
                        else
                            HeadCircle.Visible = false
                            CircleOutline.Visible = false
                        end

                    else
                        HeadCircle.Visible = false
                        CircleOutline.Visible = false
                    end
    
                else
                    HeadCircle.Visible = false
                    CircleOutline.Visible = false
                end
    
            end)
    end)

end
coroutine.wrap(HeadDotESP)()

-- Nametag ESP
local NametagESP = function ()

    for i,v in pairs(game.Players:GetChildren()) do

        local NameESP = Drawing.new("Text")
        NameESP.Visible = false
        NameESP.Center = true
        NameESP.Outline = true
        NameESP.Font = Options.SelectedFont.Value
        NameESP.Size = Options.FontSize.Value
        NameESP.Color = Options.nameColor.Value
        NameESP.Text = v.Name
    
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
    
                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local HeadPosition = worldToViewportPoint(CurrentCamera, RootPart.Position + HeadOff2)
    
                    NameESP.Color = Options.nameColor.Value
                    NameESP.Size = Options.FontSize.Value
                    NameESP.Font = Options.SelectedFont.Value

                    if onScreen == true and Toggles.name_tags.Value == true then
    
                        local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)
    
                        NameESP.Position = Vector2.new(HeadPosition.X, HeadPosition.Y)
    
                        if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                            NameESP.Visible = true
                        else
                            NameESP.Visible = false
                        end

                    else
                        NameESP.Visible = false
                    end
    
                else
                    NameESP.Visible = false
                end
    
            end)
            
    end
    
    game.Players.PlayerAdded:Connect(function (v)
    
        local NameESP = Drawing.new("Text")
        NameESP.Visible = false
        NameESP.Center = true
        NameESP.Outline = true
        NameESP.Font = Options.SelectedFont.Value
        NameESP.Size = Options.FontSize.Value
        NameESP.Color = Options.nameColor.Value
        NameESP.Text = v.Name
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
    
                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local HeadPosition = worldToViewportPoint(CurrentCamera, RootPart.Position + HeadOff2)
    
                    NameESP.Color = Options.nameColor.Value
                    NameESP.Size = Options.FontSize.Value
                    NameESP.Font = Options.SelectedFont.Value
    
                    if onScreen == true and Toggles.name_tags.Value == true then
    
                        local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)
    
                        NameESP.Position = Vector2.new(HeadPosition.X, HeadPosition.Y)
    
                        if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                            NameESP.Visible = true
                        else
                            NameESP.Visible = false
                        end

                    else
                        NameESP.Visible = false
                    end
    
                else
                    NameESP.Visible = false
                end
    
            end)
            
    
    end)
end
coroutine.wrap(NametagESP)()

-- Distance ESP
local DistanceESP = function ()

    for i,v in pairs(game.Players:GetChildren()) do

        local DistESP = Drawing.new("Text")
        DistESP.Visible = false
        DistESP.Center = true
        DistESP.Outline = true
        DistESP.Font = Options.SelectedFont.Value
        DistESP.Size = Options.FontSize.Value
        DistESP.Color = Options.nameColor.Value
        DistESP.Text = ""
    
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
    
                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
    
                    DistESP.Font = Options.SelectedFont.Value
                    DistESP.Size = Options.FontSize.Value
                    DistESP.Color = Options.nameColor.Value

                    --  or texts < 300 

                    if onScreen == true and Toggles.distance.Value == true then
    
                        local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)
    
                        DistESP.Position = Vector2.new(LegPosition.X, LegPosition.Y)
                        
                        DistESP.Text = tostring("(" .. texts .. ")")

                        if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                            DistESP.Visible = true
                        else
                            DistESP.Visible = false
                        end

                    else
                        DistESP.Visible = false
                    end
    
                else
                    DistESP.Visible = false
                end
    
            end)
    end
    
    game.Players.PlayerAdded:Connect(function (v)
    
        local DistESP = Drawing.new("Text")
        DistESP.Visible = false
        DistESP.Center = true
        DistESP.Outline = true
        DistESP.Font = Options.SelectedFont.Value
        DistESP.Size = Options.FontSize.Value
        DistESP.Color = Options.nameColor.Value
        DistESP.Text = ""
    
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
    
                    local TextVect, onScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)  
                    local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
    
                    DistESP.Font = Options.SelectedFont.Value
                    DistESP.Size = Options.FontSize.Value
                    DistESP.Color = Options.nameColor.Value
                    
                    if onScreen == true and Toggles.distance.Value == true then
    
                        local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)
    
                        DistESP.Position = Vector2.new(LegPosition.X, LegPosition.Y)
                        
                        DistESP.Text = tostring("(" .. texts .. ")")
    
                        if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                            DistESP.Visible = true
                        else
                            DistESP.Visible = false
                        end

                    else
                        DistESP.Visible = false
                    end
    
                else
                    DistESP.Visible = false
                end
    
            end)
    
    end)

end
coroutine.wrap(DistanceESP)()

-- Snaplines ESP
local SnaplineESP = function ()

    for i,v in pairs(game.Players:GetChildren()) do

        local lineSnap = Drawing.new("Line")
        lineSnap.Visible =  false
        lineSnap.Thickness = 1
        lineSnap.Color = Options.bColor.Value
        
        game:GetService("RunService").RenderStepped:Connect(function ()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - SnapLeg)
    
                lineSnap.Color = Options.bColor.Value
    
                if onScreen and Toggles.snaplines.Value == true then
    
                    local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)

                    if Options.SnaplinePart.Value == "Head" then
                        lineSnap.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                        lineSnap.To = Vector2.new(HeadPosition.X, HeadPosition.Y)
                    else 
                        if Options.SnaplinePart.Value == "Torso" then
                            lineSnap.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                            lineSnap.To = Vector2.new(RootPosition.X, RootPosition.Y)
                        else
                            if Options.SnaplinePart.Value == "Legs" then
                                lineSnap.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                                lineSnap.To = Vector2.new(LegPosition.X, LegPosition.Y)
                            end
                        end
                        
    
                    end
    
                    if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                        lineSnap.Visible = true
                    else
                        lineSnap.Visible = false
                    end

                else
                    lineSnap.Visible = false
                end
            else
                lineSnap.Visible = false
            end
        end)
    end
    
    game.Players.PlayerAdded:Connect(function (v)
    
        local lineSnap = Drawing.new("Line")
        lineSnap.Visible =  false
        lineSnap.Thickness = 1
        lineSnap.Color = Options.bColor.Value
        
        game:GetService("RunService").RenderStepped:Connect(function ()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)   
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - SnapLeg)
    
                lineSnap.Color = Options.bColor.Value
    
                if onScreen and Toggles.snaplines.Value == true then
    
                    local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)

                    if Options.SnaplinePart.Value == "Head" then
                        lineSnap.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                        lineSnap.To = Vector2.new(HeadPosition.X, HeadPosition.Y)
                    else 
                        if Options.SnaplinePart.Value == "Torso" then
                            lineSnap.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                            lineSnap.To = Vector2.new(RootPosition.X, RootPosition.Y)
                        else
                            if Options.SnaplinePart.Value == "Legs" then
                                lineSnap.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                                lineSnap.To = Vector2.new(LegPosition.X, LegPosition.Y)
                            end
                        end
                        
    
                    end
    
                    if v.TeamColor ~= lplr.TeamColor and texts <= Options.esp_distance.Value then
                        lineSnap.Visible = true
                    else
                        lineSnap.Visible = false
                    end

                else
                    lineSnap.Visible = false
                end
            else
                lineSnap.Visible = false
            end
        end)
    
    end)

end
coroutine.wrap(SnaplineESP)()

-- Cham and Character utils
function gunGetter()
    game:GetService("RunService").RenderStepped:Connect(function ()

	    for i,v in pairs(game:GetService"Players".LocalPlayer.Character:GetDescendants()) do
            if v:IsA("Tool") then  
                
                currentGun = v.Name
            end
            
        end
    
    end)

end
coroutine.wrap(gunGetter)()

-- Local Chams
function gunChams()
    game:GetService("RunService").RenderStepped:Connect(function()
        if Toggles.gun_chams.Value == true then   
            for i,v in pairs(game:GetService("Workspace").Camera:FindFirstChild(currentGun):FindFirstChild(currentGun):GetChildren()) do
                if v:IsA("MeshPart") or v:IsA("UnionOperation") or v:IsA("Part") then
                    
                    v.BrickColor = BrickColor.new(Options.gunColor.Value)
                    v.Material = Options.gun_mat.Value
                    --v.Transparency = Options.gun_chams_transparency.Value / 100
                end
            end
        end
    end)
end
coroutine.wrap(gunChams)()

function localChams()
    game:GetService("RunService").RenderStepped:Connect(function()
        if Toggles.hand_chams.Value == true then
            for i,v in pairs(game:GetService("Workspace").Camera:FindFirstChild(currentGun):GetChildren()) do
                if v:IsA("Part") and v.Name == "Left Arm" or v.Name == "Right Arm" then
                    
                    v.BrickColor = BrickColor.new(Options.handColor.Value)
                    v.Material = Options.hand_mat.Value
                    v.Transparency = Options.hand_chams_transparency.Value / 100

                end
                
            end
        end
    end)
end
coroutine.wrap(localChams)()

-- Enemy Chams
function chams()
    game:GetService("RunService").RenderStepped:Connect(function()
        if Toggles.enemy_chams.Value == true then
            for i,v in pairs(game:GetService"Players":GetChildren()) do
                for i,b in pairs(v.Character:GetChildren()) do
                    if b:IsA("Part") and v.Character.Humanoid.Health > 0 and v ~= lplr and v.TeamColor ~= lplr.TeamColor then
                        if not b:FindFirstChild("BoxHandleAdornment") then
                            b.Transparency = 0.5
                            local box = Instance.new("BoxHandleAdornment", b)
                            box.AlwaysOnTop = Toggles.enemy_chams_ontop.Value
                            box.Adornee = b
                            box.Size = b.Size
                            box.Color3 = Options.eColor.Value
                            box.ZIndex = 1                                         
                            box.Transparency = Options.enemy_chams_transparency.Value / 100

                            repeat wait()
                                box.Color3 = Options.eColor.Value
                                box.Transparency = Options.enemy_chams_transparency.Value / 100
                                box.AlwaysOnTop = Toggles.enemy_chams_ontop.Value
                            until Toggles.enemy_chams.Value == false
                        end
                    end
                end
            end
        end
    end)
end
coroutine.wrap(chams)()

function destroyChams()
    game:GetService("RunService").RenderStepped:Connect(function ()
           for i,v in pairs(game.Players:GetChildren()) do
              for i,b in pairs(v.Character:GetChildren()) do
                  if b:IsA("Part") and v.Character.Humanoid.Health == 0 or Toggles.enemy_chams.Value == false or v.TeamColor == lplr.TeamColor then
                      if b:FindFirstChild("BoxHandleAdornment") then
                          b.BoxHandleAdornment:Destroy()
                      end
                  end
              end
           end
    end)
end
coroutine.wrap(destroyChams)()

-- Crosshair
local CrosshairDown = Drawing.new("Line") -- y
local CrosshairCross = Drawing.new("Line") -- x

function makeCrosshair()
    game:GetService("RunService").RenderStepped:Connect(function ()
        if Toggles.crosshair.Value == true then

            CrosshairDown.Color = Options.crossColor.Value
            CrosshairDown.Thickness = Options.cross_thickness.Value
            CrosshairDown.Transparency = Options.cross_trans.Value / 100

            CrosshairCross.Color = Options.crossColor.Value
            CrosshairCross.Thickness = Options.cross_thickness.Value
            CrosshairCross.Transparency = Options.cross_trans.Value / 100

            if Toggles.crosshair.Value == true then

                CrosshairDown.Visible = true
                CrosshairCross.Visible = true
            
                CrosshairCross.From = Vector2.new((CurrentCamera.ViewportSize.X/2)+(Options.cross_length.Value/2+1), CurrentCamera.ViewportSize.Y/2) 
                CrosshairCross.To = Vector2.new(CurrentCamera.ViewportSize.X/2-(Options.cross_length.Value/2), CurrentCamera.ViewportSize.Y/2) 
            
                CrosshairDown.From = Vector2.new(CurrentCamera.ViewportSize.X/2, CurrentCamera.ViewportSize.Y/2+(Options.cross_length.Value/2)) 
                CrosshairDown.To = Vector2.new(CurrentCamera.ViewportSize.X/2, CurrentCamera.ViewportSize.Y/2-(Options.cross_length.Value/2))

            else
                CrosshairDown.Visible = false
                CrosshairCross.Visible = false
            end

        else
            CrosshairDown.Visible = false
            CrosshairCross.Visible = false
        end

    end)
end
coroutine.wrap(makeCrosshair)()

local aiming = false
local selectKey = Options.aim_key.Value
local fovcircle = Drawing.new("Circle")
local peekPressed = false
local origPos = CFrame.new(0,0,0)
local changedPos = CFrame.new(0,0,0)
local deathLoopPos = CFrame.new(0,0,0)

fovcircle.Visible = Toggles.fov_Circle.Value
fovcircle.Radius = Options.circle_radius.Value
fovcircle.Color = Options.fovColor.Value
fovcircle.Thickness = 1
fovcircle.Filled = false
fovcircle.Transparency = 1

fovcircle.Position = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)

UIS.InputBegan:Connect(function(i)
    if i.KeyCode == Enum.KeyCode[Options.aim_key.Value] then
        aiming = true
        print("Aiming")
        print(Options.aim_key.Value)
    end
end)

UIS.InputEnded:Connect(function(i)
    if i.KeyCode == Enum.KeyCode[Options.aim_key.Value] then
        aiming = false
        print("Not Aiming")
        print(Options.aim_key.Value)
    end
end)

dwRunService.RenderStepped:Connect(function()
    
    local dist = math.huge -- controls the fov snap stuff
    local closest_char = nil

    fovcircle.Radius = Options.circle_radius.Value
    fovcircle.Color = Options.fovColor.Value
    fovcircle.Visible = Toggles.fov_Circle.Value

    
    if aiming and Toggles.aim_enabled.Value == true then

        for i,v in next, dwEntities:GetChildren() do 

            if v ~= dwLocalPlayer and
            v.Character and
            v.Character:FindFirstChild("HumanoidRootPart") and
            v.Character:FindFirstChild("Humanoid") and
            v.Character:FindFirstChild("Humanoid").Health > 0 then

                local RootPart = v.Character.HumanoidRootPart
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)

                if v.Team ~= dwLocalPlayer.Team then

                    local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)
                    local char = v.Character
                    local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[Options.aim_part.Value].Position)

                    if is_onscreen then

                        local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude

                        if mag < dist and mag < Options.circle_radius.Value and texts <= Options.aimbot_distance.Value then

                            dist = mag
                            closest_char = char

                        end
                    end
                end
            end
        end

        if closest_char ~= nil and
        closest_char:FindFirstChild("HumanoidRootPart") and
        closest_char:FindFirstChild("Humanoid") and
        closest_char:FindFirstChild("Humanoid").Health > 0 and TweenStatus == nil then

            dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[Options.aim_part.Value].Position)
            --mousemoverel(((closest_char[Options.aim_part.Value].Position.X - MouseLocation.X)  / 0.5), ((closest_char[Options.aim_part.Value].Position.Y - MouseLocation.Y) / 0.5))
        end

    end
end)

-- Skin Changer
--[[dwRunService.RenderStepped:Connect(function ()
    
    game:GetService("Players").LocalPlayer.PlayerData.Loadout[Options.loadout.Value].Primary.Skin.Value = Options.primary.Value
    game:GetService("Players").LocalPlayer.PlayerData.Loadout[Options.loadout.Value].Secondary.Skin.Value = Options.secondary.Value

    --game:GetService("Workspace").Camera.FieldOfView = Options.player_fov.Value

end)]]

-- Exploits
function mapGetter()
    repeat
        
        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA("Folder") and v.Name == "Map" then
        
                for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
                    

                    if v:IsA("Model") then
                
                        CurrentMap = v.Name
                        InGame = true
                        print(v.Name)
                    end
                
                end
        
            else
                
            end
        
        end

    until InGame == true
end
coroutine.wrap(mapGetter)()

local function DeleteMap()

    if InGame == true then
        for i,v in pairs(game:GetService("Workspace").Map[CurrentMap]:GetDescendants()) do
            if v.Name ==  "Part" or v:IsA("MeshPart" )and v.Name ~= "Object_Doors" and v.Name ~= "Barricade" then
    
                v:Destroy()
    
            end
        end
    end

end

local function TPMoneyStand()
    if InGame == true then
        game:GetService"Players".LocalPlayer.Character:FindFirstChild"HumanoidRootPart".CFrame = game:GetService("Workspace").Map[CurrentMap].Objective.CFrame * CFrame.new(0,5,0)
    end
end

Exploits1:AddButton("TP To Money OBJ", TPMoneyStand)

Exploits1:AddButton("Delete Map", DeleteMap)

function gunGetter()
    game:GetService("RunService").RenderStepped:Connect(function ()

	if InGame == true then
	        for i,v in pairs(game:GetService"Players".LocalPlayer.Character:GetDescendants()) do
            	if v:IsA("Tool") then  
                
                currentGun = v.Name


            end
            
        end

    end
    
    end)

end
coroutine.wrap(gunGetter)()

local playerMods = function ()
    
    game:GetService("RunService").RenderStepped:Connect(function()

        if Toggles.plr_mod.Value == true then

            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Options.player_speed.Value
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Options.player_height.Value

        else

        end
    end)

end
coroutine.wrap(playerMods)()

local walls = function ()
    game:GetService("RunService").RenderStepped:Connect(function ()

        if InGame == true then
                
            if Toggles.transparent_walls.Value == true then

                game:GetService("Workspace").MapBaseSupport.CanCollide = true 
                game:GetService("Workspace").MapCore.CanCollide = true
                game:GetService("Workspace").Baseplate.CanCollide = true

                for i,v in pairs(game:GetService("Workspace").Map[CurrentMap]:GetDescendants()) do
                    if v.Name ==  "Part" or v:IsA("MeshPart" )and v.Name ~= "Object_Doors" and v.Name ~= "Barricade" then
    
                        v.Transparency = Options.wall_transparency.Value / 100

                    end
    
                end

            end

            if Toggles.no_barricades.Value == true then
                for i,v in pairs(game:GetService("Workspace").Map[CurrentMap]:GetDescendants()) do  
                    if v.Name == "Object_Doors" then
                        
                        v:Destroy()

                    end
                end
            end

            if Toggles.no_barrier.Value == true then
                for i,v in pairs(game:GetService("Workspace").Map[CurrentMap]:GetDescendants()) do  
                    if v.Name == "DefenderBlocker" then
                        v:Destroy()
                    end
                end
            end

        end
    end)
end
coroutine.wrap(walls)()

Options.peekKey:OnClick(function ()
    
    if PeekBool == false then
        PeekBool = true
        print(PeekBool)
    else
        PeekBool = false
        print(PeekBool)
    end

    function FerrariPeek()
        if PeekBool == true then
            origPos = workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame
            Library:Notify("Position Saved!")
        end

        if PeekBool == false then
            
            workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = origPos
            Library:Notify("Moved Back to Saved Position")

        end
    end
    coroutine.wrap(FerrariPeek)()
end)

local PhaseKey = function ()
    UIS.InputBegan:Connect(function (i)
        if i.KeyCode == Enum.KeyCode[Options.phaseKey.Value] then

            Library:Notify("Phase Enabled")

            game:GetService("Workspace").MapBaseSupport.CanCollide = true 
            game:GetService("Workspace").MapCore.CanCollide = true
            game:GetService("Workspace").Baseplate.CanCollide = true

            for i,v in pairs(game:GetService("Workspace").Map[CurrentMap]:GetDescendants()) do
                if v.Name ==  "Part" or v:IsA("MeshPart") and v.Name ~= "Object_Doors" then
    
                    v.CanCollide = false
                    v.Transparency = 0.5
                    
                end
    
            end
        end
    end)

    UIS.InputEnded:Connect(function (i)
        if i.KeyCode == Enum.KeyCode[Options.phaseKey.Value] then

            Library:Notify("Phase Disabled")
            
            game:GetService("Workspace").MapBaseSupport.CanCollide = true 
            game:GetService("Workspace").MapCore.CanCollide = true
            game:GetService("Workspace").Baseplate.CanCollide = true


            for i,v in pairs(game:GetService("Workspace").Map[CurrentMap]:GetDescendants()) do
                if v.Name ==  "Part" or v:IsA("MeshPart") and v.Name ~= "Object_Doors" then
    
                    v.CanCollide = true
                    v.Transparency = 0

                end
    
            end
        end
    end)
end
coroutine.wrap(PhaseKey)()
-- After the features / exploits

Options.flyKey:OnClick(function()

    if flyBool == false then
        flyBool = true
        print(flyBool)
    else
        flyBool = false
        print(flyBool)
    end

    function flyEnable()

        while flyBool == true do

            repeat wait()

                repeat wait()
                until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
                local mouse = game.Players.LocalPlayer:GetMouse()
                repeat wait() until mouse

                local plr = game.Players.LocalPlayer
                local Torso = game.Players.LocalPlayer.Character.Torso
                local flying = false
                local deb = true
                local ctrl = {f = 0, b = 0, l = 0, r = 0}
                local lastctrl = {f = 0, b = 0, l = 0, r = 0}
                local maxspeed = 200
                local speed = 0
                local WKey = Enum.KeyCode.W
                local AKey = Enum.KeyCode.A
                local SKey = Enum.KeyCode.S
                local DKey = Enum.KeyCode.D

                function Fly()
                local bg = Instance.new("BodyGyro", Torso)
                bg.P = 9e4
                bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.cframe = Torso.CFrame
                local bv = Instance.new("BodyVelocity", Torso)
                bv.velocity = Vector3.new(0,0.1,0)
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
                repeat wait()
                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+3+(speed/maxspeed)
                if speed > maxspeed then
                speed = maxspeed
                end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-5
                if speed < 0 then
                speed = 0
                end
                end
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                bv.velocity = Vector3.new(0,0.1,0)
                end
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
                until not flying or value == false
                ctrl = {f = 0, b = 0, l = 0, r = 0}
                lastctrl = {f = 0, b = 0, l = 0, r = 0}
                speed = 0
                bg:Destroy()
                bv:Destroy()
                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
                
                UIS.InputBegan:Connect(function(i)
                    if i.KeyCode == Enum.KeyCode[Options.flyKey.Value] then
                        if flying then 
                            flying = false
                        else
                            flying = true
                            Fly()
                        end
                    elseif i.KeyCode == WKey then
                        ctrl.f = 1
                    elseif i.KeyCode == SKey then
                        ctrl.b = -1
                    elseif i.KeyCode == AKey then
                        ctrl.l = -1
                    elseif i.KeyCode == DKey then
                        ctrl.r = 1
                    end
                end)
                
                UIS.InputEnded:Connect(function(i)
                    if i.KeyCode == WKey then
                        ctrl.f = 0
                    elseif i.KeyCode == SKey then
                        ctrl.b = 0
                    elseif i.KeyCode == AKey then
                        ctrl.l = 0
                    elseif i.KeyCode == DKey then
                        ctrl.r = 0
                    end
                end)
                Fly()

                if flying == false then
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end

            until flyBool== false
            
        end

        if flyBool == false then
            flying = false
        end
    end
    coroutine.wrap(flyEnable)()

end)

local GunMods = function ()
    game:GetService("RunService").RenderStepped:Connect(function ()
        if Toggles.gunMods.Value == true and InGame == true then   

            local gunService = workspace[game.Players.LocalPlayer.Name][currentGun]["ACS_Modulo"].Variaveis.Settings
            local m = require(gunService)
            local Ammo = workspace[game.Players.LocalPlayer.Name][currentGun]["ACS_Modulo"].Variaveis.Ammo

            if Toggles.infAmmo.Value == true then
                Ammo.Value = 10000
            end

            if Toggles.noSway.Value == true then
                m.SwayBase = 0.00
                m.MaxSway = 0
            else
                m.SwayBase = 0.25
                m.MaxSway = 2
            end

            m.FireRate = Options.fireRate.Value
            m.MaxSpread = 0
            m.MinSpread = 0
            m.VRecoil = {0, 0}
            m.HRecoil = {0, 0}
            m.FallOfDamage = 0.0

            
        end
        
    end)


end
coroutine.wrap(GunMods)()

Options.tpLoopKey:OnClick(function ()

    if DeathLoop == false then
        DeathLoop = true
        Library:Notify("Death Loop Enabled")
    else
        DeathLoop = false
        Library:Notify("Death Loop Disabled")
    end

    deathLoopPos = workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame

    while DeathLoop == true do
        for i,v in pairs(game.Players:GetChildren()) do

            if v.Character ~= nil and v.TeamColor ~= lplr.TeamColor then
                workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = workspace[v.Name].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                wait(1)
            end
            
            if v.Character == nil then
                DeathLoop = false
                Library:Notify("Death Loop Disabled")
            end
        end
        
    end

end)

local RenderEdit = function ()

    local filter = Instance.new("ColorCorrectionEffect", game:GetService("Workspace").Camera)
    local bloom = Instance.new("BloomEffect", game:GetService("Workspace").Camera)

    game:GetService("RunService").RenderStepped:Connect(function ()
        
        if Toggles.clr_correction.Value == true then
            filter.Brightness = Options.brightness.Value / 100
            filter.Contrast = Options.contrast.Value / 100
            filter.Enabled = true
            filter.Saturation = Options.saturation.Value / 100
            filter.TintColor = Options.clrCorrct.Value
        else
            filter.Enabled = false
        end

        if Toggles.bloom.Value == true then
            
            bloom.Enabled = true
            bloom.Intensity = Options.bloom_intensity.Value / 100
            bloom.Size = Options.bloom_size.Value
            bloom.Threshold = Options.bloom_threshold.Value
        else
            bloom.Enabled = false
        end
        
    end)

end
coroutine.wrap(RenderEdit)()

Library:Notify("Welcome to a fixed version of jailbird.gg")
