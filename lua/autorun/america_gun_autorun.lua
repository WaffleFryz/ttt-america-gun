sound.Add({
	name = 			"Weapon_AMERICA.Reload",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/reload.wav"	
})

sound.Add({
	name = 			"Weapon_AMERICA.Deploy",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/deploy.wav"	
})

CreateConVar(
	"ttt_america_gun_playintro", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED,
	"Play music during Deploy?"
)

CreateConVar(
	"ttt_america_gun_slowdeploy", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED,
	"Slowdown deploy speed to match music speed?"
)