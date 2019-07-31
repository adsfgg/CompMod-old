local kMarineWeaponDecaySlowDistance = 4

local oldCheckExpireTime = Weapon.CheckExpireTime
function Weapon:CheckExpireTime()
    if oldCheckExpireTime(self) then
        local expireFraction = self:GetExpireTimeFraction()
        if #GetEntitiesForTeamWithinRange("Marine", self:GetTeamNumber(), self:GetOrigin(), kMarineWeaponDecaySlowDistance) > 0 then
            if not self.decaySlowed then
                local oldExpireTime = self:GetExpireTime()
                local timeLeft = kWeaponStayTime * expireFraction
                local extension = (timeLeft * 2) - kWeaponStayTime
                local newTime = oldExpireTime + extension

                self.expireTime = newTime

                CompMod:Print("Expire time slowed from " .. oldExpireTime .. " to " .. newTime)

                self.decaySlowed = true
            end
        else
            if self.decaySlowed then
                local timeLeft = kWeaponStayTime * expireFraction
                local oldExpireTime = self:GetExpireTime()
                self.expireTime = self.expireTime - (timeLeft / 2)
                local newTime = self:GetExpireTime()
                self.decaySlowed = false

                CompMod:Print("Expire time restored from " .. oldExpireTime .. " to " .. newTime)
            end
        end
    end

    return true
end
