function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Match')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal')
    state.IdleMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Naeg','Maxen','None')
	state.Weapons:reset()

	send_command('wait 3; input /lockstyleset 9')
	send_command('wait 5; gs c update')
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.weapons.Naeg = {main="Naegling",sub={ name="Machaera +2", augments={'TP Bonus +1000',}}}
	sets.weapons.Su5 = {main={ name="Crocea Mors", augments={'Path: C',}},sub={ name="Bunzi's Rod", augments={'Path: A',}},}
	sets.weapons.Maxen = {main="Maxentius",sub={ name="Machaera +2", augments={'Path: A',}}}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
    ammo="Staunch Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
	
	sets.precast.FC.Impact = {
    ammo="Staunch Tathlum +1",
    body="Twilight Cloak",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak"})
       
	-- Weaponskill sets
	sets.precast.WS = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Karieyh Ring +1",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast.FastRecast = {
    ammo="Staunch Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+3','"Fast Cast"+6',}},
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}	
    sets.midcast.Cure = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}	
    sets.midcast.LightWeatherCure = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Leth. Chappel +1",
    body="Lethargy Sayon +1",
    hands="Atrophy Gloves +3",
    legs="Leth. Fuseau +1",
    feet="Leth. Houseaux +1",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Lethargy Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Enha.mag. skill +7','Mag. Acc.+6','Enh. Mag. eff. dur. +20',}},
}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Leth. Chappel +1",
    body="Lethargy Sayon +1",
    hands="Leth. Gantherots +1",
    legs="Leth. Fuseau +1",
    feet="Leth. Houseaux +1",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Lethargy Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Enha.mag. skill +7','Mag. Acc.+6','Enh. Mag. eff. dur. +20',}},
}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +3",
    feet="Leth. Houseaux +1",
    neck="Hoxne Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +4','Enha.mag. skill +7','Mag. Acc.+6','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {})
	sets.midcast.Enspell = sets.midcast.Temper
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {})
	sets.midcast.BoostStat = {hands="Viti. Gloves +4"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast['Enfeebling Magic'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +3",
    hands="Regal Cuffs",
    legs={ name="Chironic Hose", augments={'Accuracy+6','Mag. Acc.+21','Accuracy+4 Attack+4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}

	sets.midcast.DurationOnlyEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast.Silence = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{})
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{})	
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic']	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {ear1="Vor Earring",hands="Leth. Gantherots +1",ring1="Stikini Ring +1",legs="Psycloth Lappas"})
	sets.midcast['Frazzle III'] = sets.midcast.SkillBasedEnfeebling

	
	sets.midcast['Distract III'] = sets.midcast.SkillBasedEnfeebling
	sets.midcast['Divine Magic'] = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Dia = sets.midcast.DurationOnlyEnfeebling
	sets.midcast.Diaga = sets.midcast.DurationOnlyEnfeebling
		
	sets.midcast.Bio = sets.midcast.DurationOnlyEnfeebling

    sets.midcast['Elemental Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    body="Twilight Cloak",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
	sets.midcast.Impact = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    body="Twilight Cloak",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast['Dark Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

    sets.midcast.Drain = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atrophy Chapeau +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
	-- Idle sets
	sets.idle = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.idle.Weak = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}	
	-- Defense sets
	sets.defense.PDT = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	sets.defense.MDT = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}		
    sets.defense.MEVA = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}		
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Single Wield Group.
	sets.engaged = {
	main="Naegling",
	sub="Ammurapi Shield",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",		
    waist="Sailfi belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
}
    -- Dual Wield Group.
	sets.engaged.DW = {
	main="Naegling",
    sub={ name="Machaera +2", augments={'TP Bonus +1000',}},
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(2, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 4)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 4)
	else
		set_macro_page(2, 4)
	end
end
function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end
autows_list = {['Naeg']='Savage Blade',['SU5']='Savage Blade',['Maxen']='Black Halo',['Murg']='Death Blossom',}