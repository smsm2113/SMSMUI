local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

function SE:SetupNephUICDM(addon, import, resolution)
    -- 1. Get the data module
    local D = SMSMUI:GetModule("Data")
    local profileName = "NephUI Cooldown Manager" .. (resolution or "")
    local profileString = D[profileName]

    if import then
        -- 2. Attempt to find the engine
        -- Based on your screenshot, the name is "NephUI: Cooldown Manager"
        local success, engine = pcall(function() 
            return LibStub("AceAddon-3.0"):GetAddon("NephUI: Cooldown Manager", true) 
        end)

        if success and engine and profileString then
            -- 3. Perform the import
            engine:ImportBCDM(profileString, "SMSM")
            print("|cffffd700SMSMUI:|r NephUI Profile Imported.")
        else
            -- 4. Error reporting
            if not engine then
                print("|cffff0000SMSMUI Error:|r Engine not found. Check if 'NephUI: Cooldown Manager' is enabled.")
            end
            if not profileString then
                print("|cffff0000SMSMUI Error:|r Data string is NIL for " .. profileName)
            end
        end

        SE.CompleteSetup(addon)
        return
    end

    -- Initial DB setup
    local db = LibStub("AceDB-3.0"):New("NephUIDB")
    if db then db:SetProfile("SMSM") end
end