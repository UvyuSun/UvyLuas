function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal','Iddy','Tishy')
	state.CastingMode:options('Burst','Normal','Occult')
	state.WeaponskillMode:options('Normal','PDL')
    state.IdleMode:options('Normal','DualWield','AminonT','AminonM')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Idris','Maxen','Tish','DualMaxen','DualIdris','DualTishy')


	autoindi = "Precision"
	autogeo = "haste"
	autoentrust = 'Refresh'
	autoentrustee = 'Uvvu'

	indi_duration = 290
	
	select_default_macro_book()
	send_command('wait 3; input /lockstyleset 16')
end



function init_gear_sets()

	--------------------------------------
	-- Precast sets
	--------------------------------------

	sets.TreasureHunter = {
    body="Volte Jupon",
    feet="Volte Boots",
    waist="Chaac Belt",
}

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +3"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +3",back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Concentric Pulse'] = {head="Bagua Galero +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3",hands="Bagua Mitaines +3"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {
    main={ name="Gada", augments={'Indi. eff. dur. +11','MND+5','"Mag.Atk.Bns."+17',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
    feet="Azimuth Gaiters +3",
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Magnetic Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +20','Pet: Damage taken -2%',}},
}	
	sets.precast.FC = { 
    head={ name="Merlinic Hood", augments={'Mag. Acc.+2','"Fast Cast"+7',}},                                                                --15
    body="Adamantite Armor",                                                                                                                --0
    hands={ name="Agwu's Gages", augments={'Path: A',}},                                                                                    --6
    legs="Geomancy Pants +3",                                                                                                               --15
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},                                 --12
    neck="Orunmila's Torque",                                                                                                               --5
    waist="Embla Sash",                                                                                                                     --5
    left_ear="Malignance Earring",                                                                                                          --4
    right_ear="Loquac. Earring",                                                                                                            --2
    left_ring="Rahab Ring",                                                                                                                 --2
    right_ring="Kishar Ring",                                                                                                               --2
    back={ name="Nantosuelta's Cape", augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},   --10
}                                                                                                                                           --Total FC 80%
	
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC.Impact = {
	range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	head=empty,
    body="Twilight Cloak",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +20','Pet: Damage taken -2%',}},
}	
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS.PDL = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Exudation'] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Exudation'].PDL = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Judgment'] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Judgment'].PDL = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Black Halo'] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Black Halo'].PDL = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+2','"Fast Cast"+7',}},
    body="Adamantite Armor",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +3",
    neck="Null Loop",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast.Geomancy = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Bagua Charm +2",
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}},
    feet="Azimuth Gaiters +3",
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Magnetic Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +20','Pet: Damage taken -2%',}},
}
    sets.midcast.Cure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
    sets.midcast.LightWeatherCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna = {
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
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Maxentius",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}	
    sets.midcast['Elemental Magic'].Burst = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Maxentius",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
    sets.midcast['Elemental Magic'].Occult = {
    ammo="Seraphic Ampulla",
    head={ name="Merlinic Hood", augments={'"Occult Acumen"+11','MND+6',}},
    body={ name="Merlinic Jubbah", augments={'"Occult Acumen"+11','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+17','"Occult Acumen"+11',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'Attack+14','"Occult Acumen"+11','CHR+9','Mag. Acc.+2',}},
    neck="Incanter's Torque",
    waist="Oneiros Rope",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Maxentius",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke.Burst = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Maxentius",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke.Occult = {
    ammo="Seraphic Ampulla",
    head={ name="Merlinic Hood", augments={'"Occult Acumen"+11','MND+6',}},
    body={ name="Merlinic Jubbah", augments={'"Occult Acumen"+11','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+17','"Occult Acumen"+11',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'Attack+14','"Occult Acumen"+11','CHR+9','Mag. Acc.+2',}},
    neck="Incanter's Torque",
    waist="Oneiros Rope",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}		
    sets.midcast['Dark Magic'] = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Geo. Mitaines +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast['Absorb-TP'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Geomancy Pants +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
    sets.midcast.Drain = {
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}},
    body="Azimuth Coat +3",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Azimuth Tights +3",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Null Loop",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Evanescence Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Maxentius",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Geo. Mitaines +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Stun.Burst = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Maxentius",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Geo. Mitaines +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Impact = {
    ammo="Pemphredo Tathlum",
	head=empty,
    body="Twilight Cloak",
    hands="Geo. Mitaines +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Impact.Occult = {
    ammo="Seraphic Ampulla",
	head=empty,
    body="Twilight Cloak",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+17','"Occult Acumen"+11',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'Attack+14','"Occult Acumen"+11','CHR+9','Mag. Acc.+2',}},
    neck="Incanter's Torque",
    waist="Oneiros Rope",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.midcast['Enfeebling Magic'] = {
    main={ name="Idris", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Pemphredo Tathlum",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Regal Cuffs",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Null Loop",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Burst = set_combine(sets.midcast['Enfeebling Magic'].Burst, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Burst = set_combine(sets.midcast['Enfeebling Magic'].Burst, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Burst = set_combine(sets.midcast['Enfeebling Magic'].Burst, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {
    main={ name="Gada", augments={'Indi. eff. dur. +11','MND+5','"Mag.Atk.Bns."+17',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = {
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Gishdubar Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
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
    main="Chatoyant Staff",
    sub="Oneiros Grip",
    ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
	-- Idle sets
    sets.idle.Town = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Os. Escutcheon",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body="Adamantite Armor",
    hands="Regal Cuffs",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Ebur Clogs", augments={'Path: C',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Skrymir Cord +1",
    left_ear="Magnetic Earring",
    right_ear="Balder Earring",
    left_ring="Chirich Ring +1",
    right_ring="Orvail Ring +1",
    back="Moonlight Cape",
}
--    main={ name="Idris", augments={'Path: A',}},
--    sub="Ammurapi Shield",
--    ammo="Staunch Tathlum +1",
--    head={ name="Nyame Helm", augments={'Path: B',}},
--    body="Adamantite Armor",
--    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
--    legs={ name="Nyame Flanchard", augments={'Path: B',}},
--    feet={ name="Nyame Sollerets", augments={'Path: B',}},
--    neck={ name="Warder's Charm +1", augments={'Path: A',}},
--    waist="Carrier's Sash",
--    left_ear={ name="Arete del Luna +1", augments={'Path: A',}	},
--    right_ear="Hearty Earring",
--    left_ring="Archon Ring",
--    right_ring="Shadow Ring",
--    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	sets.idle = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
	ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
	sets.idle.DualWield = {
    main="Maxentius",
    sub={ name="Makhila +3", augments={'TP Bonus +1000',}},
    ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
    sets.idle.AminonT = {
    main={ name="Tishtrya", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.idle.AminonM = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}	

--	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	sets.idle.DualWield.Pet = {
    main="Maxentius",
    sub={ name="Makhila +3", augments={'TP Bonus +1000',}},
    ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+14','Damage taken-5%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	sets.idle.AminonT.Pet = {
    main={ name="Tishtrya", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
    sets.idle.AminonM.Pet = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	-- .Indi sets are for when an Indi-spell is active.


	sets.idle.Weak = {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}	
	sets.idle.DualWield.Weak = {
    main="Maxentius",
    sub={ name="Makhila +3", augments={'TP Bonus +1000',}},
    ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring="Eihwaz Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
}
	sets.idle.AminonT.Weak = {
    main={ name="Tishtrya", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.idle.AminonM.Weak = {
    main="Maxentius",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.idle.Weak.Pet = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Nantosuelta's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.AminonT.Weak.Pet = {
    main={ name="Tishtrya", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Null Masque",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.idle.AminonM.Weak.Pet = {
    main="Maxentius",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands="Geo. Mitaines +3",
    legs="Jhakri Slops +2",
    feet="Mallquis Clogs +2",
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
    sets.idle.Town = {
    main={ name="Tishtrya", augments={'Path: A',}},
    sub="Os. Escutcheon",
    ammo="Staunch Tathlum +1",
    head="EA Hat +1",
    body="Adamantite Armor",
    hands="Regal Cuffs",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Skrymir Cord +1",
    left_ear="Magnetic Earring",
    right_ear="Balder Earring",
    left_ring="Chirich Ring +1",
    right_ring="Orvail Ring +1",
    back="Moonlight Cape",
}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geomancy Sandals +4"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	
	sets.HPDown = {
    ammo="Staunch Tathlum +1",
    head="Azimuth Hood +3",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring="Eihwaz Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Melee groups
	sets.engaged = {
	main="Maxentius",
	sub="Ammurapi Shield",
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.engaged.Iddy = {
	main={ name="Idris", augments={'Path: A',}},
	sub="Ammurapi Shield",
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.engaged.Tishy = {
	main={ name="Tishtrya", augments={'Path: A',}},
	sub="Ammurapi Shield",
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
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
    sub="Makhila +3",
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.engaged.DW.Iddy = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Makhila +3",
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.engaged.DW.Tishy = {
    main={ name="Tishtrya", augments={'Path: A',}},
    sub="Makhila +3",
    ammo="Vanir Battery",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Jhakri Slops +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	-- Weapons sets
	sets.weapons.Idris = {main={ name="Idris", augments={'Path: A',}},sub="Ammurapi Shield",}
	sets.weapons.Maxen = {main="Maxentius",sub="Ammurapi Shield",}
	sets.weapons.Tish = {main={ name="Tishtrya", augments={'Path: A',}},sub="Ammurapi Shield",}
	sets.weapons.DualMaxen = {main="Maxentius",sub="Makhila +3",}
	sets.weapons.DualIddy = {main={ name="Idris"},sub="Makhila +3",}
	sets.weapons.DualTishy = {main={ name="Tishtrya"},sub="Makhila +3",}
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	sets.RecoverBurst = {}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 19)
end