-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options()
    state.WeaponskillMode:options('Normal','PDL')
	state.IdleMode:options('Normal','Aminon','Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Twash','Mpu')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}

    -- Additional local binds
	send_command('bind !` input /ma "Chocobo Jig II" <me>')
	send_command('wait 3; input /lockstyleset 15')
    select_default_macro_book()
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

	-- Weapons sets
	sets.weapons.Mpu = {main="Mpu Gandring",sub={ name="Fusetto +3", augments={'TP Bonus +1000',}},}
	sets.weapons.Twash = {main="Twashtar",sub="Fusetto +3"}

    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +3"}
    sets.precast.JA['Trance'] = {head="Horos Tiara +3"}
    sets.precast.JA['Saber Dance'] = {legs="Horos Tights +3"}
    sets.precast.Jig = {legs="Horos Tights +3",feet="Maxixi Toe Shoes +3"}
    sets.precast.Samba = {head="Maxixi Tiara +4",back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}}
    sets.precast.Step = {
    ammo="Voluspa Tathlum",
    head="Maxixi Tiara +4",
    body="Malignance Tabard",
    hands="Maxixi Bangles +4",
    legs="Malignance Tights",
    feet={ name="Horos Toe Sh. +4", augments={'Enhances "Closed Position" effect',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back="Null Shawl",
}
    sets.precast.Waltz = {
    head={ name="Horos Tiara +3", augments={'Enhances "Trance" effect',}},
    body="Maxixi Casaque +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Cessance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Toetapper Mantle", augments={'"Store TP"+2','"Dual Wield"+2','"Rev. Flourish"+30','Weapon skill damage +1%',}},
}
	sets.Self_Waltz = {
    head={ name="Horos Tiara +3", augments={'Enhances "Trance" effect',}},
    body="Maxixi Casaque +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Cessance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Defending Ring",
    back={ name="Toetapper Mantle", augments={'"Store TP"+2','"Dual Wield"+2','"Rev. Flourish"+30','Weapon skill damage +1%',}},
}
   sets.precast.Waltz['Healing Waltz'] = {}
    sets.Enmity = {
    ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Goading Belt",
    left_ear="Cryptic Earring",
    right_ear="Trux Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
}		
    sets.precast.JA.Provoke = sets.Enmity
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {
    ammo="Voluspa Tathlum",
    head="Maculele Tiara +3",
    body={ name="Horos Casaque +3", augments={'Enhances "No Foot Rise" effect',}},
    hands="Maxixi Bangles +4",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back="Null Shawl",
}
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
    sets.precast.Flourish1['Desperate Flourish'] = {
    ammo="Voluspa Tathlum",
    head="Maculele Tiara +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Maxixi Bangles +4",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back="Null Shawl",
}
    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {
    hands="Macu. Bangles +3",
    back={ name="Toetapper Mantle", augments={'"Store TP"+2','"Dual Wield"+2','"Rev. Flourish"+30','Weapon skill damage +1%',}},
}
    sets.precast.Flourish2['Building Flourish'] = {}
    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Maculele Casaque +2"}
    sets.precast.Flourish3['Climactic Flourish'] = {} 

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'Pet: Accuracy+11 Pet: Rng. Acc.+11','Sklchn.dmg.+3%','Phalanx +5','Accuracy+10 Attack+10','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    neck="Orunmila's Torque",
    right_ear="Loquac. Earring",
    left_ring="Rahab Ring",
    right_ring="Lebeche Ring",
}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
    sets.precast.WS['Aeolian Edge'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Acumen Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Evisceration'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Blistering Sallet +1", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Pyrrhic Kleos'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Gleti's Gauntlets", augments={'Path: A',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hoxne Earring",
    left_ring="Gere Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS["Rudra's Storm"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Maxixi Bangles +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS["Rudra's Storm"].PDL = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Maxixi Bangles +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS["Ruthless Stroke"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Maxixi Bangles +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS["Ruthless Stroke"].PDL = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Maxixi Bangles +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Ephramad's Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS["Shark Bite"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Maxixi Bangles +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hoxne Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring",ear2="Hoxne Earring"}
	sets.AccMaxTP = {ear1="Sherida Earring",ear2="Hoxne Earring"}
	
    sets.Skillchain = {}
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
    

    -- Idle sets

    sets.idle = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Macu. Bangles +3",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Engraved belt",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back="Null Shawl",
}
    sets.idle.Aminon = {
    main={ name="Twashtar", augments={'Path: A',}},
    sub={ name="Fusetto +3", augments={'TP Bonus +1000',}},
    ammo="Aurgelmir Orb +1",
    head={ name="Gleti's Mask", augments={'Path: A',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Regal Gloves",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Gleti's Boots", augments={'Path: A',}},
    neck="Rep. Plat. Medal",
    waist="Goading Belt",
    left_ear="Dedition Earring",
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Roller's Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
		
    sets.idle.Sphere = set_combine(sets.idle, {})
    
    -- Defense sets

    sets.defense.DT = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Macu. Bangles +3",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Engraved belt",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back="Null Shawl",
}

    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Maculele Tiara +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Malignance Gloves",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	sets.engaged.Acc = {
    ammo="Aurgelmir Orb +1",
    head="Maculele Tiara +3",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Macu. Toe Sh. +3",
    neck={ name="Etoile Gorget +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear={ name="Macu. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','"Store TP"+6','DEX+7 AGI+7',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {legs={ name="Horos Tights +3", augments={'Enhances "Saber Dance" effect',}},}

    sets.buff['Climactic Flourish'] = {head="Maculele Tiara +3",}
    sets.buff['Striking Flourish'] = {body="Maculele Casaque +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {
	waist="Gishdubar Sash",
    left_ring="Saida Ring",
    right_ring="Saida Ring",})

	sets.buff.Sleep = {head="Frenzy Sallet"}

	sets.Phalanx_Received ={
    head={ name="Herculean Helm", augments={'Pet: Accuracy+11 Pet: Rng. Acc.+11','Sklchn.dmg.+3%','Phalanx +5','Accuracy+10 Attack+10','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    body={ name="Herculean Vest", augments={'Pet: AGI+3','Crit.hit rate+1','Phalanx +4',}},
    hands={ name="Herculean Gloves", augments={'MND+6','Mag. Acc.+1','Phalanx +4','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Herculean Trousers", augments={'"Occult Acumen"+1','Pet: INT+2','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21','AGI+1','Phalanx +4','Accuracy+15 Attack+15',}},
}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 5)
    else
        set_macro_page(1, 5)
    end
end