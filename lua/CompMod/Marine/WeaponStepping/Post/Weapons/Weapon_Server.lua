local kMarineWeaponDecaySlowDistance = 4

function Weapon:CheckExpireTime()
    PROFILE("Weapon:CheckExpireTime")

    if self:GetExpireTime() == 0 then
        return false
    end

    if #GetEntitiesForTeamWithinRange("Marine", self:GetTeamNumber(), self:GetOrigin(), kMarineWeaponDecaySlowDistance) > 0 then
        local now = Shared.GetTime()
        self:StartExpiration(self.expireTime - now + 0.05)
        return false
    end

    return true
end

function Weapon:StartExpiration(stayTime)

    stayTime = stayTime or kWeaponStayTime
    self.weaponWorldStateTime = Shared.GetTime()
    self.expireTime = Shared.GetTime() + stayTime

    self:AddTimedCallback( self.CheckExpireTime, 0.5, false)

end