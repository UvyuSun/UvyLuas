function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Tauret','Carn','Staff')
	state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Normal','PDL','Aminon')
    state.CastingMode:options('Normal','Enmity','AoE')
    state.IdleMode:options('Normal','Aminon','Refresh')
	state.Weapons:options('None','DualWeapons')
	-- Whether to use Carn (or song daggers in general) under a certain threshhold even when weapons are locked.
	state.CarnMode = M{'Always','Never','300','1000'}


	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('wait 3; input /lockstyleset 7')
	send_command('wait 5; gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.DualWeapons = {main="Naegling",sub="Fusetto +2"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	sets.TreasureHunter = {
    head={ name="Chironic Hat", augments={'"Store TP"+4','AGI+9','"Treasure Hunter"+2','Accuracy+12 Attack+12',}},
    legs={ name="Chironic Hose", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+4','"Treasure Hunter"+2','Accuracy+5 Attack+5',}},
}
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
    range={ name="Linos", augments={'"Mag.Atk.Bns."+15','"Fast Cast"+3','INT+8',}},
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Song spellcasting time -5%',}},
    legs="Aya. Cosciales +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})
	
	sets.precast.FC.BardSong = {
    range={ name="Linos", augments={'"Mag.Atk.Bns."+15','"Fast Cast"+3','INT+8',}},
    head="Nahtirah Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Song spellcasting time -5%',}},
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','Song spellcasting time -5%',}},
    feet={ name="Telchine Pigaches", augments={'Song spellcasting time -6%',}},
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Aria of Passion'] = set_combine(sets.precast.FC.BardSong,{range="Loughnashade"})
	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	-- Precast sets to enhance JAs
	
    sets.precast.JA.Nightingale = {feet="Bihu Slippers +4"}
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +4"}
    sets.precast.JA['Soul Voice'] = {
	legs="Bihu Cannions +4",
}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bihu Just. +4", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}    
    sets.precast.WS['Aeolian Edge'] = {
    range={ name="Linos", augments={'"Mag.Atk.Bns."+15','"Fast Cast"+3','INT+8',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Alabaster Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
}
    sets.precast.WS['Evisceration'] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head="Nyame Helm",
    body={ name="Bihu Just. +4", augments={'Enhances "Troubadour" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
} 
 sets.precast.WS['Savage Blade'] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head="Nyame Helm",
    body={ name="Bihu Just. +4", augments={'Enhances "Troubadour" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}                                                                                                                                         --PDT48%
    sets.precast.WS['Mordant Rime'] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head="Nyame Helm",
    body={ name="Bihu Just. +4", augments={'Enhances "Troubadour" effect',}},
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Retribution'] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bihu Just. +4", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}   
    sets.precast.WS["Rudra's Storm"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bihu Just. +4", augments={'Enhances "Troubadour" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}  
    sets.precast.WS['Shell Crusher'] = { 
    range={ name="Linos", augments={'"Mag.Atk.Bns."+15','"Fast Cast"+3','INT+8',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Alabaster Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Intarabus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
}
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear2="Regal Earring",}
	sets.AccMaxTP = {ear2="Regal Earring",}
	-- General set for recast times.
	sets.midcast.FastRecast = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Etiolation Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
	-- Gear to enhance certain classes of songs
	sets.midcast['Foe Lullaby'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +2",
    hands="Brioso Cuffs +4",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +4",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}
	sets.midcast['Foe Lullaby II'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +2",
    hands="Brioso Cuffs +4",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +4",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}
	sets.midcast['Horde Lullaby'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +2",
    hands="Brioso Cuffs +4",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +4",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}
	sets.midcast['Horde Lullaby II'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +2",
    hands="Brioso Cuffs +4",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +4",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}
	sets.midcast['Warding Round'] = {range="Daurdabla"}
	sets.midcast['Goblin Gavotte'] = {range="Daurdabla"}
	sets.midcast['Shining Fantasia'] = {range="Daurdabla"}
	sets.midcast['Aria of Passion'] = {Range="Loughnashade"}
	sets.midcast.Ballad = {legs="Fili Rhingrave +2"}
	sets.midcast.Carol = {hands="Mousai Gages +1",}
	sets.midcast.Etude = {head="Mousai Turban +1",}
	sets.midcast['Foe Requiem VII'] = 	{}	 
	sets.midcast["Goddess's Hymnus"] = {range="Daurdabla"} 
	sets.midcast.Madrigal = {head="Fili Calot +2"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mambo = {feet="Mousai crackows +1"}
	sets.midcast.March = {hands="Fili Manchettes +2"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas",hands="Fili Manchettes +1"})
	sets.midcast.Mazurka = {range="Daurdabla"}
	sets.midcast.Minne = {legs="Mousai Seraweels +1"}
	sets.midcast.Minuet = {body="Fili Hongreline +2"}
	sets.midcast.Paeon = {head="Brioso Roundlet +4",}
	sets.midcast['Carnage Elegy'] = {
    range="Gjallarhorn",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +2",
    hands="Brioso Cuffs +4",
    legs="Brios. Cann. +4",
    feet="Brioso Slippers +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.midcast['Pining Nocturne'] = {
    range="Gjallarhorn",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +2",
    hands="Brioso Cuffs +4",
    legs="Brios. Cann. +4",
    feet="Brioso Slippers +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.midcast['Utsusemi'] = {
    range={ name="Linos", augments={'"Mag.Atk.Bns."+15','"Fast Cast"+3','INT+8',}},
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Embla Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
    main="Carnwenhan",
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Fili Calot +2",
    body="Fili Hongreline +2",
    hands="Fili Manchettes +2",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +4",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}		
	sets.midcast.SongEffect.DW = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Kali",
	} --Only weapons in this set. This set is overlayed onto SongEffect

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
    range="Gjallarhorn",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +2",
    hands="Brioso Cuffs +4",
    legs="Brios. Cann. +4",
    feet="Brioso Slippers +4",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	sets.midcast.SongDebuff.DW = {}	--Only weapons in this set. This set is overlayed onto  SongDebuff}
	--Only weapons in this set. This set is overlayed onto  SongDebuff

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {}

		
	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Bishop's Sash",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.midcast['Cure II'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Bishop's Sash",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.midcast['Cure III'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Bishop's Sash",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.midcast['Cure IV'] = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Bishop's Sash",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
    sets.midcast.LightWeatherCure = {
    main="Chatoyant Staff",
    sub="Enki Strap",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back="Twilight Cape",
}
	sets.midcast.Curaga = {
    main="Daybreak",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Incanter's Torque",
    waist="Bishop's Sash",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},                                                                                        
}
	sets.midcast.LightWeatherCuraga = {
    main="Chatoyant Staff",
    sub="Enki Strap",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Meili Earring",
    left_ring="Sirona's Ring",
    right_ring="Menelaus's Ring",
    back="Twilight Cape",
}	
	sets.midcast.Cursna =  {
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    hands="Inyan. Dastanas +2",
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Plat. Mog. Belt",
    left_ear="Magnetic Earring",
    right_ear="Meili Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.Refresh_Received = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
    main="Pukulatmuj +1",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
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
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}	
	sets.midcast.Stoneskin = {
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck="Nodens Gorget",
    waist="Siegel Sash",
    left_ear="Earthcry Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast.Aquaveil = {
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Emphatikos Rope",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}	
	sets.midcast.BarElement = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Eabani Earring",
    right_ear="Halasz Earring",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
}
	sets.midcast['Elemental Magic'] = {
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Bunzi's Pants", augments={'Path: A',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Skrymir Cord +1",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
	sets.midcast['Elemental Magic'].Resistant = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Enki Strap",
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Bunzi's Pants", augments={'Path: A',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Skrymir Cord +1",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
	sets.midcast['Enfeebling Magic'] = {
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Dark Magic'] = {
    range={ name="Linos", augments={'Mag. Acc.+20','"Fast Cast"+6','MP+20',}},
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Brios. Cann. +4",
    feet="Fili Cothurnes +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.Phalanx_Received ={
    head={ name="Chironic Hat", augments={'CHR+2','Attack+9','Phalanx +5','Accuracy+3 Attack+3',}},
    body={ name="Chironic Doublet", augments={'MND+8','Pet: Attack+26 Pet: Rng.Atk.+26','Phalanx +4','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    hands={ name="Chironic Gloves", augments={'Pet: Phys. dmg. taken -1%','"Store TP"+3','Phalanx +4','Accuracy+14 Attack+14','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    legs={ name="Chironic Hose", augments={'Mag. Acc.+22','"Fast Cast"+1','Phalanx +4',}},
    feet={ name="Chironic Slippers", augments={'INT+4','Damage taken-1%','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
}
	-- Resting sets
	sets.resting = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ashera Harness",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}
	sets.idle = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ashera Harness",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}
    sets.idle.Aminon = {
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head="Null Masque",
    body="Adamantite Armor",
    hands="Regal Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Roller's Ring",
    right_ring="Chirich Ring +1",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.idle.Refresh = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Warder's Charm +1",
    waist="Fucho-no-Obi",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
    sets.idle.Town = {
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Blurred Harp +1",
    head="Mousai Turban +1",
    body="Mou. Manteel +1",
    hands="Mousai Gages +1",
    legs="Mou. Seraweels +1",
    feet="Mou. Crackows +1",
    neck="Mnbw. Whistle +1",
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Damage taken-5%',}},
}
    sets.idle.Weak = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ashera Harness",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Murky Ring",
    back={ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
}
    sets.idle.Weak.Refresh = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Warder's Charm +1",
    waist="Fucho-no-Obi",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	

	sets.Kiting = {feet="Fili Cothurnes +2"}
--	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets
	
	sets.engaged = {	          --Non DW sub Naegling.
    main="Naegling",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.Tauret = {         --Non DW Sub Twashtar.                                                                                                            --
    main="Tauret",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.Carn = {	       --Non DW Sub Carnwenhan.                                                                                                         --
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.Aeneas = {         --Non DW Sub AeolianSet.                                                                                                            --
    main="Aeneas",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.DW = {	           --Naegling. 
    main="Naegling",
    sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.DW.Tauret = {	       --Tauret.                                                                                                           --
    main="Tauret",
    sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.DW.Carn = {	     --Carnwenhan.                                                                                                  --
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Gleti's Knife",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.DW.Aeneas = {      --AeolianSet                                                                                                  --
    main="Aeneas",
    sub="Daybreak",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Store TP"+4','Quadruple Attack +3',}},
    head="Revelation Masque",
    body="Ashera Harness",
    hands="Bunzi's Gloves",
    legs="Revelation Brais",
    feet="Revelation Sab.",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end

state.Weapons:options('None','DualWeapons','DualWeapons2','DualWeapons3','DualWeapons5')

autows_list = {['DualWeapons']='Mordant Rime',['DualWeapons2']='Savage Blade',['DualWeapons3']="Rudra's Storm",
     ['DualWeapons5']='Retribution'}

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 008')
end