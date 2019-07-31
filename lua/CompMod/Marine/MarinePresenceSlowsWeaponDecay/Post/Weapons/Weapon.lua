local netvars = {
    decaySlowed = "boolean",
}

local oldInit = Weapon.OnInitialized
function Weapon:OnInitialized()
    oldInit(self)
    self.decaySlowed = false
end

Shared.LinkClassToMap("Weapon", Weapon.kMapName, netvars, true)
