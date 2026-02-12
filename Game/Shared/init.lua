local _G = _G

local C_AddOns_GetAddOnEnableState = C_AddOns.GetAddOnEnableState

local AceAddon = _G.LibStub("AceAddon-3.0")

local AddOnName, Engine = ...
local SMSMUI = AceAddon:NewAddon(AddOnName, "AceConsole-3.0")

Engine[1] = SMSMUI
_G.SMSMUI = Engine

SMSMUI.Data = SMSMUI:NewModule("Data")
SMSMUI.Installer = SMSMUI:NewModule("Installer")
SMSMUI.Setup = SMSMUI:NewModule("Setup", "AceHook-3.0")

do
    SMSMUI.Mists = WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC
    SMSMUI.Retail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
end

do
    function SMSMUI:AddonCompartmentFunc()
        SMSMUI:RunInstaller()
    end

    _G.SMSMUI_AddonCompartmentFunc = SMSMUI.AddonCompartmentFunc
end

function SMSMUI:GetAddOnEnableState(addon, character)
    return C_AddOns_GetAddOnEnableState(addon, character)
end

function SMSMUI:IsAddOnEnabled(addon)
    return SMSMUI:GetAddOnEnableState(addon, SMSMUI.myname) == 2
end

function SMSMUI:OnEnable()
    SMSMUI:Initialize()
end

function SMSMUI:OnInitialize()
    self.db = _G.LibStub("AceDB-3.0"):New("SMSMDB")

    if self.db.global.version and self.db.global.version <= 20260131 then
        self.db:ResetDB()
    end

    self:RegisterChatCommand("SMSMUI", "HandleChatCommand")
    _G.LibStub("AceConfig-3.0"):RegisterOptionsTable("SMSMUI", self.options)

    self.category = select(2, _G.LibStub("AceConfigDialog-3.0"):AddToBlizOptions("SMSMUI"))
end