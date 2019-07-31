local kMarineWeaponDecaySlowDistance = 4

local stayTime = kWeaponStayTime
local stayTimeSlowed = kWeaponStayTime * 2

function Weapon:CheckExpireTime()
    PROFILE("Weapon:CheckExpireTime")

    if self:GetExpireTime() == 0 then
        return false
    end

    if #GetEntitiesForTeamWithinRange("Marine", self:GetTeamNumber(), self:GetOrigin(), kMarineWeaponDecaySlowDistance) > 0 then
        if not self.decaySlowed then
            local oldExpireTime = self:GetExpireTime()
            self.decaySlowed = true
            kWeaponStayTime = stayTimeSlowed
            self.expireTime = self.weaponWorldStateTime + kWeaponStayTime

            CompMod:Print("Slowing...")
            CompMod:Print("Expire Time Fraction now " .. self:GetExpireTimeFraction())
            CompMod:Print("Old expire time " .. oldExpireTime)
            CompMod:Print("Expire time now " .. self:GetExpireTime())
        end
    else
        if self.decaySlowed then
            local oldExpireTime = self.expireTime
            self.decaySlowed = false
            kWeaponStayTime = stayTime
            self.expireTime = self.weaponWorldStateTime + kWeaponStayTime

            CompMod:Print("Restoring")
            CompMod:Print("Expire Time Fraction now " .. self:GetExpireTimeFraction())
            CompMod:Print("Old expire time " .. oldExpireTime)
            CompMod:Print("Expire time now " .. self:GetExpireTime())
        end
    end

    return true
end
