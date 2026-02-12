local SMSMUI = unpack(SMSMUI)

local chatCommands = {}

-- MODIFIED: This now ignores the token and always says "Yes"
local function ValidateToken(token)
    return true 
end

local function CreateUnlocker()
    -- This function is now technically redundant, 
    -- but we keep it so the addon doesn't crash when looking for it.
    local AceGUI = LibStub("AceGUI-3.0")
    local frame, editbox, button

    frame = AceGUI:Create("Frame")
    frame:SetTitle("SMSMUI Unlocker - BYPASSED")
    frame:SetStatusText(format("%s %.2f", SMSMUI.title, SMSMUI.version))
    frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
    frame:SetLayout("Flow")
    frame:SetWidth(500)
    frame:SetHeight(150)

    editbox = AceGUI:Create("EditBox")
    editbox:SetLabel("Bypass Active: Just type anything and click Validate")
    editbox:SetWidth(350)
    frame:AddChild(editbox)

    button = AceGUI:Create("Button")
    button:SetText("Validate")
    button:SetWidth(100)
    button:SetCallback("OnClick", function()
        -- Any text entered here will now trigger the installer
        frame:Hide()
        SMSMUI.db.global.token = "Bypassed"
        SMSMUI:RunInstaller()
    end)
    frame:AddChild(button)
end

-- MODIFIED: Always returns true so the installer never asks for a code
function SMSMUI:IsTokenValid(silent)
    return true
end

function SMSMUI.SetFrameStrata(frame, strata)
    frame:SetFrameStrata(strata)
end

function SMSMUI:OpenSettings()
    local PluginInstallFrame = PluginInstallFrame

    if PluginInstallFrame and PluginInstallFrame:IsShown() then
        self.SetFrameStrata(PluginInstallFrame, "MEDIUM")
    end

    Settings.OpenToCategory(self.category)
end

function SMSMUI:RunInstaller()
    local I = SMSMUI:GetModule("Installer")
    local E, PI

    -- This will now always pass because IsTokenValid is forced to true
    if not self:IsTokenValid() or InCombatLockdown() then
        return
    end

    if self:IsAddOnEnabled("ElvUI") then
        E = unpack(ElvUI)
        PI = E:GetModule("PluginInstaller")

        PI:Queue(I.installer)
        return
    end

    self:OpenSettings()
end

function chatCommands.install()
    SMSMUI:RunInstaller()
end

function SMSMUI:HandleChatCommand(input)
    local command = chatCommands[input]

    if not command then
        self:Print("Command does not exist")
        return
    end

    command()
end

function SMSMUI:LoadProfiles()
    local SE = SMSMUI:GetModule("Setup")

    for k in pairs(self.db.global.profiles) do
        if self:IsAddOnEnabled(k) then
            SE:Setup(k)
        end
    end

    self.db.char.loaded = true
    ReloadUI()
end