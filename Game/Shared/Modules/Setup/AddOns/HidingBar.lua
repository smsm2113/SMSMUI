local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

local ipairs = ipairs

local HidingBarDB = HidingBarDB

local function ImportHidingBar(addon)
    local D = SMSMUI:GetModule("Data")

    local tinsert = tinsert

    local profiles = {}

    for _, v in ipairs(HidingBarDB.profiles) do
        if v.name ~= "SMSM" then
            v.isDefault = nil

            tinsert(profiles, v)
        end
    end

    SE.CompleteSetup(addon)
    tinsert(profiles, D.hidingbar)

    HidingBarDB.profiles = profiles

    SMSMUI.db.char.loaded = true
    SMSMUI.db.global.version = SMSMUI.version
end

function SE.HidingBar(addon, import)
    if import then
        ImportHidingBar(addon)
    end

    for _, v in ipairs(HidingBarDB.profiles) do
        if v.name == "SMSM" then
            HidingBarDBChar = nil

            return
        end
    end

    SE.RemoveFromDatabase(addon)
end