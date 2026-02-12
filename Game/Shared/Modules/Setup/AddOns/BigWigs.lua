local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

local function ImportBigWigs(addon, resolution)
    local D = SMSMUI:GetModule("Data")

    local profile = "bigwigs" .. (resolution or "")

    BigWigsAPI.RegisterProfile(SMSMUI.title, D[profile], "SMSM", function(callback)
        if not callback then

            return
        end

        SE.CompleteSetup(addon)

        SMSMUI.db.char.loaded = true
        SMSMUI.db.global.version = SMSMUI.version
    end)
end

function SE.BigWigs(addon, import, resolution)
    local BigWigs3DB = BigWigs3DB
    local db

    if import then
        ImportBigWigs(addon, resolution)
    else
        if not SE.IsProfileExisting(BigWigs3DB) then
            SE.RemoveFromDatabase(addon)

            return
        end

        db = LibStub("AceDB-3.0"):New(BigWigs3DB)

        db:SetProfile("SMSM")
    end
end