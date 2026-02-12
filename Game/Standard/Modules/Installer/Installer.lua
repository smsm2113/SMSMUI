local SMSMUI = unpack(SMSMUI)
local I = SMSMUI:GetModule("Installer")
local SE = SMSMUI:GetModule("Setup")

I.installer = {
    Title = format("%s %s", SMSMUI.title, "Installation"),
    Name = SMSMUI.title,
    -- Updated: Ensure the logo path matches your renamed folder
    tutorialImage = "Interface\\AddOns\\SMSMUI\\Game\\Shared\\Media\\Textures\\LogoTop.tga",
    Pages = {
        [1] = function()
            PluginInstallFrame.SubTitle:SetFormattedText("Welcome to %s", SMSMUI.title)

            if not SMSMUI.db.global.profiles then
                PluginInstallFrame.Desc1:SetText("To start the installation process, click on 'Continue'")
                return
            end

            PluginInstallFrame.Desc1:SetText("To load your installed profiles onto this character, click on 'Load Profiles'")
            PluginInstallFrame.Desc3:SetText("To start the installation process again, click on 'Continue'")
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SMSMUI:LoadProfiles() end)
            PluginInstallFrame.Option1:SetText("Load Profiles")
        end,
        [2] = function()
            PluginInstallFrame.SubTitle:SetText("ElvUI")
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("ElvUI", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("ElvUI", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p")
        end,
        [3] = function()
            PluginInstallFrame.SubTitle:SetText("NephUI Cooldown Manager")

            -- Check if the actual Addon (the engine) is enabled on this character
            if not (SMSMUI:IsAddOnEnabled("NephUI Cooldown Manager") or SMSMUI:IsAddOnEnabled("BetterCooldownManager")) then
                PluginInstallFrame.Desc1:SetText("Enable NephUI Cooldown Manager or BetterCooldownManager to unlock this step")
                PluginInstallFrame.Option1:Hide()
                PluginInstallFrame.Option2:Hide()
                return
            end

            -- Description text for the user
            PluginInstallFrame.Desc1:SetText("Select your resolution to import the Cooldown Manager profiles.")

            -- 1440p Button
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() 
                SE:SetupNephUICDM("NephUI Cooldown Manager", true) 
            end)
            PluginInstallFrame.Option1:SetText("1440p")
            
            -- 1080p Button
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() 
                SE:SetupNephUICDM("NephUI Cooldown Manager", true, "1080p") 
            end)
            PluginInstallFrame.Option2:SetText("1080p")
        end,
        [4] = function()
            PluginInstallFrame.SubTitle:SetText("BigWigs")
            if not SMSMUI:IsAddOnEnabled("BigWigs") then
                PluginInstallFrame.Desc1:SetText("Enable BigWigs to unlock this step")
                return
            end
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("BigWigs", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("BigWigs", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p")
        end,
        [5] = function()
            PluginInstallFrame.SubTitle:SetText("Blizzard_EditMode")
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("Blizzard_EditMode", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("Blizzard_EditMode", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p")
        end,
        [6] = function()
            PluginInstallFrame.SubTitle:SetText("Details")
            if not SMSMUI:IsAddOnEnabled("Details") then
                PluginInstallFrame.Desc1:SetText("Enable Details to unlock this step")
                return
            end
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("Details", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("Details", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p")
        end,
        [7] = function()
            PluginInstallFrame.SubTitle:SetText("Plater")
            if not SMSMUI:IsAddOnEnabled("Plater") then
                PluginInstallFrame.Desc1:SetText("Enable Plater to unlock this step")
                return
            end
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("Plater", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("Plater", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p")
        end,
        [8] = function()
            PluginInstallFrame.SubTitle:SetText("WarpDeplete")
            if not SMSMUI:IsAddOnEnabled("WarpDeplete") then
                PluginInstallFrame.Desc1:SetText("Enable WarpDeplete to unlock this step")
                return
            end
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() SE:Setup("WarpDeplete", true) end)
            PluginInstallFrame.Option1:SetText("1440p")
            PluginInstallFrame.Option2:Show()
            PluginInstallFrame.Option2:SetScript("OnClick", function() SE:Setup("WarpDeplete", true, "1080p") end)
            PluginInstallFrame.Option2:SetText("1080p")
        end,
        [9] = function()
            PluginInstallFrame.SubTitle:SetText("Installation Complete")
            PluginInstallFrame.Desc1:SetText("You have completed the installation process")
            PluginInstallFrame.Desc2:SetText("Please click on 'Reload' to save your settings and reload your UI")
            PluginInstallFrame.Option1:Show()
            PluginInstallFrame.Option1:SetScript("OnClick", function() ReloadUI() end)
            PluginInstallFrame.Option1:SetText("Reload")
        end
    },
    StepTitles = {
        [1] = "Welcome",
        [2] = "ElvUI",
        [3] = "NephUI Cooldown Manager",
        [4] = "BigWigs",
        [5] = "Blizzard_EditMode",
        [6] = "Details",
        [7] = "Plater",
        [8] = "WarpDeplete",
        [9] = "Installation Complete"
    },
    StepTitlesColor = {1, 1, 1},
    StepTitlesColorSelected = {0, 179/255, 1},
    StepTitleWidth = 200,
    StepTitleButtonWidth = 180,
    StepTitleTextJustification = "RIGHT"
}