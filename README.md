# MyLinoria

Custom **Linoria** fork with a dark **MenHub-style** default theme.

Based on [mstudio45/LinoriaLib](https://github.com/mstudio45/LinoriaLib) (originally [violin-suzutsuki/LinoriaLib](https://github.com/violin-suzutsuki/LinoriaLib)).

## Defaults (MenHub look)

| Color | RGB | Hex |
|-------|-----|-----|
| Font | 200, 200, 200 | `#c8c8c8` |
| Main | 18, 18, 18 | `#121212` |
| Background | 12, 12, 12 | `#0c0c0c` |
| Accent | 145, 145, 145 | `#919191` |
| Outline | 38, 38, 38 | `#262626` |

Built-in theme name: **`MenHub`** (also applied as Default).

## Structure

```
MyLinoria/
├── Library.lua
├── Example.lua
├── README.md
└── addons/
    ├── ThemeManager.lua
    └── SaveManager.lua
```

Optional (for custom cursor / assets): copy `assets/` from the upstream Linoria repo into this repo if you use local asset download.

## Usage

After you push to GitHub, replace `YOUR_USERNAME`:

```lua
local repo = "https://raw.githubusercontent.com/YOUR_USERNAME/MyLinoria/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "My Script",
    Center = true,
    AutoShow = true,
})
```

Or run `Example.lua` for a full MenHub-like layout (Aimbot / Silent / RageBot / Visuals / Misc / Settings).

## Before publishing

1. Create a new GitHub repo (e.g. `MyLinoria`).
2. Replace every `YOUR_USERNAME` in:
   - `Library.lua` → `BaseURL`
   - `Example.lua` → `repo`
3. (Optional) Add upstream `assets/` folder so cursor/dropdown icons download from your repo.
4. Push `main`.

## Credits

- Inori / violin-suzutsuki — original LinoriaLib  
- mstudio45 — maintained fork  
- Theme defaults restyled for a MenHub-like dark UI  

## License

Respect the license of the upstream Linoria project when redistributing.
