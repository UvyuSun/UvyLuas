function user_setup()

	state.OffenseMode:options('Normal','Inquartata','MDB')
	state.HybridMode:options()
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options()
	state.MagicalDefenseMode:options()
	state.ResistDefenseMode:options()
	state.IdleMode:options('Normal','MEVA')
	state.Weapons:options('None','Epeolatry')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}
	
	-- Additional local binds
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('wait 3; input /lockstyleset 4')

	select_default_macro_book()
end

	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Loxotic Mace +1"}

	sets.TreasureHunter = {
    body="Volte Jupon",
    feet="Volte Boots",
    waist="Chaac Belt",
}

function init_gear_sets()
 
    sets.Enmity = {  	
    main={ name="Epeolatry", augments={'Path: A',}},                                                                        --23
    sub="Alber Strap",                                                                                                      --5
    ammo="Sapience Orb",                                                                                                    --2
    head="Halitus Helm",                                                                                                    --8
    body="Emet Harness +1",                                                                                                 --10
    hands="Kurys Gloves",                                                                                                   --9
    legs="Eri. Leg Guards +3",                                                                                              --13
    feet="Erilaz Greaves +3",                                                                                               --8
    neck="Moonlight Necklace",	                                                                                            --15
    waist="Goading Belt",                                                                                                   --3
    left_ear="Cryptic Earring",                                                                                             --4
    right_ear="Trux Earring",                                                                                               --5
    left_ring="Supershear Ring",                                                                                            --5
    right_ring="Eihwaz Ring",                                                                                               --5
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},                 --10
}                                                                                                                           --Total = 125~Crusade+30=155
    sets.Enmity.SIRD = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Audumbla Sash",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +3",legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Bottes +3"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist Mitons +3"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +3"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{back="Evasionist's Cape",})
    sets.precast.JA['One For All'] = {
	ammo="Sapience Orb",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist Coat +3",legs="Futhark Trousers +3"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Bottes +3"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist Mitons +3"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +3"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{back="Evasionist's Cape",})
    sets.precast.JA['One For All'].DT = {
    ammo="Sapience Orb",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}

	sets.precast.JA['Swipe'] = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}

	sets.element.Earth = {neck="Quanpur Necklace",}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
	head="Erilaz Galea +3",
	neck="Hoxne Torque",
	ring1="Stikini Ring +1",
	ring2="Stikini Ring +1",
}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
	}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {    
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Erilaz Surcoat +3",
    hands={ name="Leyline Gloves", augments={ 'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Loquac. Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
    sets.precast.FC.SIRD = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}		
    sets.precast.FC['Enhancing Magic'] = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Erilaz Surcoat +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Siegel Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
    sets.precast.FC['Enhancing Magic'].SIRD = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}	
    sets.precast.FC['Enfeebling Magic'] = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Siegel Sash",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
    sets.precast.FC['Enfeebling Magic'].SIRD = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}	
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Hoxne Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring +1",
    right_ring="Epaminondas's Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}	
    sets.precast.WS['Resolution'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epona's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Dimidiation'] = {    
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Hoxne Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
			
	sets.midcast.FastRecast.DT = {}

    sets.midcast['Enfeebling Magic'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Hoxne Torque",
    waist="Luminary Sash",
    left_ear="Vor Earring",
    right_ear="Digni. Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.midcast['Enfeebling Magic'].SIRD = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}	
    sets.midcast['Enhancing Magic'] = {
	ammo="Staunch Tathlum +2",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
	hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Hoxne Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Merciful Cape",
}
    sets.midcast['Enhancing Magic'].SIRD = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}	
    sets.midcast['Phalanx'] = {
    main="Deacon Sword",
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
    body={ name="Herculean Vest", augments={'Pet: AGI+3','Crit.hit rate+1','Phalanx +4',}},
    hands={ name="Herculean Gloves", augments={'MND+6','Mag. Acc.+1','Phalanx +4','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Herculean Trousers", augments={'"Occult Acumen"+1','Pet: INT+2','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21','AGI+1','Phalanx +4','Accuracy+15 Attack+15',}},
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Mimir Earring",
    right_ear="Alabaster Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
--    main="Deacon Sword",
--    ammo="Staunch Tathlum +1",
--    head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
--    body={ name="Herculean Vest", augments={'AGI+2','Spell interruption rate down -9%','Phalanx +3','Accuracy+12 Attack+12','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
--    hands={ name="Herculean Gloves", augments={'Pet: Phys. dmg. taken -1%','DEX+10','Phalanx +3','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
--    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
--    feet={ name="Herculean Boots", augments={'Accuracy+21','AGI+1','Phalanx +4','Accuracy+15 Attack+15',}},
--    neck="Hoxne Torque",
--    waist="Olympus Sash",
--    left_ear="Andoaa Earring",
--    right_ear="Mimir Earring",
--    left_ring="Stikini Ring +1",
--    right_ring="Stikini Ring +1",
--    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},

    sets.midcast['Phalanx'].SIRD = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}	
    sets.midcast['Crusade'] = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}	
    sets.midcast['Temper'] = {
    ammo="Staunch Tathlum +1",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Adamantite Armor",
    hands="Runeist Mitons +3",
    legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}},
    feet="Erilaz Greaves +3",
    neck="Hoxne Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
    sets.midcast['Regen'] = {
    main={ name="Morgelai", augments={'Path: C',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet="Erilaz Greaves +3",
    neck="Sacro Gorget",
    waist="Sroda Belt",
    left_ear="Sanare Earring",
    right_ear={ name="Erilaz Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
	sets.midcast['Refresh'] = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}	
    sets.midcast.Stoneskin = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet="Erilaz Greaves +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Meili Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.midcast['Shell V'] = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}
	sets.midcast.BarElement = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}
		
	sets.midcast.BarStatus = {
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.SIRD = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast['Aquaveil'] = {
    main={ name="Nibiru Faussar", augments={'Evasion+20','Mag. Evasion+20','"Fast Cast"+5',}},
    ammo="Staunch Tathlum +1",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Spell interruption rate down-10%',}},
}
	sets.midcast['Wild Carrot'] = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Healing Breeze'] = set_combine(sets.Enmity.SIRD, {})
		
	sets.Self_Healing = {}

	sets.Cure_Received = {}

	sets.Self_Refresh = {}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring",})

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring",})

	sets.Regen_Received ={
    main={ name="Morgelai", augments={'Path: C',}},
	head="Erilaz Galea +3",
	hands="Regal Gauntlets",
	legs={ name="Futhark Trousers +3", augments={'Enhances "Inspire" effect',}},
	neck="Sacro Gorget",
    waist="Sroda Belt",
}

	sets.Phalanx_Received ={
    main="Deacon Sword",
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
    body={ name="Herculean Vest", augments={'Pet: AGI+3','Crit.hit rate+1','Phalanx +4',}},
    hands={ name="Herculean Gloves", augments={'MND+6','Mag. Acc.+1','Phalanx +4','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Herculean Trousers", augments={'"Occult Acumen"+1','Pet: INT+2','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21','AGI+1','Phalanx +4','Accuracy+15 Attack+15',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.Protect_Received ={right_ring="Sheltered Ring",}	
	sets.Shell_Received ={right_ring="Sheltered Ring",}
	

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = {
    main={ name="Epeolatry", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Brigantia Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Jotnar Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Ogma's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.idle.Town = {
    main={ name="Morgelai", augments={'Path: C',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Maat's Cap",
    body="Ashera Harness",
    hands="Regal Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Moonlight Necklace",
    waist="Sroda Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
	sets.idle.MEVA = {
    ammo="Vanir Battery",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Erilaz Gauntlets +3",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Eabani Earring",
    right_ear="Sanare Earring",
    left_ring="Moonlight Ring",
    right_ring="Shadow Ring",
    back="Null Shawl",
}
	sets.idle.Weak = {
    main={ name="Epeolatry", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Murky Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {}
	sets.DayIdle = {Earring}
	sets.NightIdle = {}
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"}
	-- Defense Sets
	sets.defense.PDT = {}
	sets.defense.MDT = {}
	sets.defense.MEVA = {}
	sets.defense.Death = {}

	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
    main={ name="Epeolatry", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Erilaz Gauntlets +3",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Null Loop",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.Inquartata = {
    main={ name="Epeolatry", augments={'Path: A',}},
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands="Turms Mittens +1",
    legs="Eri. Leg Guards +3",
    feet="Turms Leggings +1",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Parrying rate+5%',}},
}
    sets.engaged.MDB = {
    main={ name="Epeolatry", augments={'Path: A',}},
    sub="Irenic Strap +1",
    ammo="Vanir Battery",
    head="Erilaz Galea +3",
    body="Adamantite Armor",
    hands="Erilaz Gauntlets +3",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Eabani Earring",
    right_ear="Sanare Earring",
    left_ring="Moonlight Ring",
    right_ring="Shadow Ring",
    back="Null Shawl",
}
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = {left_ring="Purity Ring", right_ring="Blenmot's Ring +1", neck="Nicander's Necklace"}
	sets.buff.Sleep = {}
--	sets.buff.Battuta = {hands="Turms Mittens +1",feet="Turms Leggings +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'RDM' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'SCH' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'BLU' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'WAR' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'SAM' then
		set_macro_page(3, 20)
	elseif player.sub_job == 'DRK' then
		set_macro_page(3,20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 20)
	else
		set_macro_page(3, 20)
	end
end
--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end