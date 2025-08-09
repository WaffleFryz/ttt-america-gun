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

sound.Add({
	name = 			"Weapon_AMERICA.Empty",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/empty.wav"	
})

sound.Add({
	name = 			"Weapon_AMERICA.Fire1",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/fire1.wav"	
})
sound.Add({
	name = 			"Weapon_AMERICA.Fire2",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/fire2.wav"	
})
sound.Add({
	name = 			"Weapon_AMERICA.Fire3",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/fire3.wav"	
})
sound.Add({
	name = 			"Weapon_AMERICA.Fire4",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/fire4.wav"	
})
sound.Add({
	name = 			"Weapon_AMERICA.Fire5",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/fire5.wav"	
})
sound.Add({
	name = 			"Weapon_AMERICA.Fire6",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/fire6.wav"	
})
sound.Add({
	name = 			"Weapon_AMERICA.Fire7",			
	channel = 		CHAN_WEAPON,
	volume = 		1.0,
	sound = 			"weapons/AMERICA/fire7.wav"	
})


CreateConVar(
	"ttt_america_gun_playintro", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED,
	"Play music during Deploy?"
)

CreateConVar(
	"ttt_america_gun_slowdeploy", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED,
	"Slowdown deploy speed to match music speed?"
)