function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','Refresh','TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None')


	autoindi = "Fury"
	autogeo = "Frailty"
	autoentrust = 'Barrier'
	autoentrustee = 'Uvyu'
	
	-- Additional local binds

	
	indi_duration = 290
	
	select_default_macro_book()
end

	send_command('wait 3; input /lockstyleset 5')

function init_gear_sets()

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +4"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +4"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +4"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +2",hands="Bagua Mitaines +4"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {
    main={ name="Gada", augments={'Indi. eff. dur. +10','MND+4','Mag. Acc.+6','DMG:+12',}},
    legs={ name="Bagua Pants +4", augments={'Enhances "Mending Halation" effect',}},
    feet="Azimuth Gaiters +2",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}
	
	-- Fast cast sets for spells

	sets.precast.FC = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+6','DEX+10','"Mag.Atk.Bns."+9',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +3",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}

	sets.precast.FC.Geomancy = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+6','DEX+10','"Mag.Atk.Bns."+9',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +3",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}
	
    sets.precast.FC['Elemental Magic'] = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+6','DEX+10','"Mag.Atk.Bns."+9',}},
    hands="Bagua Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}

    sets.precast.FC['Enfeebling Magic'] = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+6','DEX+10','"Mag.Atk.Bns."+9',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +3",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}
	
    sets.precast.FC['Enhancing Magic'] = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+6','DEX+10','"Mag.Atk.Bns."+9',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +3",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}

	sets.precast.FC.Cure = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+6','DEX+10','"Mag.Atk.Bns."+9',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +3",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = {head=empty,body="Twilight Cloak",}

    sets.precast.FC.Dispelga = {
    main="Daybreak",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Fast Cast"+6','DEX+10','"Mag.Atk.Bns."+9',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +3",
    feet="Agwu's Pigaches",
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Ephramad's Ring",
    right_ring="Karieyh Ring +1",
    back="Null Shawl",
}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {}

	sets.midcast.Geomancy = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}
	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Bagua Pants +4", augments={'Enhances "Mending Halation" effect',}},
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -3%',}},
}
    sets.midcast.Cure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Geomancy Pants +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
    sets.midcast.LightWeatherCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Geomancy Pants +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Geomancy Pants +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = { 	
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Geomancy Pants +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Agwu's Pigaches",
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Agwu's Pigaches",
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
	
    sets.midcast['Dark Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
}
    sets.midcast['Absorb-TP'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
}
    sets.midcast.Drain = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
} 
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
}		
	sets.midcast.Impact = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=empty,
    body="Twilight Cloak",
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast.Dispelga = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
}
	sets.midcast['Enfeebling Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +3",
    feet="Geo. Sandals +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
}
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {  --Placeholder, need to grab Telchine from Drobe7.
    main={ name="Gada", augments={'Indi. eff. dur. +10','MND+4','Mag. Acc.+6','DMG:+12',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.Refresh = {
    main={ name="Gada", augments={'Indi. eff. dur. +10','MND+4','Mag. Acc.+6','DMG:+12',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.idle = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.idle.Refresh = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body="Shamash Robe",
    hands="Geo. Mitaines +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +4", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.Refresh.Pet = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body="Shamash Robe",
    hands="Geo. Mitaines +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +4", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	-- .Indi sets are for when an Indi-spell is active.


	sets.idle.Weak = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.idle.Refresh.Weak = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Shamash Robe",
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.idle.Weak.Pet = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body="Shamash Robe",
    hands="Geo. Mitaines +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +4", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	sets.idle.Refresh.Weak.Pet = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +2",
    body="Shamash Robe",
    hands="Geo. Mitaines +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +4", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	-- Defense sets
	
	sets.defense.PDT = {}

	sets.defense.MDT = {}
		
    sets.defense.MEVA = {}
		
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +3",}
	sets.latent_refresh = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	sets.HPDown = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Shamash Robe",
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
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
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
		
	sets.engaged.DW = {
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

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	sets.RecoverBurst = {}

	-- Weapons sets
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 19)
end