function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'Refresh')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','SU4','DualWeapons1','DualWeapons2')

		-- Additional local binds
	select_default_macro_book()
	
	send_command('wait 3; input /lockstyleset 3')
	
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	sets.TreasureHunter = {
    legs="Volte Hose",
	hands="Volte Bracers",
    waist="Chaac Belt",
}

	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +4"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
    ammo="Staunch Tathlum +1",
    head="Bunzi's Hat",
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {Main="Daybreak",})       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo="Coiste Bodhar",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Savage Blade'] = {
    ammo="Coiste Bodhar",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Anu Torque",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
		
	sets.precast.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Baetyl Pendant",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Acumen Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.precast.WS['Aeolian Edge'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Baetyl Pendant",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Acumen Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	
	-- Midcast Sets
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	sets.RecoverBurst = {}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	sets.midcast.FastRecast = {}

    sets.midcast.Cure = {
    ammo="Regal Gem",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Bunzi's Robe",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
    sets.midcast.LightWeatherCure = {
    ammo="Regal Gem",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Bunzi's Robe",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
    ammo="Regal Gem",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Bunzi's Robe",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Atrophy Tights +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
	sets.midcast.Cursna = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast.BarElement = {
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +4",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Lethargy Houseaux +2",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}	
	sets.midcast.BarStatus = {
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +4",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Lethargy Houseaux +2",
    neck="Sroda Necklace",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

    sets.midcast['Enhancing Magic'] = {
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +4",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Leth. Houseaux +2",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +2",
    hands="Atrophy Gloves +4",
    legs="Leth. Fuseau +2",
    feet="Leth. Houseaux +2",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Lethargy Fuseau +2"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear1="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.Temper = {
    main="Pukulatmuj +1",
    sub={ name="Forfend +1", augments={'Path: A',}},
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +3",
    feet="Leth. Houseaux +2",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast.Phalanx = {
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Chironic Hat", augments={'"Rapid Shot"+2','Mag. Acc.+25','Phalanx +3','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    body={ name="Chironic Doublet", augments={'Pet: INT+7','Accuracy+9','Phalanx +3','Accuracy+5 Attack+5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
    hands={ name="Chironic Gloves", augments={'Pet: STR+7','"Mag.Atk.Bns."+24','Phalanx +3','Accuracy+12 Attack+12',}},
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Chironic Slippers", augments={'MND+3','Weapon Skill Acc.+10','Phalanx +4','Accuracy+10 Attack+10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Arete del Luna +1",
    right_ear="Alabaster Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Phalanx II'] = {
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +2",
    hands="Atrophy Gloves +4",
    legs="Leth. Fuseau +2",
    feet="Leth. Houseaux +2",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast.Enspell = {
    main="Pukulatmuj +1",
    sub={ name="Forfend +1", augments={'Path: A',}},
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body={ name="Viti. Tabard +4", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +3",
    feet="Leth. Houseaux +2",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Blaze Spikes'] = {
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +2",
    hands="Atrophy Gloves +4",
    legs="Leth. Fuseau +2",
    feet="Leth. Houseaux +2",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Ice Spikes'] = {
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +2",
    hands="Atrophy Gloves +4",
    legs="Leth. Fuseau +2",
    feet="Leth. Houseaux +2",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Shock Spikes'] = {
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Leth. Chappel +2",
    body="Lethargy Sayon +2",
    hands="Atrophy Gloves +4",
    legs="Leth. Fuseau +2",
    feet="Leth. Houseaux +2",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +9','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +20',}},
}	
	sets.midcast['Enfeebling Magic'] = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast['Enfeebling Magic'].Resistant = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast.IntEnfeebles = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast.IntEnfeebles.Resistant = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast.MndEnfeebles = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.MndEnfeebles.Resistant = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Bind'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Bind'].Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}	
	sets.midcast['Distract III'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Distract III'].Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Silence = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Silence.Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Sleep = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Sleep.Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Break = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Break.Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Dispel = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Dispel.Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	
	sets.midcast.SkillBasedEnfeebling = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast['Frazzle II'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Frazzle II'].Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

	sets.midcast['Frazzle III'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

	sets.midcast['Frazzle III'].Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

	sets.midcast['Dia III'] = {
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

	sets.midcast['Bio III'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +2",
    legs="Leth. Fuseau +2",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

	sets.midcast['Dispelga'] = set_combine(sets.midcast['Dispel'],{ main = "Daybreak" })
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",waist="Acuity Belt +1"})

    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",waist="Acuity Belt +1"})

	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    sets.midcast['Elemental Magic'] = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Baetyl Pendant",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Acumen Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
    sets.midcast['Elemental Magic'].Burst = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Baetyl Pendant",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Acumen Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
	sets.midcast.Impact = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
	body="Twilight Cloak",
    hands="Bunzi's Gloves",
    legs="Bunzi's Pants",
    feet="Bunzi's Sabots",
    neck="Baetyl Pendant",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring="Acumen Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
	sets.midcast['Dark Magic'] = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

    sets.midcast.Drain = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Lethargy Gantherots +2",
    legs={ name="Chironic Hose", augments={'"Cure" potency +4%','Pet: Attack+13 Pet: Rng.Atk.+13','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Snotra Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Regal Gem",
    head="Atro. Chapeau +2",
    body="Atrophy Tabard +4",
    hands="Regal Cuffs",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+9','Accuracy+3 Attack+3','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    feet={ name="Vitiation Boots +1", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +2"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Shamash Robe",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
		
	sets.idle.Refresh = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','INT+6 MND+6',}},
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Bathy Choker +1",
    waist="Fucho-no-Obi",
    left_ear="Magnetic Earring",
    right_ear="Infused Earring",
    left_ring="Archon Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','"Regen"+5',}},
}
		
	sets.idle.MDT = {}
		
	sets.idle.Weak = {}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Umbra Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {}
		
    sets.defense.MEVA = {}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.SU4 = {main={ name="Vitiation Sword",augments={'Path: C',}},sub="Ammurapi Shield"}
	sets.weapons.DualWeapons1 = {main="Naegling",sub={ name="Ternion Dagger +1", augments={'Path: A',}},}
	sets.weapons.DualWeapons2 = {main="Tauret",sub={ name="Ternion Dagger +1", augments={'Path: A',}},}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Ginsen",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {
    main="Naegling",
	sub="Ammurapi Shield",
	ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.DW = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Bunzi's Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Lissome Necklace",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
		
	sets.engaged.PhysicalDef = {}
		
	sets.engaged.MagicalDef = {}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'WHM' then
		set_macro_page(4, 8)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 8)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 8)
	end
end