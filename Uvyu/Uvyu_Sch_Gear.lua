-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','DT','OccultAcumen')
    state.IdleMode:options('Normal','Refresh')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None')

		-- Additional local binds
	
    select_default_macro_book()
	send_command('wait 3; input /lockstyleset 19')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	sets.TreasureHunter = {
    body="Volte Jupon",
    feet="Volte Boots",
    waist="Chaac Belt",
}
    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3", augments={'Enhances "Tabula Rasa" effect',}}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}}

    -- Fast cast sets for spells
    sets.precast.FC = { --/Rdm55 = 20%FC.
    ammo="Sapience Orb",                                                                                                                                  --2
    head={ name="Merlinic Hood", augments={'Mag. Acc.+2','"Fast Cast"+7',}},                                                                              --15
    body={ name="Agwu's Robe", augments={'Path: A',}},                                                                                                    --8
    hands={ name="Agwu's Gages", augments={'Path: A',}},                                                                                                  --6
    legs={ name="Agwu's Slops", augments={'Path: A',}},                                                                                                   --7
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},                                               --12
    neck="Orunmila's Torque",                                                                                                                             --5
    waist="Embla Sash",                                                                                                                                   --5
    left_ear="Malignance Earring",                                                                                                                        --4
    right_ear="Eabani Earring",                                                                                                                           --0
    left_ring="Rahab Ring",                                                                                                                               --2
    right_ring="Kishar Ring",                                                                                                                             --4
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}, --10
}                                                                                                                                                         --Total=80 
	sets.precast.FC.Arts = {}
 	sets.precast.FC.Arts.DT = {}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = {
    ammo="Sapience Orb",                                                                                                                                  --2
    head=empty,                                                                                                                                           --0
	body="Twilight Cloak",                                                                                                                                --0
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                              --7
    legs={ name="Agwu's Slops", augments={'Path: A',}},                                                                                                   --7
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},                                               --12
    neck="Orunmila's Torque",                                                                                                                             --5
    waist="Embla Sash",                                                                                                                                   --5
    left_ear="Malignance Earring",                                                                                                                        --4
    right_ear='Loquacious Earring',                                                                                                                       --0
    left_ring="Rahab Ring",                                                                                                                               --2
    right_ring="Kishar Ring",                                                                                                                             --4
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}, --10
}                                                                                                                                                         --Total=80 
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Metamor. Ring +1",
    right_ring="Epaminondas's Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}
	sets.element.Dark = {}

    sets.midcast.FastRecast = {
    ammo="Sapience Orb",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Veneficium Ring",
    right_ring="Lebeche Ring",
    back="Perimede Cape",
}
		
    sets.midcast.Cure = {
    main="Chatoyant Staff",
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Hoxne Earring",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast.LightWeatherCure = {
    main="Chatoyant Staff",
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Twilight Cape",
}
    sets.midcast.LightDayCure = {
    main="Chatoyant Staff",
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Twilight Cape",
}
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Curaga.DT = sets.midcast.Cure.DT
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.Refresh_Received = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.midcast.Cursna =  {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Goading Belt",
    left_ear="Magnetic Earring",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast.Regen = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head="Arbatel Bonnet +3",
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +20','"Regen" potency+10',}},
}
    sets.midcast.Regen.DT = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast.Phalanx = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Chironic Hat", augments={'STR+5','MND+6','Phalanx +4','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+24','Attack+30','Phalanx +4','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
    hands={ name="Chironic Gloves", augments={'MND+2','Crit. hit damage +1%','Phalanx +4','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    legs={ name="Chironic Hose", augments={'MND+4','Mag. Acc.+6','Phalanx +4','Accuracy+19 Attack+19',}},
    feet={ name="Chironic Slippers", augments={'STR+9','Accuracy+4','Phalanx +4',}},
    neck="Hoxne Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast.Phalanx.DT = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = {
    main="Vadose Rod",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
    hands="Regal Cuffs",
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Emphatikos Rope",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast.BarElement =  {
    main={ name="Musa", augments={'Path: C',}},
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell
	sets.midcast.Embrava = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Telopanos Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast['Enfeebling Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +10','MND+5','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}	
    sets.midcast.ElementalEnfeeble = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands="Arbatel Bracers +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'])
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'])
    sets.midcast['Dark Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands="Arbatel Bracers +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast.Kaustra = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Hoxne Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Archon Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast.Drain = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands="Arbatel Bracers +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands="Arbatel Bracers +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    -- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic']	= {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Hoxne Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Hoxne Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.midcast['Elemental Magic'].OccultAcumen = {
    ammo="Seraphic Ampulla",
    head={ name="Merlinic Hood", augments={'"Occult Acumen"+11','MND+6',}},
    body={ name="Merlinic Jubbah", augments={'"Occult Acumen"+11','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+17','"Occult Acumen"+11',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'Attack+14','"Occult Acumen"+11','CHR+9','Mag. Acc.+2',}},
    neck="Rep. Plat. Medal",
    waist="Oneiros Rope",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.midcast.Anemohelix = {
    main="Mafic Cudgel",
    sub="Os. Escutcheon",
    ammo="Sapience Orb",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Regal Cuffs",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet="Volte Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Goading Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
	sets.midcast.Cryohelix = set_combine(sets.midcast.Anemohelix, {})
	sets.midcast.Geohelix = set_combine(sets.midcast.Anemohelix, {})
	sets.midcast.Hydrohelix = set_combine(sets.midcast.Anemohelix, {})
	sets.midcast.Ionohelix = set_combine(sets.midcast.Anemohelix, {})
	sets.midcast.Luminohelix = set_combine(sets.midcast.Anemohelix, {})
	sets.midcast.Noctohelix = set_combine(sets.midcast.Anemohelix, {})
	sets.midcast.Pyrohelix = set_combine(sets.midcast.Anemohelix, {})

	sets.midcast.Helix = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Culminus",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord +1",
    left_ear="Crematio Earring",
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Mallquis Ring",
    right_ring="Mujin Band",
    back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +20','"Regen" potency+10',}},
}
	sets.midcast['Luminohelix II'] = {
	main ="Daybreak",
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord +1",
    left_ear="Malignance Earring",
    right_ear="Crematio Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Bookworm's Cape", augments={'INT+2','MND+2','Helix eff. dur. +20','"Regen" potency+10',}},
}
	sets.midcast.Impact = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body="Twilight Cloak",
    hands="Arbatel Bracers +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})

	sets.midcast['Dispel'] =  {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands="Arbatel Bracers +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Dispelga'] = set_combine(sets.midcast['Dispel'],{main="Daybreak"})

	sets.Phalanx_Received = {
    ammo="Staunch Tathlum +1",
    head={ name="Chironic Hat", augments={'STR+5','MND+6','Phalanx +4','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+24','Attack+30','Phalanx +4','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
    hands={ name="Chironic Gloves", augments={'MND+2','Crit. hit damage +1%','Phalanx +4','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    legs={ name="Chironic Hose", augments={'MND+4','Mag. Acc.+6','Phalanx +4','Accuracy+19 Attack+19',}},
    feet={ name="Chironic Slippers", augments={'STR+9','Accuracy+4','Phalanx +4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}	
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Adamantite Armor",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    sets.idle = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Volte Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
	sets.idle.Town = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Os. Escutcheon",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Seidr Cotehardie",
    hands="Regal Cuffs",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Crier's Gaiters",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord +1",
    left_ear={ name="Arbatel Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+17','Enmity-7','INT+9 MND+9',}},
    right_ear="Balder Earring",
    left_ring="Chirich Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
    sets.idle.Refresh = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Adamantite Armor",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}	
    sets.idle.Weak = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Volte Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.idle.Weak.Refresh = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Adamantite Armor",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

    -- Defense sets

    sets.defense.PDT = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Volte Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.defense.MDT = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Volte Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.defense.MEVA = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Volte Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.Kiting = {feet="Crier's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Normal melee group
    sets.engaged = {
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
    sets.engaged.DW = {
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Windbuffet Belt +1",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +2"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +2"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {}--legs="Acad. Pants +3"
	sets.buff['Dark Arts'] = {}--body="Academic's Gown +3"

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Enki Strap",}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(2, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 18)
	elseif player.sub_job == 'WHM' then
		set_macro_page(2, 18)
	else
		set_macro_page(2, 18)
	end
end