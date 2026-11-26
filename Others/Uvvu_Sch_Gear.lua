-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Burst')
    state.IdleMode:options('Normal','Refresh')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Khatvanga')
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"
	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3", augments={'Enhances "Tabula Rasa" effect',}}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}}

    -- Fast cast sets for spells

    sets.precast.FC = {
    main={ name="Musa", augments={'Path: C',}},                                                                                  --10
    sub="Clerisy Strap +1",                                                                                                      --3
    ammo="Sapience Orb",                                                                                                         --2
    head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},                                      --14
    body={ name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},                                        --8
    hands={ name="Agwu's Gages", augments={'Path: A',}},                                                                         --7
    legs={ name="Agwu's Slops", augments={'Path: A',}},                                                                          --7
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+3','"Fast Cast"+7','Mag. Acc.+7',}},                              --12
    neck="Orunmila's Torque",                                                                                                    --5
    waist="Embla Sash",                                                                                                          --5
    left_ear="Malignance Earring",                                                                                               --4
    right_ear="Loquac. Earring",                                                                                                 --2
    left_ring="Murky Ring",                                                                                                      --2
    right_ring="Kishar Ring",                                                                                                    --4
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},                                                                     --10
}                                                                                                                                --Total=92-W/out staff 80
--                                                                                                                               --W/out body/head 73
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = {head=empty,body="Twilight Cloak",}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Myrkr'] = {}

    -- Midcast Sets

	sets.TreasureHunter = {
    hands={ name="Chironic Gloves", augments={'"Store TP"+2','"Occult Acumen"+11','"Treasure Hunter"+1',}},
    feet={ name="Chironic Slippers", augments={'DEX+5','"Dbl.Atk."+1','"Treasure Hunter"+2','Accuracy+12 Attack+12',}},
    waist="Chaac Belt",
}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    main="Mpaca's Staff",
    sub="Enki Grip",
    ammo="Pemphredo Tathlum",
    head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {}
		
    sets.midcast.Cure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    sets.midcast.LightWeatherCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
		
    sets.midcast.LightDayCure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','VIT+2','"Mag.Atk.Bns."+1',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}},
    hands={ name="Peda. Bracers +3", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs="Acad. Pants +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Bishop's Sash",
    left_ear="Magnetic Earring",
    right_ear="Meili Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back="Twilight Cape",
})

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = {
    main="Musa",
    sub="Enki Strap",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    sets.midcast.Regen = {
    main="Musa",
    sub="Enki Strap",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
	main="Vadose Rod",
	sub="Genmei Shield",
	head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
	hands="Regal Cuffs",
	waist="Emphatikos Rope",
	legs="Shedir Seraweels",
	})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +3"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell
	
	sets.midcast.Embrava = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+5','"Mag.Atk.Bns."+11','DMG:+13',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}},
    neck="Hoxne Torque",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Mimir Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {
    main={ name="Marin Staff +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +3",
    body="Acad. Gown +3",
    hands={ name="Peda. Bracers +3", augments={'Enh. "Tranquility" and "Equanimity"',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+9','Accuracy+3 Attack+3','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    feet="Acad. Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}		
    sets.midcast.ElementalEnfeeble = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
    body="Acad. Gown +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Peda. Pants +3", augments={'Enhances "Tabula Rasa" effect',}},
    feet="Acad. Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','VIT+2','"Mag.Atk.Bns."+1',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +2",
    body="Acad. Gown +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Acad. Pants +3",
    feet="Acad. Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1=""})

    sets.midcast['Dark Magic'] = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','VIT+2','"Mag.Atk.Bns."+1',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +3",
    body="Acad. Gown +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Acad. Pants +3",
    feet="Acad. Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Metamorph Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast.Kaustra = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast.Drain = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Acad. Gown +3",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Peda. Pants +3", augments={'Enhances "Tabula Rasa" effect',}},
    feet={ name="Merlinic Crackows", augments={'"Drain" and "Aspir" potency +6','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Accuracy+20 Attack+20','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Evanescence Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
    main={ name="Marin Staff +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +3",
    body="Acad. Gown +3",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Peda. Pants +3", augments={'Enhances "Tabula Rasa" effect',}},
    feet="Acad. Loafers +3",
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
    main="Mpaca's Staff",
    sub="Oneiros Grip",
    ammo="Pemphredo Tathlum",
    head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Agwu's Pigaches",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Locus Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast['Elemental Magic'].Burst = {
    main={ name="Marin Staff +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Peda. Loafers +3", augments={'Enhances "Stormsurge" effect',}},
    neck="Baetyl Pendant",
    waist="Skrymir Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Locus Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})

	sets.midcast.Helix = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Crematio Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Mujin Band",
    back={ name="Bookworm's Cape", augments={'INT+1','MND+3','Helix eff. dur. +20','"Regen" potency+9',}},
}
	
	sets.midcast.Helix.Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Mujin Band",
    back={ name="Bookworm's Cape", augments={'INT+2','Helix eff. dur. +17','"Regen" potency+10',}},
}

	sets.midcast.Impact = {
    main="Khatvanga",
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
	head=empty,
    body="Twilight Cloak",
    hands={ name="Chironic Gloves", augments={'"Store TP"+2','"Occult Acumen"+11','"Treasure Hunter"+1',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
	
	sets.midcast['Dispelga'] = set_combine(sets.midcast['Dispel'],{ main = "Daybreak" })
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {
    main="Mpaca's Staff",
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Jhakri Robe +2",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs="Assid. Pants +1",
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Argute Stole +2",
    waist="Fucho-no-Obi",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Gelatinous Ring",
    right_ring="Defending Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'"Dbl.Atk."+2','Pet: "Mag.Atk.Bns."+30','"Refresh"+2','Accuracy+11 Attack+11',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Chironic Slippers", augments={'Weapon Skill Acc.+13','"Dbl.Atk."+2','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    sets.idle.Refresh = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'"Dbl.Atk."+2','Pet: "Mag.Atk.Bns."+30','"Refresh"+2','Accuracy+11 Attack+11',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Chironic Slippers", augments={'Weapon Skill Acc.+13','"Dbl.Atk."+2','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
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
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Shamash Robe",
    hands={ name="Chironic Gloves", augments={'"Dbl.Atk."+2','Pet: "Mag.Atk.Bns."+30','"Refresh"+2','Accuracy+11 Attack+11',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Chironic Slippers", augments={'Weapon Skill Acc.+13','"Dbl.Atk."+2','"Refresh"+2','Accuracy+1 Attack+1','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

    sets.idle.Weak.Refresh = {
    main="Mpaca's Staff",
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Jhakri Robe +2",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Argute Stole +2",
    waist="Fucho-no-Obi",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

    -- Defense sets

    sets.defense.PDT = {}

    sets.defense.MDT = {
    main="Malignance Pole",
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.defense.MEVA = {
    main="Malignance Pole",
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
    main="Malignance Pole",
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Goading Belt",
    left_ear="Brutal Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
	sets.engaged.PDT = {}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {legs="Acad. Pants +3"}
	sets.buff['Dark Arts'] = {body="Acad. Gown +3"} --body="Academic's Gown +3"

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Enki Strap",}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end