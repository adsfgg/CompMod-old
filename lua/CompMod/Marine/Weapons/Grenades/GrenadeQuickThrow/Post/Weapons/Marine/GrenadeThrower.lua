local networkVars =
{
    grenadesLeft = "integer (0 to ".. kMaxHandGrenades ..")",
    pullPinOnDeploy = "private boolean",
    throwASAP = "private boolean",
    quickThrown = "boolean"
}

local oldOnPrimaryAttack = GrenadeThrower.OnPrimaryAttack
function GrenadeThrower:OnPrimaryAttack(_)
    oldOnPrimaryAttack(_)

    self:SetIsQuickThrown(true)
end

function GrenadeThrower:GetIsQuickThrown()
    return self.quickThrown
end

function GrenadeThrower:SetIsQuickThrown(quickThrown)
    assert(type(quickThrown) == "boolean")
    self.quickThrown = quickThrown
end

Shared.LinkClassToMap("GrenadeThrower", GrenadeThrower.kMapName, networkVars)