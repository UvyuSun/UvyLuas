-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','DT')
    state.IdleMode:options('Normal','PDT','TPEat')
	state.PhysicalDefenseMode:options()
	state.MagicalDefenseMode:options()
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

		-- Additional local binds


    select_default_macro_book(3)
	send_command('wait 3; input /lockstyleset 19')

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Beryllium Mace",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Beryllium Mace",sub="Beryllium Mace"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells ~71 FC & 10 Quick Magic
    sets.precast.FC = {
    ammo="Sapience Orb",                                                                                                        --2
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                          --10
    body="Inyanga Jubbah +2",                                                                                                   --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},    --7
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                              --7
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --4
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Embla Sash",                                                                                                         --5
    left_ear="Malignance Earring +1",                                                                                           --2
    right_ear="Loquac. Earring",                                                                                                --2
    left_ring="Rahab Ring",                                                                                                     --2
    right_ring="Kishar Ring",                                                                                                   --4
    back={ name="Alaunus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},    --10
}	                                                                                                                            --Total FC% 79
    sets.precast.FC.DT = {
    main={ name="Grioavolr", augments={'"Fast Cast"+7','Mag. Acc.+6','"Mag.Atk.Bns."+27',}},                                    --11
    sub="Clerisy Strap +1",                                                                                                     --3
    ammo="Staunch Tathlum +1",                                                                                                  --0  --DT3
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                          --10
    body="Inyanga Jubbah +2",                                                                                                   --14 --DT10
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},    --7  --PDT4
    legs={ name="Nyame Flanchard", augments={'Path: B',}},                                                                      --0  --DT8
    feet={ name="Nyame Sollerets", augments={'Path: B',}},                                                                      --0  --DT7
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Embla Sash",                                                                                                         --5
    left_ear="Malignance Earring +1",                                                                                           --4
    right_ear="Loquac. Earring",                                                                                                --2
    left_ring="Defending Ring",                                                                                                 --0  --DT10
    right_ring="Kishar Ring",                                                                                                   --4
    back={ name="Alaunus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},    --10  --PDT10
}                                                                                                                               --Total FC80 DT38 PDT14 
                                                                                                                                
    sets.precast.FC.Insta = {
    main="Grioavolr",                                                                                                           --11
    sub="Clerisy Strap +1",                                                                                                     --3 
    ammo="Sapience Orb",                                                                                                        --2
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                          --10
    body="Inyanga Jubbah +2",                                                                                                   --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},    --7
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                              --7
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --4
    neck="Orunmila's Torque",                                                                                                   --5
    waist="Witful Belt",                                                                                                        --3    --3OQS
    left_ear="Loquac. Earring",                                                                                                 --2
    right_ear="Malignance Earring",                                                                                             --4
    left_ring="Kishar Ring",                                                                                                    --4
    right_ring="Lebeche Ring",                                                                                                         --2OQS
    back="Perimede Cape",                                                                                                              --4OQS
}

    sets.precast.FC.Insta.DT = {--Same
    main="Grioavolr",                                                                                                           --11
    sub="Clerisy Strap +1",                                                                                                     --3 
    ammo="Sapience Orb",                                                                                                        --2
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                          --10
    body="Inyanga Jubbah +2",                                                                                                   --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},    --7
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                              --7
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --4
    neck="Orunmila's Torque",                                                                                                   --5
    waist="Witful Belt",                                                                                                        --3    --3OQS
    left_ear="Loquac. Earring",                                                                                                 --2
    right_ear="Malignance Earring",                                                                                             --4
    left_ring="Kishar Ring",                                                                                                    --4
    right_ring="Lebeche Ring",                                                                                                         --2OQS
    back="Perimede Cape",                                                                                                              --4OQS
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Seigel Sash",})
    sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.precast.FC.Stoneskin.DT = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Healing Magic'].DT = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
    sets.precast.FC.StatusRemoval.DT = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = sets.precast.FC['Healing Magic']
    sets.precast.FC.Cure.DT = sets.precast.FC['Healing Magic']

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CuragaDT = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure
	sets.precast.FC.CureSolace.DT = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Impact.DT =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	sets.precast.FC.Dispelga.DT = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
		
    sets.precast.WS.Dagan = {}
		
	sets.MaxTP = {}
	sets.MaxTP.Dagan = {}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Crier's Gaiters",}
    sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
    hands={ name="Chironic Gloves", augments={'"Store TP"+2','"Occult Acumen"+11','"Treasure Hunter"+1',}},
    feet={ name="Chironic Slippers", augments={'DEX+5','"Dbl.Atk."+1','"Treasure Hunter"+2','Accuracy+12 Attack+12',}},
    waist="Chaac Belt",
})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash",}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {
    ammo="Pemphredo Tathlum",
    head="Vanya Hood",
    body="Kaykaus Bliaut +1",
    hands="Kaykaus Cuffs +1",
    legs="Vanya Slops",
    feet="Kaykaus Boots +1",
    neck="Incanter's Torque",
    waist="Luminary Sash",
    left_ear="Magnetic Earring",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}

    -- Fast Recast ~Total Haste + Fast Cast~
	
    sets.midcast.FastRecast = {
    ammo="Sapience Orb",                                                                                                        --2
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                          --10
    body="Inyanga Jubbah +2",                                                                                                   --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},    --7
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                              --7
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --4
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Embla Sash",                                                                                                         --5
    left_ear="Malignance Earring +1",                                                                                           --2
    right_ear="Loquac. Earring",                                                                                                --2
    left_ring="Rahab Ring",                                                                                                     --2
    right_ring="Kishar Ring",                                                                                                   --4
    back={ name="Alaunus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},    --10
}	                                                                                                                            --Total FC% 79
    sets.midcast.FastRecast.DT = {--Same
    ammo="Sapience Orb",                                                                                                        --2
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                          --10
    body="Inyanga Jubbah +2",                                                                                                   --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},    --7
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                              --7
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --4
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Embla Sash",                                                                                                         --5
    left_ear="Malignance Earring +1",                                                                                           --2
    right_ear="Loquac. Earring",                                                                                                --2
    left_ring="Rahab Ring",                                                                                                     --2
    right_ring="Kishar Ring",                                                                                                   --4
    back={ name="Alaunus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},    --10
}	                                                                                                                            --Total FC% 79
		
    -- Cure sets  --------------  All Cure/Curaga/Light/Day sets will be identical in their perspective range.

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {----------------------------------------------------------------------------------------------------   --POT 
    main="Daybreak",                                                                                                            --30  
    sub="Genmei Shield",                                                                                                        --0   
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    body="Theo. Bliaut +2",                                                                                                     --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck="Incanter's Torque",                                                                                                   --0
    waist="Goading Belt",                                                                                                       --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Stikini Ring +1",                                                                                                --0
    right_ring="Stikini Ring +1",                                                                                               --0
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},             --0  
}                                                                                                                               --50+7--PDT20

	sets.midcast.Cure.DT = {-------------------------------------------------------------------------------------------------   --POT --PDT/DT
    main="Daybreak",                                                                                                            --30
    sub="Genmei Shield",                                                                                                        --0   --10
    ammo="Staunch Tathlum +1",                                                                                                  --    --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --7
    legs="Ebers Pant. +1",                                                                                                      --0 
    feet={ name="Nyame Sollerets", augments={'Path: B',}},                                                                      --0   --7
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10 
    waist="Goading Belt",                                                                                                       --0   
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},             --0   --10
}                                                                                                                               --55+2--50+ Mostly for Defense.
		
	sets.midcast.CureSolace = {----------------------------------------------------------------------------------------------   --POT 
    main="Daybreak",                                                                                                            --30  
    sub="Genmei Shield",                                                                                                        --0    
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    body="Theo. Bliaut +2",                                                                                                     --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck="Incanter's Torque",                                                                                                   --0
    waist="Goading Belt",                                                                                                       --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Stikini Ring +1",                                                                                                --0
    right_ring="Stikini Ring +1",                                                                                               --0
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},             --0  
}                                                                                                                               --50+7--PDT20

	sets.midcast.CureSolace.DT = {-------------------------------------------------------------------------------------------   --POT --PDT/DT
    main="Daybreak",                                                                                                            --30
    sub="Genmei Shield",                                                                                                        --0   --10
    ammo="Staunch Tathlum +1",                                                                                                  --    --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --7
    legs="Ebers Pant. +1",                                                                                                      --0 
    feet={ name="Nyame Sollerets", augments={'Path: B',}},                                                                      --0   --7
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10 
    waist="Goading Belt",                                                                                                       --0   
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},             --0   --10
}                                                                                                                               --55+2--50+ Mostly for Defense.

	sets.midcast.LightWeatherCure = {----------------------------------------------------------------------------------------   --POT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap",                                                                                                           --0
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    hands="Theophany Mitts +2",                                                                                                 --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Lebeche Ring",                                                                                                   --3
    right_ring="Stikini Ring +1",                                                                                               --0
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --51+4

	sets.midcast.LightWeatherCure.DT = {-------------------------------------------------------------------------------------   --POT --PDT/DT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap", --Khonsu FTW                                                                                              --0
    ammo="Staunch Tathlum +1",                                                                                                  --0   --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --10
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3    
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --52+2--50DT --Slightly Squishy.

	sets.midcast.LightWeatherCureSolace = {----------------------------------------------------------------------------------   --POT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap",                                                                                                           --0
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    hands="Theophany Mitts +2",                                                                                                 --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Lebeche Ring",                                                                                                   --3
    right_ring="Stikini Ring +1",                                                                                               --0
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --51+4

	sets.midcast.LightWeatherCureSolace.DT = {-------------------------------------------------------------------------------   --POT --PDT/DT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap", --Khonsu FTW                                                                                              --0
    ammo="Staunch Tathlum +1",                                                                                                  --0   --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --10
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3    
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --52+2--50DT --Slightly Squishy.
		
	sets.midcast.LightDayCureSolace = {--------------------------------------------------------------------------------------   --POT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap",                                                                                                           --0
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    hands="Theophany Mitts +2",                                                                                                 --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Lebeche Ring",                                                                                                   --3
    right_ring="Stikini Ring +1",                                                                                               --0
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --51+4

	sets.midcast.LightDayCureSolace.DT = {----------------------------------------------------------------------------------   --POT --PDT/DT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap", --Khonsu FTW                                                                                              --0
    ammo="Staunch Tathlum +1",                                                                                                  --0   --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --10
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3    
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --52+2--50DT --Slightly Squishy.

	sets.midcast.LightDayCure = {--------------------------------------------------------------------------------------------   --POT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap",                                                                                                           --0
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    hands="Theophany Mitts +2",                                                                                                 --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Lebeche Ring",                                                                                                   --3
    right_ring="Stikini Ring +1",                                                                                               --0
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --Total 51+4

	sets.midcast.LightDayCure.DT = {-----------------------------------------------------------------------------------------   --POT --PDT/DT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap", --Khonsu FTW                                                                                              --0
    ammo="Staunch Tathlum +1",                                                                                                  --0   --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --10
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3    
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --52+2--50DT --Slightly Squishy.

	sets.midcast.Curaga = {--------------------------------------------------------------------------------------------------   --POT 
    main="Daybreak",                                                                                                            --30  
    sub="Genmei Shield",                                                                                                        --0   
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    body="Theo. Bliaut +2",                                                                                                     --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck="Incanter's Torque",                                                                                                   --0
    waist="Goading Belt",                                                                                                       --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Stikini Ring +1",                                                                                                --0
    right_ring="Stikini Ring +1",                                                                                               --0
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},             --0  
}                                                                                                                               --50+7--PDT20

	sets.midcast.Curaga.DT = {-----------------------------------------------------------------------------------------------   --POT --PDT/DT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap", --Khonsu FTW                                                                                              --0
    ammo="Staunch Tathlum +1",                                                                                                  --0   --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --10
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3    
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --52+2--50DT --Slightly Squishy.
		
	sets.midcast.LightWeatherCuraga = {--------------------------------------------------------------------------------------   --POT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap",                                                                                                           --0
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    body="Theo. Bliaut +2",                                                                                                     --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Lebeche Ring",                                                                                                   --3
    right_ring="Stikini Ring +1",                                                                                               --0
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},             --0
}                                                                                                                               --50+7 

	sets.midcast.LightWeatherCuraga.DT = {-----------------------------------------------------------------------------------   --POT --PDT/DT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap", --Khonsu FTW                                                                                              --0
    ammo="Staunch Tathlum +1",                                                                                                  --0   --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --10
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3    
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --52+2--50DT --Slightly Squishy.
		
	sets.midcast.LightDayCuraga = {------------------------------------------------------------------------------------------   --POT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap",                                                                                                           --0
    ammo="Pemphredo Tathlum",                                                                                                   --0
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                               --11
    body="Theo. Bliaut +2",                                                                                                     --3II
    hands="Theophany Mitts +2",                                                                                                 --2II
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Meili Earring",                                                                                                  --0
    left_ring="Lebeche Ring",                                                                                                   --3
    right_ring="Stikini Ring +1",                                                                                               --0
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},             --0
}                                                                                                                               --50+7

	sets.midcast.LightDayCuraga.DT = {---------------------------------------------------------------------------------------   --POT --PDT/DT
    main="Chatoyant Staff",                                                                                                     --10
    sub="Enki Strap", --Khonsu FTW                                                                                              --0
    ammo="Staunch Tathlum +1",                                                                                                  --0   --3
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                           --0   --7
    body="Bunzi's Robe",                                                                                                        --15  --10
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                     --0   --10
    legs="Ebers Pant. +1",                                                                                                      --0
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},                           --17
    neck={ name="Clr. Torque +2", augments={'Path: A',}},                                                                       --10
    waist="Hachirin-no-Obi",                                                                                                    --0
    left_ear="Glorious Earring",                                                                                                --2II
    right_ear="Odnowa Earring +1",                                                                                              --0   --3    
    left_ring="Defending Ring",                                                                                                 --0   --10
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                             --0   --7
    back="Twilight Cape",                                                                                                       --0
}                                                                                                                               --52+2--50DT --Slightly Squishy.	
	
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {}
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})

	sets.midcast.Cursna = {
    main="Yagrush",
    sub="Genmei Shield",
    ammo="Sapience Orb",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaut +1",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Theo. Pant. +1",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Debilis Medallion",
    waist="Bishop's Sash",
    left_ear="Magnetic Earring",
    right_ear="Meili Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back={ name="Alaunus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	sets.midcast.StatusRemoval = {
    main="Yagrush",
    sub="Genmei Shield",
    ammo="Impatiens",
    head="Ebers Cap +1",
    body="Theo. Briault +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','"Cure" spellcasting time -4%',}},
    legs="Ebers Pantaloons +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Veneficium Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+7','Enmity-10','Damage taken-5%',}},
}
		
	sets.midcast.Erase = {
    main="Yagrush",
    sub="Genmei Shield",
    ammo="Impatiens",
    head="Ebers Cap +1",
    body="Theo. Briault +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','"Cure" spellcasting time -4%',}},
    legs="Ebers Pantaloons +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Veneficium Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+7','Enmity-10','Damage taken-5%',}},
}

    -- Enhancing Magic capped @ 500 with near-max duration 
	sets.midcast['Enhancing Magic'] = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','VIT+2','"Mag.Atk.Bns."+1',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {hands="Ebers Duckbills +1",})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
	main="Vadose Rod",
	sub="Genmei Shield",
	head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
	hands="Regal Cuffs",
	waist="Emphatikos Rope",
	legs="Shedir Seraweels",
	})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
    main="Bolelabunga",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Inyanga Tiara +2",
    body={ name="Piety Bliaut +1", augments={'Enhances "Benediction" effect',}},
    hands="Ebers Mitts +1",
    legs="Theo. Pant. +1",
    feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"}) --feet="Piety Duckbills +1"
	
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
    main="Beneficus",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +1",
    body="Ebers Bliaut +1",
    hands="Ebers Mitts +1",
    legs="Ebers Pant. +1",
    feet="Ebers Duckbills +1",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Mimir Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
})

	sets.midcast.Impact = {}
		
	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast['Divine Magic'] = {}
		
	sets.midcast.Holy = {}

	sets.midcast['Dark Magic'] = {}

    sets.midcast.Drain = {}

    sets.midcast.Drain.Resistant = {}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {}

	sets.midcast.Stun.Resistant = {}
		
	sets.midcast.Dispel = {}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {}) --main="Daybreak",sub="Ammurapi Shield" 

	sets.midcast['Enfeebling Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Theo. Cap +1",
    body="Theo. Bliaut +1",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+9','Accuracy+3 Attack+3','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    feet="Theo. Duckbills +1",
    neck="Erra Pendant",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}

	sets.midcast['Enfeebling Magic'].Resistant = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Theo. Cap +1",
    body="Theo. Bliaut +1",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+25','"Mag.Atk.Bns."+9','Accuracy+3 Attack+3','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
    feet="Theo. Duckbills +1",
    neck="Erra Pendant",
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
}
		
	sets.midcast.Dia = sets.midcast['Enfeebling Magic']
	sets.midcast.Diaga = sets.midcast['Enfeebling Magic']
	sets.midcast['Dia II'] = sets.midcast['Enfeebling Magic']
	sets.midcast.Bio = sets.midcast['Enfeebling Magic']
	sets.midcast['Bio II'] = sets.midcast['Enfeebling Magic']

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {
    main="Chatoyant Staff",
    sub="Oneiros Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Fucho-no-Obi",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Oneiros Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}

	sets.idle.PDT = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs="Assid. Pants +1",
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}
		
    sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.idle.Weak = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Oneiros Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}

	sets.idle.Weak.Refresh = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Oneiros Grip",
    ammo="Homiliary",
    head={ name="Chironic Hat", augments={'"Store TP"+2','Pet: INT+4','"Refresh"+2','Accuracy+9 Attack+9','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Chironic Gloves", augments={'"Snapshot"+3','"Drain" and "Aspir" potency +7','"Refresh"+2','Accuracy+10 Attack+10','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    legs="Assid. Pants +1",
    feet={ name="Chironic Slippers", augments={'Pet: STR+6','Accuracy+7','"Refresh"+2',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}

    -- Defense sets

	sets.defense.PDT = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Oneiros Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}

    sets.defense.MEVA = {
    main={ name="Mpaca's Staff", augments={'Path: A',}},
    sub="Oneiros Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Shadow Ring",
    right_ring="Archon Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Phys. dmg. taken-10%',}},
}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
    ammo="Vanir Battery",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Goading Belt",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}

    sets.engaged.Acc = {
    ammo="Vanir Battery",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Goading Belt",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	sets.engaged.DW = {
    ammo="Vanir Battery",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Goading Belt",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}

    sets.engaged.DW.Acc = {
    ammo="Vanir Battery",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist="Goading Belt",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Orison Mitts +1"} --back="Mending Cape"

    sets.buff['Devotion'] = {} --head="Piety Cap +3"

	sets.HPDown = {}

	sets.HPCure = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genmei Shield",
    ammo="Pemphredo Tathlum",
    head="Blistering Sallet +1",
    body="Gyve Doublet",
    hands="Inyan. Dastanas +2",
    legs="Ebers Pantaloons +1",
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="K'ayres Ring",
    right_ring="Ayanmo Ring",
    back="Solemnity Cape",
}

	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace"})

end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end