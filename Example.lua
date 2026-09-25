--[[
  MyLinoria — MenHub-style dark theme example
  Replace YOUR_USERNAME with your GitHub username after upload.
]]

local repo = "https://raw.githubusercontent.com/YOUR_USERNAME/MyLinoria/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ShowCustomCursor = true

local Window = Library:CreateWindow({
    Title = "MenHub v2 | Beta Version",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.15,
})

local Tabs = {
    Aimbot   = Window:AddTab("Aimbot"),
    Silent   = Window:AddTab("Silent"),
    RageBot  = Window:AddTab("RageBot"),
    Visuals  = Window:AddTab("Visuals"),
    Misc     = Window:AddTab("Misc"),
    Settings = Window:AddTab("Settings"),
}

-- ==================== AIMBOT ====================
local AimMain = Tabs.Aimbot:AddLeftGroupbox("Main")
AimMain:AddToggle("AimbotEnabled", {
    Text = "Enabled",
    Default = false,
    Callback = function(Value) end,
})
AimMain:AddToggle("AimbotWallCheck", {
    Text = "Wall Check",
    Default = false,
})
AimMain:AddSlider("AimbotSpeed", {
    Text = "Speed",
    Default = 2.5,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Compact = false,
})
AimMain:AddDropdown("AimbotIgnoreWeapons", {
    Values = { "None", "Melee", "Throwable", "All" },
    Default = 1,
    Multi = false,
    Text = "Ignore Weapons",
})

local AimUI = Tabs.Aimbot:AddLeftGroupbox("UI")
AimUI:AddToggle("AimbotIgnoreFov", {
    Text = "Ignore Fov",
    Default = false,
})
AimUI:AddSlider("AimbotFov", {
    Text = "Fov",
    Default = 456,
    Min = 10,
    Max = 1000,
    Rounding = 0,
})

-- ==================== SILENT ====================
local SilMain = Tabs.Silent:AddLeftGroupbox("Main")
SilMain:AddToggle("SilentEnabled", { Text = "Enabled", Default = false })
SilMain:AddToggle("SilentWallCheck", { Text = "Wall Check", Default = false })
SilMain:AddSlider("SilentFov", {
    Text = "Fov",
    Default = 250,
    Min = 10,
    Max = 1000,
    Rounding = 0,
})
SilMain:AddDropdown("SilentHitPart", {
    Values = { "Head", "Torso", "Closest" },
    Default = 1,
    Text = "Hit Part",
})

-- ==================== RAGEBOT ====================
local RageMain = Tabs.RageBot:AddLeftGroupbox("Main")
RageMain:AddToggle("RageEnabled", { Text = "Enabled", Default = false })
RageMain:AddSlider("RageDistance", {
    Text = "Distance",
    Default = 500,
    Min = 50,
    Max = 2000,
    Rounding = 0,
})
RageMain:AddToggle("RageAutoShoot", { Text = "Auto Shoot", Default = true })

local RageMove = Tabs.RageBot:AddRightGroupbox("Movement")
RageMove:AddToggle("VoidSpam", { Text = "Void Spam", Default = false })
RageMove:AddSlider("VoidRadius", {
    Text = "Void Radius",
    Default = 500,
    Min = 100,
    Max = 100000,
    Rounding = 0,
})
RageMove:AddSlider("VoidDelay", {
    Text = "Void Delay",
    Default = 0.1,
    Min = 0.01,
    Max = 1,
    Rounding = 2,
})
RageMove:AddToggle("Orbit", { Text = "Orbit", Default = false })

-- ==================== VISUALS ====================
local VisESP = Tabs.Visuals:AddLeftGroupbox("ESP")
VisESP:AddToggle("ESPEnabled", { Text = "Enabled", Default = false })
VisESP:AddToggle("ESPBoxes", { Text = "Boxes", Default = true })
VisESP:AddToggle("ESPNames", { Text = "Names", Default = true })
VisESP:AddToggle("ESPHealth", { Text = "Health", Default = true })

local VisWorld = Tabs.Visuals:AddRightGroupbox("World")
VisWorld:AddToggle("Fullbright", { Text = "Fullbright", Default = false })
VisWorld:AddToggle("NoFog", { Text = "No Fog", Default = false })

-- ==================== MISC ====================
local MiscMove = Tabs.Misc:AddLeftGroupbox("Movement")
MiscMove:AddToggle("Fly", { Text = "Fly", Default = false })
MiscMove:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 50,
    Min = 10,
    Max = 200,
    Rounding = 0,
})
MiscMove:AddToggle("Noclip", { Text = "Noclip", Default = false })
MiscMove:AddToggle("SpeedHack", { Text = "Speed", Default = false })

-- ==================== SETTINGS ====================
local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu")
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = false,
    Text = "Menu keybind",
})
MenuGroup:AddButton("Unload", function()
    Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("MyLinoria")
SaveManager:SetFolder("MyLinoria/configs")

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

pcall(function()
    ThemeManager:SetTheme("MenHub")
end)

SaveManager:LoadAutoloadConfig()

Library:Notify("MyLinoria (MenHub theme) loaded", 4)
print("[MyLinoria] ready")
