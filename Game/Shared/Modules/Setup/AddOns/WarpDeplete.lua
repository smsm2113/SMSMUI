local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

function SE.WarpDeplete(addon, import, resolution)
    local D = SMSMUI:GetModule("Data")

    local WarpDepleteDB = WarpDepleteDB
    local profile = "warpdeplete" .. (resolution or "")

    if import then
        SE.CompleteSetup(addon)

        WarpDepleteDB.profiles.SMSM = D[profile]

        SMSMUI.db.char.loaded = true
        SMSMUI.db.global.version = SMSMUI.version
    end

    if not SE.IsProfileExisting(WarpDepleteDB) then
        SE.RemoveFromDatabase(addon)

        return
    end

    WarpDeplete.db:SetProfile("SMSM")
end