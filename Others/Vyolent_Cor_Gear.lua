-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('SB','LastStand','Leaden')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('None','Savage','Fomal','Leaden','SingNaeg','Single')
	state.CompensatorMode:options('Always')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
--	send_command('bind !` gs c elemental quickdraw')
	send_command('bind !` input /ma "Bolters Roll" <me>')
	select_default_macro_book()
	send_command('wait 3; input /lockstyleset 7')
end

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
	
	sets.TreasureHunter = {
    head={ name="Herculean Helm", augments={'CHR+9','Pet: MND+8','"Treasure Hunter"+2',}},
    body={ name="Herculean Vest", augments={'"Triple Atk."+1','Rng.Atk.+8','"Treasure Hunter"+2','Accuracy+8 Attack+8','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
}

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +4"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +4"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +4"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +4"}

    sets.precast.CorsairRoll = {
	main="Rostam",
    range="Compensator",
    head={ name="Lanun Tricorne +4", augments={'Enhances "Winning Streak" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +2",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Regal Necklace",
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Luzaf's Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

    sets.precast.LuzafRing = {left_ring="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    
    sets.precast.CorsairShot = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Herculean Gloves", augments={'"Waltz" potency +10%','Attack+1',}},
    legs="Dashing Subligar",
    feet={ name="Herculean Boots", augments={'Accuracy+22','"Waltz" potency +11%','DEX+9','Attack+10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'CHR+20','Eva.+20 /Mag. Eva.+20','CHR+10','"Waltz" potency +10%','Damage taken-5%',}},
}
		
	sets.Self_Waltz = {
    head="Mummu Bonnet +2",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Herculean Gloves", augments={'"Waltz" potency +10%','Attack+1',}},
    legs="Dashing Subligar",
    feet={ name="Herculean Boots", augments={'Accuracy+22','"Waltz" potency +11%','DEX+9','Attack+10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Asklepian Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'CHR+20','Eva.+20 /Mag. Eva.+20','CHR+10','"Waltz" potency +10%','Damage taken-5%',}},
}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+5','"Fast Cast"+6','Mag. Acc.+4',}},
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+5','"Mag.Atk.Bns."+7','"Fast Cast"+1',}},
    legs={ name="Herculean Trousers", augments={'"Fast Cast"+6',}},
    feet={ name="Herculean Boots", augments={'Pet: "Mag.Atk.Bns."+20','Accuracy+17','"Fast Cast"+8',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})

    -- Snapshot Total: 70 Rapidshot Total: 68
    sets.precast.RA = {
    head="Chass. Tricorne +1",
    body="Oshosi Vest +1",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Meg. Jam. +2",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Impulse Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Crepuscular Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Mag. Evasion+15',}},
}		
    -- Snapshot Total: 70 Rapidshot Total: 93
    sets.precast.RA.Flurry1 = {
    head="Chass. Tricorne +1",
    body="Laksa. Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Meg. Jam. +2",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Crepuscular Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Mag. Evasion+15',}},
}

	-- Snapshot Total: 72 Rapidshot Total: 103
	sets.precast.RA.Flurry2 = {
    head="Chass. Tricorne +1",
    body="Laksa. Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet={ name="Pursuer's Gaiters", augments={'Rng.Acc.+10','"Rapid Shot"+10','"Recycle"+15',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Etiolation Earring",
    left_ring="Crepuscular Ring",
    right_ring="Murky Ring",
    back={ name="Camulus's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Snapshot"+10','Mag. Evasion+15',}},
}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Epaminondas's Ring",
    right_ring="Karieyh Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
		--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    sets.precast.WS['Aeolian Edge'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck="Sibyl Scarf",
    waist="Skrymir Cord",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}	
    sets.precast.WS['Burning Blade'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck="Sibyl Scarf",
    waist="Skrymir Cord",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Hot Shot'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Last Stand'] = {		
    head={ name="Lanun Tricorne +4", augments={'Enhances "Winning Streak" effect',}},
    body="Laksa. Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Leaden Salute'] = {
    head="Pixie Hairpin +1",
    body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Archon Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}	
    sets.precast.WS['Wildfire'] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {left_ear={ name="Alabaster Earring", augments={'Path: A',}},right_ear="Ishvara Earring",}      
    -- Specific spells

    sets.Phalanx_Received = {
    hands={ name="Herculean Gloves", augments={'CHR+4','Mag. Acc.+1','Phalanx +4','Accuracy+1 Attack+1','Mag. Acc.+6 "Mag.Atk.Bns."+6',}},
    legs={ name="Herculean Trousers", augments={'STR+5','MND+10','Phalanx +3','Accuracy+19 Attack+19',}},
    feet={ name="Herculean Boots", augments={'"Dbl.Atk."+1','Pet: STR+7','Phalanx +4','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
}
    -- Ranged gear
    sets.midcast.RA ={
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},
}	
	sets.buff['Triple Shot'] = {
    head="Oshosi Mask +1",
    body="Chasseur's Frac +1",
    hands={ name="Lanun Gants +4", augments={'Enhances "Fold" effect',}},
    legs="Osh. Trousers +1",
    feet="Osh. Leggings +1",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}},
}
    -- Sets to return to when not performing an action.
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}	
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Kiting = {legs="Carmine Cuisses +1"}	
	sets.buff.Doom = set_combine(sets.buff.Doom, {waist="Gishdubar Sash"})
    
    -- Resting sets
    sets.resting = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    -- Idle sets
    sets.idle = {
    main="Naegling",
	sub="Crepuscular Knife",
	range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	ammo="Chrono Bullet",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Warder's Charm",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
    -- Defense sets
    sets.defense.PDT = {    
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    sets.defense.MDT = {    
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}		
    sets.defense.MEVA = {    
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}    
    -- Normal melee group
    sets.engaged = {
	main="Naegling",
	sub="Nusku Shield",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Null Shawl",
}
    sets.engaged.Acc = {
	main="Naegling",
	sub="Nusku Shield",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
    sets.engaged.DW = {
    main="Naegling",
	name="Crepuscular Knife",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    sets.engaged.DW.Acc = {
    main="Naegling",
	name="Crepuscular Knife",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Chrono Bullet",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Alabaster Earring",
    left_ring="Epona's Ring",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
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