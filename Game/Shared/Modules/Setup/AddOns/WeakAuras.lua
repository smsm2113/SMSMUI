local SMSMUI = unpack(SMSMUI)
local SE = SMSMUI:GetModule("Setup")

function SE.WeakAuras(_, frame, strata, weakaura)
    local D = SMSMUI:GetModule("Data")

    if frame and strata then
        SMSMUI.SetFrameStrata(frame, strata)
    end

    WeakAuras.Import(D[weakaura])
end