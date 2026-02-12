local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

local C_EditMode, Enum = C_EditMode, Enum

local function IsLayoutExisting()
    local layouts = C_EditMode.GetLayouts()

    for i, v in ipairs(layouts.layouts) do
        if v.layoutName == "SMSM" then

            return Enum.EditModePresetLayoutsMeta.NumValues + i
        end
    end
end

local function ImportBlizzard_EditMode(addon, resolution)
    local D = SMSMUI:GetModule("Data")

    local layouts, info
    local layout = "blizzardeditmode" .. (resolution or "")

    layouts = C_EditMode.GetLayouts()

    for i = #layouts.layouts, 1, -1 do
        if layouts.layouts[i].layoutName == "SMSM" then
            tremove(layouts.layouts, i)
        end
    end

    info = C_EditMode.ConvertStringToLayoutInfo(D[layout])
    info.layoutName = "SMSM"
    info.layoutType = Enum.EditModeLayoutType.Account

    tinsert(layouts.layouts, info)
    C_EditMode.SaveLayouts(layouts)

    SE.CompleteSetup(addon)

    SMSMUI.db.char.loaded = true
    SMSMUI.db.global.version = SMSMUI.version
end

function SE.Blizzard_EditMode(addon, import, resolution)
    local layout

    if import then
        ImportBlizzard_EditMode(addon, resolution)
    end

    layout = IsLayoutExisting()

    if not layout then
        SE.RemoveFromDatabase(addon)

        return
    end

    C_EditMode.SetActiveLayout(layout)
end