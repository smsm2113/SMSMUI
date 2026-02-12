local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

local function ImportPlater(addon, resolution)
    local D = SMSMUI:GetModule("Data")

    local Plater = Plater
    local profile = "plater" .. (resolution or "")
    local data = Plater.DecompressData(D[profile], "print")

    if not SE:IsHooked(Plater, "OnProfileCreated") then
        SE:RawHook(Plater, "OnProfileCreated", function()
            C_Timer.After (.5, function()
                Plater.ImportScriptsFromLibrary()
                Plater.ApplyPatches()
                Plater.CompileAllScripts("script")
                Plater.CompileAllScripts("hook")
                
                Plater:RefreshConfig()
                Plater.UpdatePlateClickSpace()
            end)
        end)
    end

    SE.CompleteSetup(addon)
    Plater.ImportAndSwitchProfile("SMSM", data, false, false, true, true)

    SMSMUI.db.char.loaded = true
    SMSMUI.db.global.version = SMSMUI.version
end

function SE.Plater(addon, import, resolution)
    local Plater = Plater

    if not SE:IsHooked(Plater, "RefreshConfigProfileChanged") then
        SE:RawHook(Plater, "RefreshConfigProfileChanged", function() Plater:RefreshConfig() end)
    end

    if import then
        ImportPlater(addon, resolution)
    else
        if not SE.IsProfileExisting(PlaterDB) then
            SE.RemoveFromDatabase(addon)

            return
        end

        Plater.db:SetProfile("SMSM")
    end
end