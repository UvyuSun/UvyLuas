-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.RangedMode:options('Normal')
    state.WeaponskillMode:options('SB','LastStand','Leaden')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('None','Savage','Fomal','Leaden','SingNaeg','Single')
	state.CompensatorMode:options('Always')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15

    -- Additional local binds
	send_command('bind !` input /ma "Bolters Roll" <me>')

    select_default_macro_book()
end
	send_command('wait 3; input /lockstyleset 7')
-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    -- Weapon Sets
	sets.DefaultShield = {sub="Nusku Shield"}
	sets.weapons.Default = {}
	sets.weapons.Fomal = {main="Tauret",sub={ name="Gleti's Knife", augments={'Path: A',}},range={ name="Fomalhaut", augments={'Path: A',}},ammo="Chrono Bullet"}
	sets.weapons.Leaden = {main="Naegling",sub="Tauret",range="Molybdosis",ammo="Chrono Bullet"}	
    sets.weapons.Savage = {main="Naegling",sub={ name="Gleti's Knife", augments={'Path: A',}},range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},ammo="Chrono Bullet"}
	sets.weapons.Single = {main="Rostam",sub="Nusku Shield",range={ name="Fomalhaut", augments={'Path: A',}},ammo="Chrono Bullet"}
	sets.weapons.SingNaeg = {main="Naegling",sub="Nusku Shield",range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},ammo="Chrono Bullet"}

    -- Precast sets to enhance JAs
	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +4"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +4"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants"}

    sets.precast.CorsairRoll = {
    main={ name="Rostam", augments={'Path: C',}},
    sub="Nusku Shield",
    range={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
    ammo="Chrono Bullet",
    head="Lanun Tricorne +1",
    body="Nyame Mail",
    hands="Chasseur's Gants +1",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Regal Necklace",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants"})
    
    sets.precast.CorsairShot = {
    ammo="Hauksbok Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Dingir Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Damage taken-5%',}},
}
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
    head={ name="Herculean Helm", augments={'Accuracy+30','"Waltz" potency +9%','Attack+1',}},
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Dashing Subligar",
    feet={ name="Herculean Boots", augments={'"Waltz" potency +11%','STR+6',}},
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Waltz" potency +10%','Phys. dmg. taken-10%',}},
}
	sets.Self_Waltz = {
    head={ name="Herculean Helm", augments={'Accuracy+30','"Waltz" potency +9%','Attack+1',}},
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Dashing Subligar",
    feet={ name="Herculean Boots", augments={'"Waltz" potency +11%','STR+6',}},
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','"Waltz" potency +10%','Phys. dmg. taken-10%',}},
}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    head={ name="Herculean Helm", augments={'"Dual Wield"+1','Haste+3','"Fast Cast"+8','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    -- Snapshot Total: 70 Rapidshot Total: 68
    sets.precast.RA = {
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+4',}},
    body="Laksa. Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Yemaya Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Mag. Evasion+15',}},
}		
    -- Snapshot Total: 70 Rapidshot Total: 93
    sets.precast.RA.Flurry1 = {
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+4',}},
    body="Laksa. Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Yemaya Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Mag. Evasion+15',}},
}
	-- Snapshot Total: 72 Rapidshot Total: 103
    sets.precast.RA.Flurry2 = {
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+4',}},
    body="Laksa. Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Yemaya Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Mag. Evasion+15',}},
}       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Laksa. Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck="Rep. Plat. Medal",	
    waist="Sailfi Belt +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Laksa. Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}				
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
	
    sets.precast.WS['Last Stand'] = {		
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Laksa. Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Regal Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}
    sets.precast.WS['Leaden Salute'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Laksa. Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Damage taken-5%',}},
}	
    sets.precast.WS['Wildfire'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Laksa. Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +1", augments={'Path: A',}},
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Damage taken-5%',}},
}	
    sets.precast.WS['Hot Shot'] = {
    ammo="Chrono Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

    sets.precast.WS['Aeolian Edge'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {
	
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
}
        
    -- Specific spells

	sets.midcast.Cure = {

}
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
 
    sets.Phalanx_Received = {
}

    -- Ranged gear
    sets.midcast.RA ={
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Tellen Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
		
	sets.buff['Triple Shot'] = {
	}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {waist="Gishdubar Sash", left_ring="Purity Ring", right_ring="Saida Ring",})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {
    main="Naegling",
    sub="Gleti's Knife",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.idle.Refresh = {
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    
    -- Defense sets
    sets.defense.PDT = {    
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.defense.MDT = {    
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.defense.MEVA = {    
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.Kiting = {Ring1="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {}
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    main="Naegling",
    sub="Nusku Shield",
    range="Anarchy +2",
    ammo="Chrono Bullet",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back="Null Shawl",
}	
    sets.engaged.Acc = {
    main="Naegling",
    sub="Nusku Shield",
    range="Anarchy +2",
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back="Null Shawl",
}
    sets.engaged.DW = {
    main="Naegling",
    sub="Gleti's Knife",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Eabani Earring",
    left_ring="Lehko's Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
}
	sets.engaged.DW.Acc = {
    main="Naegling",
    sub="Gleti's Knife",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Chrono Bullet",
    range="Anarchy +2",
    head="Malignance Chapeau",
    body="Nyame Mail",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Brutal Earring",
    right_ear="Eabani Earring",
    left_ring="Lehko's Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 9)
    elseif player.sub_job == 'DNC' then
		set_macro_page(2, 9)
    elseif player.sub_job == 'RNG' then
        set_macro_page(2, 9)
    else
        set_macro_page(2, 9)
    end   


end