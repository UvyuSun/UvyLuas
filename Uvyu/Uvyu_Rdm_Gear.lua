function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')--Odin
    state.HybridMode:options()
	state.WeaponskillMode:options('Match','PDL')
	state.AutoBuffMode:options('Off','Auto','AutoMelee')
	state.CastingMode:options('Normal','Burst','Occult')
    state.IdleMode:options('Normal','Refresh')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options()
	state.ResistDefenseMode:options()
	state.Weapons:options('None','Naeg','Maxen','Su5','Murg')--'Excal','Aern','Mandau','Ullr'


		-- Additional local binds

    select_default_macro_book()
end

	send_command('wait 3; input /lockstyleset 6')

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Weapons sets
	sets.weapons.Naeg = {main="Naegling",sub={ name="Thibron", augments={'TP Bonus +1000',}}}	sets.weapons.Naeg = {main="Naegling",sub={ name="Thibron", augments={'TP Bonus +1000',}}}
	sets.weapons.Su5 = {main={ name="Crocea Mors", augments={'Path: C',}},sub={ name="Bunzi's Rod", augments={'Path: A',}},}
	sets.weapons.Maxen = {main="Maxentius",sub={ name="Thibron", augments={'Path: A',}}}
	sets.weapons.Murg = {main={ name="Murgleis", augments={'Path: A',}},sub="Daybreak",}
