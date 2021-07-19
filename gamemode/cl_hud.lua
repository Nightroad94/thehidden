
function draw.Cross( x, y, sz, t )
	surface.DrawRect( x - sz/2, y - t/2, sz, t )
	surface.DrawRect( x - t/2, y - sz/2, t, sz )
end

local hdn_hp = Material( "hud/hdn_hdnhealth", "noclamp smooth" )
local hdn_hp_id = surface.GetTextureID( "hud/hdn_hdnhealth" )
local hdn_stamina = Material( "hud/hdn_staminabar", "noclamp smooth" )
local hdn_stamina_id = surface.GetTextureID( "hud/hdn_staminabar" )
local hdn_stamina_bg = Material( "hud/hdn_staminaBG", "noclamp smooth" )
local hdn_stamina_bg_id = surface.GetTextureID( "hud/hdn_staminaBG" )
local x = 20
local y = 20
local gap = 10
local col = Color( 235, 235, 235, 255 )
local h_colglow = Color( 235, 235, 235, 255 )
local h_colglow2 = Color( 235, 235/2, 235/2, 255 )

local colglow = Color( 235, 235, 235, 255 )
local colglow2 = Color( 235/2, 235/2, 235, 255 )
local colglow3 = Color( 235, 235, 235, 255 )

function DrawLegacyHUD( ply )
end 

local x = 100
local y = 30

local gap = -4
local sz = 48
local c_x = x - sz - gap
local c_y = y + sz/2 + 4
local t = 12
local c_blur = 6 

local h = 5

local out_gap = 5

local _xsz = 81
local total_size = 171

local RoundNames =
{ 
	[ROUND_WAITING] 	= "WAITING",
	[ROUND_PREPARING]	= "PREPARING",
	[ROUND_ACTIVE] 		= "IN PROGRESS",
	[ROUND_ENDED] 		= "POST-ROUND"
}
function GetRoundTranslation()
	return RoundNames[ GAMEMODE:GetRoundState() ] or "UNDEFINED"
end

DrawHud = 
{
	[ TEAM_HUMAN ] = function( ply )

	end,

	[ TEAM_HIDDEN ] = function( ply )

	end,

	[ TEAM_SPECTATOR ] = function( ply ) 
	
	end,

	[ TEAM_UNASSIGNED ] = function( ply )

	end

}

function GM:HUDPaint()
	local ply = LocalPlayer()
	if not IsValid( ply ) then return end 
	if DrawHud[ ply:Team() ] then
		DrawHud[ ply:Team() ]( ply )
	end
end


function GM:HUDShouldDraw( name )
	
	for k, v in pairs{ "CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo", "CHudVoiceStatus" } do
	
		if name == v then return false end 
		
  	end 
	
	if name == "CHudDamageIndicator" and not LocalPlayer():Alive() then
	
		return false
		
	end
	
	return true
	
end
