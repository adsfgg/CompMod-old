local kMarineWeaponDecaySlowDistance = 4

function Weapon:CheckExpireTime()
    PROFILE("Weapon:CheckExpireTime")

    if self:GetExpireTime() == 0 then
        return false
    end

    if #GetEntitiesForTeamWithinRange("Marine", self:GetTeamNumber(), self:GetOrigin(), kMarineWeaponDecaySlowDistance) > 0 then
        self:StartExpiration(self.expireTime + 0.25)
        return false
    end

    return true
end