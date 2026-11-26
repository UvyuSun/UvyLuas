function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','Refresh','TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Nehushtan','DualWeapons')


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
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +4"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +4"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +2",hands="Bagua Mitaines +4"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {
    main={ name="Gada", augments={'Indi. eff. dur. +11','VIT+2','"Mag.Atk.Bns."+4',}},
    legs={ name="Bagua Pants +4", augments={'Enhances "Mending Halation" effect',}},
    feet="Azimuth Gaiters +2",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -4%',}},
}
	
	-- Fast cast sets for spells

	sets.precast.FC = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +4",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}

	sets.precast.FC.Geomancy = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +4",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}
	
    sets.precast.FC['Elemental Magic'] = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs="Geomancy Pants +4",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}

    sets.precast.FC['Enfeebling Magic'] = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +4",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}
	
    sets.precast.FC['Enhancing Magic'] = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +4",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}

	sets.precast.FC.Cure = {
    main="C. Palug Hammer",
    sub="Chanter's Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Agwu's Gages",
    legs="Geomancy Pants +4",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = {head=empty,body="Twilight Cloak",}

    sets.precast.FC.Dispelga = {
    main="Daybreak",
    sub="Chanter's Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Geomancy Pants +4",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
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
    right_ring="Epaminondas's Ring",
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
    head="Azimuth Hood +3",
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Bagua Pants +4", augments={'Enhances "Mending Halation" effect',}},
    feet="Azimuth Gaiters +2",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +1','Indi. eff. dur. +20','Pet: Damage taken -4%',}},
}
    sets.midcast.Cure = {
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Telchine Gloves",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Siegel Sash",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
}

    sets.midcast.LightWeatherCure = {
    main="Chatoyant Staff",
    sub="Enki Strap",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    back="Twilight Cape",
}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
    main="Chatoyant Staff",
    sub="Enki Strap",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    back="Twilight Cape",
}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = { 	
	ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Inyan. Dastanas +2",                                                                                                
    body="Vanya Robe",
	neck="Debilis Medallion",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Bishop's Sash",
    left_ear="Magnetic Earring",
    right_ear="Meili Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
}
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Azimuth Coat +3",
    hands="Agwu's Gages",
    legs="Azimuth Tights +3",
    feet="Indom. Sabots",
    neck="Sibyl Scarf",
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

    sets.midcast['Elemental Magic'].Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat +1",
    body="Azimuth Coat +2",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast['Elemental Magic'].HighTierNuke = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ea Hat +1",
    body="Azimuth Coat +3",
    hands="Agwu's Gages",
    legs="Azimuth Tights +3",
    feet="Indom. Sabots",
    neck="Sibyl Scarf",
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Ea Hat +1",
    body="Azimuth Coat +2",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
    sets.midcast['Dark Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast['Absorb-TP'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast.Drain = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Bagua Galero +4", augments={'Enhances "Primeval Zeal" effect',}},
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Agwu's Pigaches",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
		
	sets.midcast.Stun.Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

		
	sets.midcast.Impact = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=empty,
    body="Twilight Cloak",
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
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
    head="Azimuth Hood +3",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}		
	sets.midcast['Enfeebling Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
		
	sets.midcast['Enfeebling Magic'].Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Bagua Tunic +4", augments={'Enhances "Bolster" effect',}},
    hands="Geo. Mitaines +4",
    legs="Geomancy Pants +4",
    feet="Geo. Sandals +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+5','"Mag.Atk.Bns."+11','DMG:+13',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}


	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','VIT+2','"Mag.Atk.Bns."+1',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Amalric Coif +1",
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    right_ring="Murky Ring",
    right_ring="Murky Ring",
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
    hands="Geo. Mitaines +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	-- Idle sets

	sets.idle = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Shamash Robe",
    hands={ name="Bagua Mitaines +4", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
	sets.idle.Refresh = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands="Volte Gloves",
    legs="Volte Brais",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null belt",
    left_ear="Eabani Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Shamash Robe",
    hands="Geo. Mitaines +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +4", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.Refresh.Pet = {
    main="Idris",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands="Geo. Mitaines +3",
    legs="Volte Brais",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null belt",
    left_ear="Eabani Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	-- .Indi sets are for when an Indi-spell is active.


	sets.idle.Weak = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}	
	sets.idle.Refresh.Weak = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands="Volte Gloves",
    legs="Volte Brais",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null belt",
    left_ear="Eabani Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	sets.idle.Weak.Pet = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Shamash Robe",
    hands="Geo. Mitaines +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Bagua Sandals +4", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.Refresh.Weak.Pet = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands="Geo. Mitaines +3",
    legs="Volte Brais",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null belt",
    left_ear="Eabani Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	-- Defense sets
	
	sets.defense.PDT = {}

	sets.defense.MDT = {}
		
    sets.defense.MEVA = {}
		
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +4",}
	sets.latent_refresh = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	sets.HPDown = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
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
    left_ear="Cessance Earring",
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
	sets.weapons.Nehushtan = {main='Nehushtan',sub='Genmei Shield'}
	sets.weapons.DualWeapons = {main='Nehushtan',sub='Nehushtan'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 19)
end