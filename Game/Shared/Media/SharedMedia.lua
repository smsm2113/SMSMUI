local LSM = LibStub("LibSharedMedia-3.0")
local koKR, ruRU, zhCN, zhTW, western = LSM.LOCALE_BIT_koKR, LSM.LOCALE_BIT_ruRU, LSM.LOCALE_BIT_zhCN, LSM.LOCALE_BIT_zhTW, LSM.LOCALE_BIT_western

local MediaType_FONT = LSM.MediaType.FONT
local MediaType_STATUSBAR = LSM.MediaType.STATUSBAR

LSM:Register(MediaType_FONT, "GothamNarrowUltra",       [[Interface\Addons\SMSMUI\Game\Shared\Media\Fonts\GothamNarrowUltra.ttf]],                           ruRU + western)
LSM:Register(MediaType_FONT, "GothamNarrowUltra",       [[Interface\Addons\SMSMUI\Game\Shared\Media\Fonts\GothamNarrowUltraAsia.ttf]],                       koKR + zhCN + zhTW)
LSM:Register(MediaType_FONT, "SMSM",                   [[Interface\Addons\SMSMUI\Game\Shared\Media\Fonts\SMSM.ttf]],                                       ruRU + western)
LSM:Register(MediaType_FONT, "SMSM",                   [[Interface\Addons\SMSMUI\Game\Shared\Media\Fonts\SMSMAsia.ttf]],                                   koKR + zhCN + zhTW)

LSM:Register(MediaType_STATUSBAR, "Melli",                  [[Interface\Addons\SMSMUI\Game\Shared\Media\Textures\Melli]])
LSM:Register(MediaType_STATUSBAR, "SMSMGradient",          [[Interface\Addons\SMSMUI\Game\Shared\Media\Textures\SMSMGradient]])
LSM:Register(MediaType_STATUSBAR, "SMSMLeft",              [[Interface\Addons\SMSMUI\Game\Shared\Media\Textures\SMSMLeft]])
LSM:Register(MediaType_STATUSBAR, "SMSMMouseover",         [[Interface\Addons\SMSMUI\Game\Shared\Media\Textures\SMSMMouseover]])
LSM:Register(MediaType_STATUSBAR, "SMSMMouseoverArrows",   [[Interface\Addons\SMSMUI\Game\Shared\Media\Textures\SMSMMouseoverArrows]])
LSM:Register(MediaType_STATUSBAR, "SMSMRight",             [[Interface\Addons\SMSMUI\Game\Shared\Media\Textures\SMSMRight]])