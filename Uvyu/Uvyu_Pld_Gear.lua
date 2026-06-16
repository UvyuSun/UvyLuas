function user_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options()
    state.WeaponskillMode:options('Normal','Acc')
    state.CastingMode:options('Normal')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options()
    state.MagicalDefenseMode:options()
	state.ResistDefenseMode:options()
	state.IdleMode:options('Normal','Aminon')
	state.Weapons:options('None','BurtAegis','BurtDuban','BurtSriv','ExcalAegis','ExcalDuban','ExcalSriv','Fencer','Phalanx')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}

	-- Additional local binds
	send_command('bind @` gs c cycle RuneElement')
	send_command('wait 3; input /lockstyleset 2')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	
	sets.TreasureHunter = {
    body="Volte Jupon",
    feet="Volte Boots",
    waist="Chaac Belt",
}
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.BurtAegis = {main="Burtgang",sub="Aegis"}
	sets.weapons.BurtDuban = {main="Burtgang",sub="Duban"}
	sets.weapons.BurtSriv = {main="Burtgang",sub="Srivatsa"}
	sets.weapons.ExcalAegis = {main="Excalibur",sub="Aegis"}
	sets.weapons.ExcalDuban = {main="Excalibur",sub="Duban"}
	sets.weapons.ExcalSriv = {main="Excalibur",sub="Srivatsa"}
	sets.weapons.Fencer = {main="Naegling",sub="Blurred Shield +1",}
	sets.weapons.Phalanx = {main="Sakpata's Sword",sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},}

                                                                                                               --Burt=23
    sets.Enmity = {                                                                                        --Srivatsa=15
    ammo="Sapience Orb",                                                                                            --2
    head="Loess Barbuta +1",                                                                                        --19~24
    body="Chev. Cuirass +3",                                                                                        --16
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},    --9
    legs="Cab. Breeches +3",                                                                                        --9
    feet="Chev. Sabatons +3",                                                                                       --15
    neck="Moonlight Necklace",                                                                                      --15
    waist="Plat. Mog. Belt",                                                                                        --0 
    left_ear="Trux Earring",                                                                                        --5
    right_ear="Cryptic Earring",                                                                                    --4
    left_ring="Apeile Ring",                                                                                        --5~9
    right_ring="Apeile Ring +1",                                                                                    --5~9 
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},   --10
}                                                                                                                   --TotalInGear = 114
	                                                                                                                --TotalInAll+Unity+Crusade = 195
    sets.Enmity.SIRD = {
    ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    -- Precast sets to enhance JAs

    sets.precast.JA['Chivalry'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +3"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {})                                   --head="Rev. Coronet +1",body="Cab. Surcoat +3"
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +3"})	
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{})                                   --body="Cab. Surcoat +3"
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{})	                          --feet="Rev. Leggings +3"
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +3"})
	sets.precast.JA['Majesty'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Caballarius Coronet +3",}) 
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +3"})
	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +3"})	
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Valiance'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{})

    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Chivalry'].DT = set_combine(sets.Enmity, {hands="Cab. Gauntlets +3"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity, {})                                   --head="Rev. Coronet +1",body="Cab. Surcoat +3"
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity,{feet="Chev. Sabatons +3"})	
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity,{})                                   --body="Cab. Surcoat +3"
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity,{})	                          --feet="Rev. Leggings +3"
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity, {})
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity,{legs="Cab. Breeches +3"})
	sets.precast.JA['Majesty'].DT = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity, {})
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity,{})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity,{head="Caballarius Coronet +3",}) 
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity,{feet="Cab. Leggings +3"})
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity, {hands="Cab. Gauntlets +3"})	
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity,{})
    sets.precast.JA['Valiance'].DT = set_combine(sets.Enmity,{})
    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity,{})

    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity, {})
    sets.precast.JA['Lunge'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back="Moonlight Cape",
}

	sets.precast.JA['Swipe'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back="Moonlight Cape",
}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    sets.precast.Waltz['Healing Waltz'] = {}	
    
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Rev. Surcoat +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Enif Cosciales",
    feet="Chev. Sabatons +3",
    neck="Orunmila's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Rudianos's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}},
}                                                                                                                                       -- =76

    sets.precast.FC['Enhancing Magic'] = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Rev. Surcoat +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Enif Cosciales",
    feet="Chev. Sabatons +3",
    neck="Orunmila's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Rudianos's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}},
}
	
	sets.precast.FC.Cure = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Rev. Surcoat +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Enif Cosciales",
    feet="Chev. Sabatons +3",
    neck="Orunmila's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Rudianos's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}},
}
  
	sets.precast.FC['Geist Wall'] = {
    ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Hoxne Earring",
    right_ear="Thrud Earring", 
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}

    sets.precast.WS.Acc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget"})
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Aeolian Edge'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus Sash",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
	sets.precast.WS['Knights Of Round'] = {
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Telos Earring",
    right_ear="Alabaster Earring",
    left_ring="Regal Ring",
    right_ring="Ephramad's Ring",
    back="Null Shawl",
}
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Flat Blade'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Sanguine Blade'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus Sash",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Atonement'] = {
    ammo="Sapience Orb",
    head={ name="Loess Barbuta +1", augments={'Path: A',}},
    body="Chev. Cuirass +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Cab. Breeches +3", augments={'Enhances "Invincible" effect',}},
    feet="Chev. Sabatons +3",
    neck="Moonlight Necklace",
    waist="Creed Baudrier",
    left_ear="Trux Earring",
    right_ear="Friomisi Earring",
    left_ring="Apeile Ring",
    right_ring={ name="Apeile Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.precast.WS['Aeolian Edge'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus Sash",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']

    sets.precast.WS.Acc = {}	
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Flat Blade'].Acc = {}
	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Crepuscular Earring",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity, {})
    sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.SIRD = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Ninjutsu'] = set_combine(sets.Enmity.SIRD, {})


    sets.midcast.Utsusemi = {	
	ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.midcast.Cure = {
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Sacro Gorget",
    waist="Audumbla Sash",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Moonlight Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
}
    sets.midcast.Cure.SIRD = {
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Sroda Belt",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Moonlight Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}	
	sets.Self_Healing = {
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Sacro Gorget",
    waist="Audumbla Sash",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Moonlight Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
}
    sets.midcast.Raise = {
    ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.midcast.Reprisal = {
    ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}

    sets.midcast.Enlight = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}

    sets.midcast['Enlight II'] = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}

    sets.midcast.Crusade = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}

    sets.midcast.Stoneskin = {
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Siegel Sash",
    left_ear="Earthcry Earring",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
}

    sets.midcast.Blink = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}

    sets.midcast.Aquaveil = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}
    sets.midcast.Banish = {
    ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.midcast['Banish II'] = {
    ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.midcast.Banishga = {
    ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
    sets.midcast['Healing Magic'] = {
    ammo="Brigantia Pebble",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Adamantite Armor",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Blood Boon"+3','Spell interruption rate down -10%','"Store TP"+2','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.midcast['Enhancing Magic'] = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast['Regen'] = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}
	sets.midcast.BarElement = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}		
	sets.midcast.BarStatus = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'"Cure" potency +8%','Pet: DEX+3','Damage taken-3%','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}
	sets.midcast.Phalanx = {
    ammo="Staunch Tathlum +1",
    head={ name="Valorous Mask", augments={'Accuracy+14 Attack+14','AGI+9','Phalanx +5','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    body={ name="Valorous Mail", augments={'Enmity+2','Pet: "Subtle Blow"+3','Phalanx +4',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs="Sakpata's Cuisses",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Weard Mantle", augments={'VIT+2','DEX+1','Enmity+2','Phalanx +5',}},
}
	sets.Phalanx_Received ={
    ammo="Staunch Tathlum +1",
    head={ name="Valorous Mask", augments={'Accuracy+14 Attack+14','AGI+9','Phalanx +5','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    body={ name="Valorous Mail", augments={'Enmity+2','Pet: "Subtle Blow"+3','Phalanx +4',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Weard Mantle", augments={'VIT+2','DEX+1','Enmity+2','Phalanx +5',}},
}
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    -- Idle sets
    sets.idle = {
    main="Burtgang",
    sub="Srivatsa",
    ammo="Brigantia Pebble",
    head="Sakpata's Helm",
    body="Adamantite Armor",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Fortified Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
   sets.idle.Town = {
    main={ name="Burtgang", augments={'Path: A',}},
    sub="Os. Escutcheon",
    ammo="Aurgelmir Orb +1",
    head="Crepuscular Helm",
    body="Crepuscular Mail",
    hands="Regal Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Skrymir Cord +1",
    left_ear="Balder Earring",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Moonlight Ring",
    right_ring="Chirich Ring +1",
    back="Moonlight Cape",
}
	sets.idle.Aminon = {
    ammo="Vanir Battery",
    head="Nyame Helm",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Plat. Mog. Belt",
    left_ear="Sanare Earring",
    right_ear="Eabani Earring",
    left_ring="Lunette Ring +1",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}},
}
		
    sets.idle.Weak = {
    ammo="Brigantia Pebble",
    head="Sakpata's Helm",
    body="Adamantite Armor",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Fortified Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.Twilight = {head="Crepuscular Helm", body="Crepuscular Mail"}
	sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	--------------------------------------
    
    sets.defense.HP = {
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Rev. Surcoat +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Tuisto Earring",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonlight Cape",
}

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Null Loop",
    waist="Sailfi Belt +1",
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
    sets.engaged.Acc = {
    ammo="Vanir Battery",
    head="Nyame Helm",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Plat. Mog. Belt",
    left_ear="Sanare Earring",
    right_ear="Eabani Earring",
    left_ring="Lunette Ring +1",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}},
}
    sets.engaged.DW = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}
    sets.engaged.DW.Acc = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Cessance Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','DEF+50',}},
}		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(3, 8)
    elseif player.sub_job == 'RUN' then
        set_macro_page(3, 8)
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 8)
    elseif player.sub_job == 'BLU' then
        set_macro_page(3, 27)
    elseif player.sub_job == 'SCH' then
        set_macro_page(3, 36)
    else
        set_macro_page(3, 8) --War/Etc
    end
end