--	sets.weapons.Excal = {main={ name="Excalibur", augments={'Path: A',}},sub="Crepuscular Knife"}
--	sets.weapons.Aern = {main="Aern Dagger",sub="Aern Dagger II"}
--	sets.weapons.Mandau = {main="Mandau",sub="Crepuscular Knife"}
--	sets.weapons.Ullr = {main="Fettering Blade",sub="Ammurapi Shield",range="Ullr",ammo="Raetic Arrow",}

	sets.TreasureHunter = {
    body="Volte Jupon",
    feet="Volte Boots",
    waist="Chaac Belt",
}
    sets.precast.Item['Holy Water'] = {
	neck="Nicander's Necklace", 
    left_ring="Blenmot's Ring +1",
    right_ring="Blenmot's Ring +1",
}
    sets.precast.Item['Icarus Wing'] = {
    ammo="Aurgelmir Orb +1",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Goading Belt",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}

	-- Sets for special buff conditions on spells. Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}		
	sets.buff.Saboteur = {hands="Lethargy Gantherots +3",}		
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}
  

	sets.Self_Healing = {waist="Gishdubar Sash"}

	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.Cure_Received = {waist="Gishdubar Sash"}
	 
	sets.buff.Doom = {neck="Nicander's Necklace",waist="Gishdubar Sash",ring1="Eshmun's Ring",ring2="Eshmun's Ring"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	sets.precast.RA = {
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
    body={ name="Taeon Tabard", augments={'"Snapshot"+5','"Snapshot"+5',}},
    hands={ name="Taeon Gloves", augments={'"Snapshot"+5','"Snapshot"+5',}},
    legs={ name="Taeon Tights", augments={'"Snapshot"+5','"Snapshot"+5',}},
    feet={ name="Taeon Boots", augments={'"Snapshot"+5','"Snapshot"+5',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Crepuscular Ring",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'"Snapshot"+10',}},
}
	
    sets.midcast.RA = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Marked Gorget",
    waist="Yemaya Belt",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Hajduk Ring",
    back={ name="Sucellos's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
    ammo="Staunch Tathlum +1",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+2','"Fast Cast"+7',}},
    body="Adamantite Armor",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
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
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Republican Platinum Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Aeolian Edge'] = {
    ammo="Sroda Tathlum",
    head="Leth. Chappel +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Black Halo'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS['Black Halo'].PDL = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Death Blossom'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS['Empyreal Arrow'] = {	
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Knights of Round'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Republican Platinum Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear="Sherida Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Mercy Stroke'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Red Lotus Blade'] = {
    ammo="Sroda Tathlum",
    head="Leth. Chappel +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
	sets.precast.WS.Requiescat = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS['Sanguine Blade'] = {
    ammo="Sroda Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Archon Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS['Savage Blade'] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Republican Platinum Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Savage Blade'].PDL = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Republican Platinum Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Seraph Blade'] = {
    ammo="Sroda Tathlum",
    head="Leth. Chappel +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	-- Midcast Sets
	
    sets.midcast.Cure = {
    ammo="Staunch Tathlum +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}		
    sets.midcast.LightWeatherCure = {
    ammo="Staunch Tathlum +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Twilight Cape",
}	
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
    ammo="Staunch Tathlum +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Twilight Cape",
}	
	sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  {
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Hoxne Torque",
    waist="Bishop's Sash",
    left_ear="Magnetic Earring",
    right_ear="Meili Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast.StatusRemoval = {}

	sets.midcast.BarElement = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs="Shedir Seraweels",
    feet="Lethargy Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Tuisto Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast.BarStatus = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet="Lethargy Houseaux +3",
    neck="Sroda Necklace",
    waist="Embla Sash",
    left_ear="Tuisto Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Enhancing Magic'] = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet="Lethargy Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}		
	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.	
	sets.buff.ComposureOther = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head="Lethargy Chappel +3",
    body="Lethargy Sayon +3",
    hands="Atrophy Gloves +3",
    legs="Lethargy Fuseau +3",
    feet="Lethargy Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +4",legs="Lethargy Fuseau +3"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear1="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.Regen = {	
    main="Bolelabunga",
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands="Atrophy Gloves +3",
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}	
	sets.midcast.Temper = {
    main="Pukulatmuj +1",
    sub={ name="Forfend +1", augments={'Path: A',}},
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +4",
    feet="Leth. Houseaux +3",
    neck="Hoxne Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast.Phalanx = {
    main="Sakpata's Sword",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Chironic Hat", augments={'STR+5','MND+6','Phalanx +4','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+24','Attack+30','Phalanx +4','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
    hands={ name="Chironic Gloves", augments={'MND+2','Crit. hit damage +1%','Phalanx +4','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    legs={ name="Chironic Hose", augments={'MND+4','Mag. Acc.+6','Phalanx +4','Accuracy+19 Attack+19',}},
    feet={ name="Chironic Slippers", augments={'STR+9','Accuracy+4','Phalanx +4',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Phalanx II'] = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet="Lethargy Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast.Enspell = {
    main="Pukulatmuj +1",
    sub={ name="Forfend +1", augments={'Path: A',}},
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +4",
    feet="Leth. Houseaux +3",
    neck="Hoxne Torque",
    waist="Olympus Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Shock Spikes'] = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Viti. Tights +3", augments={'Enspell Damage','Accuracy',}},
    feet="Lethargy Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Blaze Spikes'] = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Viti. Tights +3", augments={'Enspell Damage','Accuracy',}},
    feet="Lethargy Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	sets.midcast['Ice Spikes'] = {
    main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','Mag. Acc.+10','DMG:+3',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +3",
    legs={ name="Viti. Tights +3", augments={'Enspell Damage','Accuracy',}},
    feet="Lethargy Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
-- Duration Enfeebs.

	sets.midcast['Bind'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Break = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Dia = {
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast.Inundation = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Silence = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Sleep = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Sleepga = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Sleep II'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Sleepga II'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
--Pure MAcc Enfeebs.

	sets.midcast.Dispel = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Dispelga = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast['Frazzle II'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
--Immunobreak Enfeebs. Blind needs Int. Everything else needs Mnd.

	sets.midcast['Addle II'] = {
    main="Daybreak",
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Blind II'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +10','MND+5','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
	sets.midcast.Gravity = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Gravity II'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Paralyze II'] = {
    main="Daybreak",
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +10','MND+5','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Slow II'] = {
    main="Daybreak",
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +10','MND+5','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
--Distract3 (610 Skill Cap), Frazzle3 (625 Skill Cap).

	sets.midcast['Distract III'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Frazzle III'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +10','MND+5','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
--Funky Sets.
	sets.midcast['Poison II'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Drain" and "Aspir" potency +10','MND+5','Mag. Acc.+14','"Mag.Atk.Bns."+14',}},
    feet={ name="Viti. Boots +4", augments={'Immunobreak Chance',}},
    neck="Hoxne Torque",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}	
	sets.midcast.Impact = { --Pure MAcc.
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    body="Twilight Cloak",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	sets.midcast.Impact.Occult = { --STP/OccultAcumen.
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
	head=empty,
    body="Twilight Cloak",
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+17','"Occult Acumen"+11',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'Attack+14','"Occult Acumen"+11','CHR+9','Mag. Acc.+2',}},
    neck="Anu Torque",
    waist="Oneiros Rope",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast.Bio = {
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Regal Cuffs",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Snotra Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Dark Magic'] = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head="Leth. Chappel +3",
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    sets.midcast['Absorb-TP'] = {
    ammo="Regal Gem",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
    sets.midcast.Drain = {
    ammo="Regal Gem",
    head="Pixie Hairpin +1",
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back="Null Shawl",
}
    sets.midcast.Aspir = {
    ammo="Regal Gem",
    head="Pixie Hairpin +1",
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+7','INT+1',}},
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back="Null Shawl",
}
	sets.midcast.Stun = {
    main={ name="Murgleis", augments={'Path: A',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Regal Gem",
    head="Leth. Chappel +3",
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
--Nuke sets. BIS Burst EA+1 body/legs.

    sets.midcast['Elemental Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
    sets.midcast['Elemental Magic'].Burst = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist={ name="Acuity Belt +1", augments={'Path: A',}},
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}
    sets.midcast['Elemental Magic'].Occult = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Merlinic Hood", augments={'"Occult Acumen"+11','MND+6',}},
    body={ name="Merlinic Jubbah", augments={'"Occult Acumen"+11','MND+2','Mag. Acc.+15','"Mag.Atk.Bns."+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+17','"Occult Acumen"+11',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'Attack+14','"Occult Acumen"+11','CHR+9','Mag. Acc.+2',}},
    neck="Anu Torque",
    waist="Oneiros Rope",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})	
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Burst, {})	
	sets.midcast['Elemental Magic'].HighTierNuke.Occult = set_combine(sets.midcast['Elemental Magic'].Occult, {})

	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {
    main="Chatoyant Staff",
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Sibyl Scarf",
    waist="Fucho-no-Obi",
    left_ear="Magnetic Earring",
    right_ear="Halasz Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
	-- Idle sets
	sets.idle = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Arete del Luna +1", augments={'Path: A',}},
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.idle.Refresh = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Sibyl Scarf",
    waist="Fucho-no-Obi",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.idle.Town = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Os. Escutcheon",
    ammo="Aurgelmir Orb +1",
    head="Ea Hat +1",
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands="Regal Cuffs",
    legs="Volte Tights",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Skrymir Cord +1",
    left_ear="Magnetic Earring",
    right_ear="Balder Earring",
    left_ring="Orvail Ring +1",
    right_ring="Chirich Ring +1",
    back="Moonlight Cape",
}
	sets.idle.Weak = {
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands="Lethargy Gantherots +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back="Moonlight Cape",
}	
	sets.idle.Weak.Refresh = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    body="Lethargy Sayon +3",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs={ name="Chironic Hose", augments={'MND+6','Pet: Attack+11 Pet: Rng.Atk.+11','"Refresh"+2','Accuracy+2 Attack+2','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck="Sibyl Scarf",
    waist="Fucho-no-Obi",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	-- Defense sets
	sets.defense.PDT = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
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
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
}	
	-- Single Wield Group.
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
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}	
	sets.engaged.Acc = {
	main="Naegling",
    sub="Ammurapi Shield",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
    -- Dual Wield Group.
	sets.engaged.DW = {
	main="Naegling",
	sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Coiste Bodhar",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
	back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	sets.engaged.DW.Acc = {
    main="Naegling",
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Malignance Tabard",
    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Ephramad's Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.engaged.DW.Odin = {
    main="Aern Dagger",
    sub="Aern Dagger II",
    ammo="Sroda Tathlum",
    head="Umuthi Hat",
    body="Lethargy Sayon +3",
    hands="Aya. Manopolas +2",
    legs="Malignance Tights",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Orpheus's Sash",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi",
    left_ring="Stikini Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +1','Enha.mag. skill +10','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
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

