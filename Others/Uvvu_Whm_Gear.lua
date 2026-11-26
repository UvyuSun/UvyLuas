-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal')
	state.PhysicalDefenseMode:options()
	state.MagicalDefenseMode:options()
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

	send_command('wait 3; input /lockstyleset 7')

end


function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Beryllium Mace",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Beryllium Mace",sub="Beryllium Mace"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Inyanga Jubbah +2",
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}                                                                                                                       --Total FC% 82

    sets.precast.FC.Insta = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Inyanga Jubbah +2",
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = sets.precast.FC['Healing Magic']

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
		
    sets.precast.WS.Dagan = {}
		
	sets.MaxTP = {}
	sets.MaxTP.Dagan = {}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters",}
    sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = {
    hands="Volte Bracers",
    legs="Volte Hose",
    waist="Chaac Belt",
}
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash",}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Bunzi's Robe",
    hands="Bunzi's Gloves",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back="Null Shawl",
}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}

    -- Fast Recast ~Total Haste + Fast Cast~
	
    sets.midcast.FastRecast = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands="Bunzi's Gloves",
    legs="Volte Brais",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Alabaster Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Fi Follet Cape +1",
} 
		
    -- Cure sets 

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
	sets.midcast['Cure II'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
	sets.midcast['Cure III'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
	sets.midcast['Cure IV'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
	sets.midcast['Cure V'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
	sets.midcast['Cure VI'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
	sets.midcast.CureSolace = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}

	sets.midcast.LightWeatherCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}

	sets.midcast.LightWeatherCureSolace = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
		
	sets.midcast.LightDayCureSolace = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}

	sets.midcast.LightDayCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Ebers Pant. +2",
    feet="Ebers Duckbills +2",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}

	sets.midcast.Curaga = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
		
	sets.midcast.LightWeatherCuraga = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
		
	sets.midcast.LightDayCuraga = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}

	sets.midcast.Cursna = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+5','"Mag.Atk.Bns."+11','DMG:+13',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +8','"Conserve MP"+5','"Fast Cast"+5',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear="Alabaster Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}},
}

	sets.midcast.StatusRemoval = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +1",
    body="Bunzi's Robe",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
		
	sets.midcast.Erase = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +1",
    body="Bunzi's Robe",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
    -- Enhancing Magic capped @ 500 with near-max duration 
	sets.midcast['Enhancing Magic'] = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+5','"Mag.Atk.Bns."+11','DMG:+13',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +2",})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
	main="Vadose Rod",
	sub="Ammurapi Shield",
    head="Chironic Hat",
	waist="Emphatikos Rope",	
	})

	sets.midcast.Regen = {
    main="Bolelabunga",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Piety Bliaut +4", augments={'Enhances "Benediction" effect',}},
    hands="Ebers Mitts +1",
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	
	sets.midcast.BarElement = {
    main="Beneficus",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +1",
    body="Ebers Bliaut +2",
    hands="Ebers Mitts +1",
    legs={ name="Piety Panta. +4", augments={'Enhances "Afflatus Misery" effect',}},
    feet="Ebers Duckbills +2",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

	sets.midcast.BarStatus = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+5','"Mag.Atk.Bns."+11','DMG:+13',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck="Sroda Necklace",
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

	sets.midcast.Impact = {}
		
	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast['Divine Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back="Null Shawl",
}
		
	sets.midcast.Holy = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back="Null Shawl",
}

	sets.midcast['Dark Magic'] = {}

    sets.midcast.Drain = {}

    sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {}

		
	sets.midcast.Dispel = {}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {}) --main="Daybreak",sub="Ammurapi Shield" 

	sets.midcast['Enfeebling Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ebers Bliaut +2",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet="Ebers Duckbills +2",
    neck="Null Loop",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Dia = sets.midcast['Enfeebling Magic']
	sets.midcast.Diaga = sets.midcast['Enfeebling Magic']
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = sets.midcast['Enfeebling Magic']
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'"Dbl.Atk."+2','Pet: "Mag.Atk.Bns."+30','"Refresh"+2','Accuracy+11 Attack+11',}},
    legs="Nyame Flanchard",
    feet={ name="Chironic Slippers", augments={'Weapon Skill Acc.+13','"Dbl.Atk."+2','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'"Dbl.Atk."+2','Pet: "Mag.Atk.Bns."+30','"Refresh"+2','Accuracy+11 Attack+11',}},
    legs="Nyame Flanchard",
    feet={ name="Chironic Slippers", augments={'Weapon Skill Acc.+13','"Dbl.Atk."+2','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	
	sets.idle.Weak = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'"Dbl.Atk."+2','Pet: "Mag.Atk.Bns."+30','"Refresh"+2','Accuracy+11 Attack+11',}},
    legs="Nyame Flanchard",
    feet={ name="Chironic Slippers", augments={'Weapon Skill Acc.+13','"Dbl.Atk."+2','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
    -- Defense sets

	sets.defense.PDT = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    sets.defense.MEVA = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}	
    sets.precast.WS = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Null Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back="Null Shawl",
}
	
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}

    sets.engaged.Acc = {
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.engaged.DW = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +1",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +1",
    feet="Aya. Gambieras +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring",
    right_ring="Ayanmo Ring",
    back="Solemnity Cape",
}

    sets.engaged.DW.Acc = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +1",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +1",
    feet="Aya. Gambieras +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring",
    right_ring="Ayanmo Ring",
    back="Solemnity Cape",
}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Orison Mitts +1"} --back="Mending Cape"

    sets.buff['Devotion'] = {} --head="Piety Cap +3"

	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace"})

end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end