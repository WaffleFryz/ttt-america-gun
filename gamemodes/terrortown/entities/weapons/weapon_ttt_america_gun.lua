if CLIENT then
   SWEP.PrintName          = "AMERICA Gun"
   SWEP.Slot               = 1

   SWEP.ViewModelFlip      = false
   SWEP.ViewModelFOV       = 40

   SWEP.Icon               = "vgui/ttt/icon_deagle"
end

SWEP.Base                  	 = "weapon_tttbase"

SWEP.UseHands                = true
SWEP.ViewModel               = "models/weapons/c_deagle_america.mdl"
SWEP.WorldModel              = "models/weapons/w_deagle_america.mdl"

SWEP.Kind                  = WEAPON_PISTOL
SWEP.WeaponID              = AMMO_DEAGLE

SWEP.Primary.Ammo          = "AlyxGun"
SWEP.Primary.Recoil 	   = 8
SWEP.Primary.Damage 	   = 43
SWEP.Primary.Delay 		   = 1.45
SWEP.Primary.Cone 		   = 0.005
SWEP.Primary.ClipSize      = 7
SWEP.Primary.ClipMax       = 35
SWEP.Primary.DefaultClip   = 7
SWEP.Primary.Automatic     = true

SWEP.IronSightsPos = Vector(-3, -15.857, 0.36)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.AutoSpawnable 		   = true
SWEP.Spawnable             = true
SWEP.AmmoEnt               = "item_ammo_revolver_ttt"

local primarySounds = {"Weapon_AMERICA.Fire1", "Weapon_AMERICA.Fire2", "Weapon_AMERICA.Fire3", 
    "Weapon_AMERICA.Fire4", "Weapon_AMERICA.Fire5", "Weapon_AMERICA.Fire6", "Weapon_AMERICA.Fire7"}

-- Horrible concatting here
function SWEP:PrimaryAttack()
    local i = (8 - self:Clip1()) % 8
    self.Primary.Sound = primarySounds[i]
	return self.BaseClass.PrimaryAttack(self)
end

-- Add some zoom to ironsights for this gun
function SWEP:SecondaryAttack()
    if not self.IronSightsPos then return end
    if self:GetNextSecondaryFire() > CurTime() then return end

    local bIronsights = not self:GetIronsights()

    self:SetIronsights( bIronsights )

    if SERVER then
        self:SetZoom(bIronsights)
    end

    self:SetNextSecondaryFire( CurTime() + 0.3)
end

function SWEP:Reload()
	if ( self:Clip1() > 0 or self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
    self:DefaultReload( ACT_VM_RELOAD )
    self:SetIronsights( false )
	self:SetZoom( false )

	self:EmitSound("Weapon_AMERICA.Reload") -- Maybe I'll replace the reload sound if we get a custom model
end

function SWEP:DryFire(setnext)
    if CLIENT and LocalPlayer() == self:GetOwner() then
       self:EmitSound( "Weapon_AMERICA.Empty" )
    end
 
    setnext(self, CurTime() + 0.2)
 
    self:Reload()
 end

-- Slow Down the deploy speed to match the music
function SWEP:Equip() 
    if GetConVar("ttt_america_gun_slowdeploy"):GetInt() == 1 then
        self:SetDeploySpeed(0.152)
    else
        self:SetDeploySpeed(1.0)
    end
end

-- FUCK YEAH
function SWEP:Deploy()
	if GetConVar("ttt_america_gun_playintro"):GetInt() == 1 then
		self:EmitSound("Weapon_AMERICA.Deploy")
	end
	return self.BaseClass.Deploy(self)
end

function SWEP:SetZoom(state)
    if CLIENT then
       return
    elseif IsValid(self.Owner) and self.Owner:IsPlayer() then
       if state then
          self.Owner:SetFOV(20, 0.3)
       else
          self.Owner:SetFOV(0, 0.2)
       end
    end
end

function SWEP:Holster()
    self:SetIronsights(false)
    self:SetZoom(false)
    return true
end

function SWEP:PreDrop()
    self:SetZoom(false)
    self:SetIronsights(false)
    return self.BaseClass.PreDrop(self)
end