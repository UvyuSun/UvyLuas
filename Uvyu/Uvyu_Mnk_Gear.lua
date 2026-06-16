function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Hox')
    state.WeaponskillMode:options('Normal')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'HP')
	state.Weapons:options('Verethragna','Godhands','Staff')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Additional local binds
	send_command('wait 3; input /lockstyleset 20')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.TreasureHunter = {
    body="Volte Jupon",
    feet="Volte Boots",
    waist="Chaac Belt",
}
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	sets.precast.JA['Boost'] = {
    ammo="Staunch Tathlum +1",
    head="Maat's Cap",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Hoxne Torque",
    waist="Ask Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.JA['Boost'].OutOfCombat = {
    ammo="Staunch Tathlum +1",
    head="Maat's Cap",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Hoxne Torque",
    waist="Ask Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.JA['Chi Blast'] = {head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},}
	sets.precast.JA['Chakra'] = {
        hands="Hesychast's Gloves +3",
		body="Anch. cyclas +3"
	}
	sets.precast.JA['Counterstance'] = {} --feet="Hesychast's Gaiters +3"
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +4"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +3"}
	sets.precast.JA['Footwork'] = {feet="Bhikku Gaiters +3"}
	sets.precast.JA['Formless Strikes'] = {} --body="Hesychast's Cyclas +3"
	sets.precast.JA['Mantra'] = {} --feet="Hesychast's Gaiters +3"
    sets.precast.JA['Perfect Counter'] = {
    ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Moonlight Necklace",
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Trux Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back="Moonlight Cape",
}
    sets.Enmity = {
    ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Moonlight Necklace",
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Trux Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back="Moonlight Cape",
}
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
		
	sets.precast.Flourish1 = {}


	-- Fast cast sets for spells
	
	sets.precast.FC = {
	ammo="Sapience Orb",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    neck="Orunmila's Torque",
    left_ear="Loquac. Earring",
    left_ring="Rahab Ring",
    right_ring="Lebeche Ring",
	legs="Rawhide Trousers"
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo="Knobkierrie",
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}

	-- Specific weaponskill sets.
	sets.precast.WS["Ascetic's Fury"]  = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Hoxne Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Asuran Fists']    = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Alabaster Earring",
    right_ear="Hoxne Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Dragon Kick']     = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Anch. Gaiters +4",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Final Heaven']    = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bhikku Cyclas +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Hoxne Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Howling Fist']    = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS["Raging Fists"]    = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Shijin Spiral'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Spinning Attack'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Tornado Kick']    = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Mpaca's Cap", augments={'Path: A',}},
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Anch. Gaiters +4",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS["Victory Smite"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Blistering Sallet +1",
    body="Bhikku Cyclas +3",
    hands="Bhikku Gloves +3",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet={ name="Mpaca's Boots", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Odr Earring",
    right_ear="Hoxne Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Cataclysm'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Archon Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring",ear2="Schere Earring"}
	sets.AccMaxTP = {ear1="Telos Earring",ear2="Schere Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {body="Hesychast's Cyclas",ring2="Sheltered Ring"}
	

	-- Idle sets
	sets.idle = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.idle.HP = {
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Regal Ring",
    back="Moonlight Cape",
}
	sets.idle.Weak = {
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Regal Ring",
    back="Moonlight Cape",
}

	sets.idle.Town = {
    main={ name="Verethragna", augments={'Path: A',}},
    ammo="Aurgelmir Orb +1",
    head="Maat's Cap",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Raetic Bangles +1",
    legs={ name="Mpaca's Hose", augments={'Path: A',}},
    feet="Hermes' Sandals +1",
    neck="Moonlight Necklace",
    waist="Skrymir Cord +1",
    left_ear="Balder Earring",
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Chirich Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}

	-- Defense sets

	sets.defense.HP = {
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    right_ring="Regal Ring",
    back="Moonlight Cape",
}

	sets.Kiting = {feet="Hermes' Sandals +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body={ name="Mpaca's Doublet", augments={'Path: A',}},
    hands={ name="Mpaca's Gloves", augments={'Path: A',}},
    legs="Bhikku Hose +3",
    feet="Anchorite's Gaiters +4",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.engaged.Hox = {
    ammo="Aurgelmir Orb +1",
    head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Bhikku Hose +3",
    feet="Anch. Gaiters +4",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Schere Earring", augments={'Path: A',}},
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.engaged.Acc = {
    ammo="Coiste Bodhar",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Unmoving Collar +1",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Regal Ring",
    back="Moonlight Cape",
}

	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +3"}
	sets.buff.Footwork = {}
	sets.buff.Boost = {waist="Ask Sash"} 
	
	sets.FootworkWS = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.Skillchain = {}
	
	sets.Phalanx_Received ={
    head={ name="Herculean Helm", augments={'Pet: Accuracy+11 Pet: Rng. Acc.+11','Sklchn.dmg.+3%','Phalanx +5','Accuracy+10 Attack+10','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    body={ name="Herculean Vest", augments={'Pet: AGI+3','Crit.hit rate+1','Phalanx +4',}},
    hands={ name="Herculean Gloves", augments={'MND+6','Mag. Acc.+1','Phalanx +4','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Herculean Trousers", augments={'"Occult Acumen"+1','Pet: INT+2','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21','AGI+1','Phalanx +4','Accuracy+15 Attack+15',}},
}
	
	-- Weapons sets

	sets.weapons.Verethragna = {main="Verethragna"}
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Staff = {main="Xoanon",sub="Ultio Grip"}
	sets.weapons.Spharai = {main="Spharai"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(7, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(7, 2)
	elseif player.sub_job == 'THF' then
		set_macro_page(7, 2)
	elseif player.sub_job == 'RUN' then
		set_macro_page(7, 2)
	else
		set_macro_page(7, 2)
	end
end