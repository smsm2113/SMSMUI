local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

function SE:Setup(addon, ...)
    local setup = self[addon]

    setup(addon, ...)
end

function SE.CompleteSetup(addon)
    local PluginInstallStepComplete = PluginInstallStepComplete

    if PluginInstallStepComplete then
        if PluginInstallStepComplete:IsShown() then
            PluginInstallStepComplete:Hide()
        end

        PluginInstallStepComplete.message = "Success"

        PluginInstallStepComplete:Show()
    end

    if not SMSMUI.db.global.profiles then
        SMSMUI.db.global.profiles = {}
    end

    SMSMUI.db.global.profiles[addon] = true
end

function SE.IsProfileExisting(table)
    local db = LibStub("AceDB-3.0"):New(table)
    local profiles = db:GetProfiles()

    for i = 1, #profiles do
        if profiles[i] == "SMSM" then

            return true
        end
    end
end

function SE.RemoveFromDatabase(addon)
    SMSMUI.db.global.profiles[addon] = nil

    if SMSMUI.db.global.profiles and #SMSMUI.db.global.profiles == 0 then
        for k in pairs(SMSMUI.db.char) do
            k = nil
        end

        SMSMUI.db.global.profiles = nil
    end
end