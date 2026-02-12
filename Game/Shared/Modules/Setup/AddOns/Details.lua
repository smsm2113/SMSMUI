local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

function SE.Details(addon, import, resolution)
    local D = SMSMUI:GetModule("Data")

    local data, decompressedData
    local profile = "details" .. (resolution or "")
    local Details = Details

    if import then
        data = DetailsFramework:Trim(D[profile])
        decompressedData = Details:DecompressData(data, "print")

        Details:EraseProfile("SMSM")
        Details:ImportProfile(D[profile], "SMSM", false, false, true)

        for i, v in Details:ListInstances() do
            DetailsFramework.table.copy(v.hide_on_context, decompressedData.profile.instances[i].hide_on_context)
        end

        SE.CompleteSetup(addon)

        SMSMUI.db.char.loaded = true
        SMSMUI.db.global.version = SMSMUI.version
    else
        if not Details:GetProfile("SMSM") then
            SE.RemoveFromDatabase(addon)

            return
        end

        Details:ApplyProfile("SMSM")
    end
end