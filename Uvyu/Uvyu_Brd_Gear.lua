function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Twash','Carn','Staff')
	state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Normal','PDL','Aminon')
    state.CastingMode:options('Normal','Enmity','AoE')
    state.IdleMode:options('Normal','Aminon','Refresh')
	state.Weapons:options('None','DualWeapons','DualWeapons2','DualWeapons3','DualWeapons5')
	-- Whether to use Carn (or song daggers in general) under a certain threshhold even when weapons are locked.
	state.CarnMode = M{'Never','Always','300','1000'}


	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('wait 3; input /lockstyleset 8')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.None = {main="Carnwenhan",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Carnwenhan",sub="Crep. Knife"}
	sets.weapons.DualWeapons2 = {main="Naegling",sub="Fusetto +3"}
	sets.weapons.DualWeapons3 = {main="Twashtar",sub="Fusetto +3"}
	sets.weapons.DualWeapons5 = {main="Xoanon",sub="Ultio Grip"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	sets.TreasureHunter = {
    body="Volte Jupon",
    feet="Volte Boots",
    waist="Chaac Belt",
}

    sets.precast.Item['Icarus Wing'] = {}	
	sets.HPDown = {
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ashera Harness",
    hands="Volte Mittens",
    legs="Volte Tights",
    feet="Volte Spats",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Goading Belt",
    left_ear="Crep. Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
    range={ name="Linos", augments={'Mag. Acc.+20','"Fast Cast"+6','MP+20',}},                                                               --6
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                                       --10
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},                            --8
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                                           --7
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquacious Earring",                                                                                                           --2
    right_ear="Alabaster Earring",                                                                                                           --0
    left_ring="Moonlight Ring",                                                                                                              --0
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                                          --0
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},--10
}                                                                                                                                            --Total FC 80%
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})
	
	sets.precast.FC.BardSong = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10
	sets.precast.FC.BardSong.Enmity = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10
	sets.precast.FC.SongDebuff = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10 
	sets.precast.FC.SongDebuff.Resistant = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10 
	sets.precast.FC.Lullaby = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10
	sets.precast.FC.Lullaby.Resistant = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10 
	sets.precast.FC['Horde Lullaby'] = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10
	sets.precast.FC['Horde Lullaby'].Resistant = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                           --Total SCT-81% QC10                                                                                                                                              --Total SCT-80% QC10 
	sets.precast.FC['Horde Lullaby'].AoE = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10                                                                                                                                           
	sets.precast.FC['Horde Lullaby II'] = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10 
	sets.precast.FC['Horde Lullaby II'].Resistant = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10 
	sets.precast.FC['Horde Lullaby II'].AoE = {
    range={ name="Linos", augments={'Mag. Evasion+15','Occ. quickens spellcasting +4%',}},                                                   --0   --QC4
    head="Fili Calot +3",                                                                                                                    --16
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                 --12
    legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Song spellcasting time -5%',}},                  --10
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquac. Earring",                                                                                                              --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Kishar Ring",                                                                                                                 --4%
    right_ring="Lebeche Ring",                                                                                                               --0%  --QC2
    back="Perimede Cape",                                                                                                                    --0%  --QC4
}                                                                                                                                            --Total SCT-81% QC10 		
	sets.precast.FC.Mazurka = {
    range={ name="Linos", augments={'Mag. Acc.+20','"Fast Cast"+6','MP+20',}},                                                               --6
    head={ name="Bunzi's Hat", augments={'Path: A',}},                                                                                       --10
    body="Inyanga Jubbah +2",                                                                                                                --14
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},                            --8
    legs={ name="Kaykaus Tights +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},                                                           --7
    feet="Fili Cothurnes +3",                                                                                                                --13
    neck="Orunmila's Torque",                                                                                                                --5
    waist="Embla Sash",                                                                                                                      --5
    left_ear="Loquacious Earring",                                                                                                           --2
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},                                                                            --0
    left_ring="Moonlight Ring",                                                                                                              --0
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},                                                                          --0
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},--10
}                                                                                                                                            --Total FC 80%
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Aria of Passion'] = set_combine(sets.precast.FC.BardSong,{range="Loughnashade"})
	
	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	-- Precast sets to enhance JAs
	
    sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +4"}
	
    sets.precast.JA['Soul Voice'] = {
	head={ name="Ebur Beret", augments={'Path: C',}},
    body={ name="Ebur Frock", augments={'Path: C',}},
	hands={ name="Ebur Mitts", augments={'Path: C',}},
	legs="Bihu Cannions +3",
    feet={ name="Ebur Clogs", augments={'Path: C',}},
}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
	
	sets.precast.JA['Pianissimo'] = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head="Halitus Helm",
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Goading Belt",
    left_ear="Friomisi Earring",
    right_ear="Trux Earring",
    left_ring="Supershear Ring",
    right_ring="Defending Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bihu Justaucorps +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}                                                                                                                                               --PDT46%
    sets.precast.WS['Savage Blade'] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bihu Justaucorps +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",	
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
    sets.precast.WS['Savage Blade'].PDL = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Bunzi's Robe", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},  
}  
    sets.precast.WS['Savage Blade'].Aminon = { 
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bihu Justaucorps +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back="Null Shawl",
}                                                                                                                                           --PDT46%
    sets.precast.WS['Aeolian Edge'] = {
    range={ name="Linos", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Metamorph Ring +1",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}                                                                                                                                               --PDT48%
    sets.precast.WS['Mordant Rime'] = {
    range={ name="Linos", augments={'Attack+20','Weapon skill damage +3%','CHR+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bihu Justaucorps +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Ishvara Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
} 
    sets.precast.WS['Mordant Rime'].Aminon = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bihu Justaucorps +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Ephramad's Ring",
    back="Null Shawl",
}
    sets.precast.WS["Rudra's Storm"] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Bihu Justaucorps +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}                                                                                                                                               --PDT48%
    sets.precast.WS['Evisceration'] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},                                         --Crit 3% Dex8
    head={ name="Nyame Helm", augments={'Path: B',}},                                                                                           --Blistering Sallet +1
    body="Bihu Justaucorps +4",                                                             --
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},                                                                                     --
    legs={ name="Nyame Flanchard", augments={'Path: B',}},                                                                                      --Jokushu Haidate/Zoar Subligar
    feet={ name="Nyame Sollerets", augments={'Path: B',}},                                                                                      --Lustratio
    neck="Fotia Gorget",                                                                                                                        --
    waist="Fotia Belt",                                                                                                                         --
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},                                                             --
    right_ear="Brutal Earring",                                                                                                                 --Mache Earring +1
    left_ring="Epaminondas's Ring",                                                                                                             --Ilabrat Ring
    right_ring="Ephramad's Ring",                                                                                                               --Begrudging Ring
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},        --Dex/Crit 10%
}    
    sets.precast.WS['Retribution'] = {
    range={ name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}                                                                                                                                               --PDT46%     
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands="Bewegt Cuffs",
    legs="Fili Rhingrave +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}
	-- Gear to enhance certain classes of songs

--	sets.midcast['Horde Lullaby'] = {
--    ammo="Sapience Orb",
--    head="Halitus Helm",
--    body="Emet Harness +1",
--    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
--    legs={ name="Zoar Subligar +1", augments={'Path: A',}},
--    feet="Ghadhab Nails",
--    neck="Unmoving Collar",
--    waist="Goading Belt",
--    left_ear="Friomisi Earring",
--    right_ear="Trux Earring",
--    left_ring="Eihwaz Ring",
--    right_ring="Supershear Ring",
--    back="Reiki Cloak",
--}
	sets.midcast['Foe Lullaby'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Foe Lullaby II'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Horde Lullaby'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
     waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Horde Lullaby'].Enmity = {
    range="Blurred Harp +1",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Zoar Subligar +1",
    feet="Fili Cothurnes +3",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Goading Belt",
    left_ear="Trux Earring",
    right_ear="Friomisi Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back="Reiki Cloak",
}
	sets.midcast['Horde Lullaby'].AoE = {
    range="Daurdabla",
    head="Brioso Roundlet +4",
    body="Brioso Justau. +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Harfner's Sash",
    left_ear="Gersemi Earring",
    right_ear="Darkside Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Horde Lullaby II'] = {
    range="Blurred Harp +1",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Horde Lullaby II'].Enmity = {
    range="Blurred Harp +1",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Zoar Subligar +1",
    feet="Fili Cothurnes +3",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Goading Belt",
    left_ear="Trux Earring",
    right_ear="Friomisi Earring",
    left_ring="Eihwaz Ring",
    right_ring="Supershear Ring",
    back="Reiki Cloak",
}
	sets.midcast['Horde Lullaby II'].AoE = {
    range="Daurdabla",
    head="Brioso Roundlet +4",
    body="Brioso Justau. +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Harfner's Sash",
    left_ear="Gersemi Earring",
    right_ear="Darkside Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Aria of Passion'] = {Range="Loughnashade",}
	sets.midcast.Ballad = {legs="Fili Rhingrave +3"}
	sets.midcast.Carol = {hands="Mousai Gages +1",}
	sets.midcast.Etude = {head="Mousai Turban +1",}
	sets.midcast['Foe Requiem VII'] = 	{}	 
	sets.midcast["Goddess's Hymnus"] = {range="Daurdabla"} 
	sets.midcast.Madrigal = {head="Fili Calot +3"}
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mambo = {feet="Mousai crackows +1"}
	sets.midcast.March = {hands="Fili Manchettes +3"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas",hands="Fili Manchettes +3"})
	sets.midcast.Mazurka = {range="Daurdabla"}
	sets.midcast.Minne = {legs="Mousai Seraweels +1"}
	sets.midcast.Minuet = {body="Fili Hongreline +3"}
	sets.midcast.Paeon = {head="Brioso Roundlet +3",}
	sets.midcast['Carnage Elegy'] = {
    range="Gjallarhorn",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Pining Nocturne'] = {
    range="Gjallarhorn",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast['Utsusemi'] = {
    range={ name="Linos", augments={'DEF+15','"Fast Cast"+6','MP+20',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Inyanga Jubbah +2",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Fili Cothurnes +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
} 	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Flume Belt +1",
    left_ear="Eabani Earring",
    right_ear="Halasz Earring",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
}		
	sets.midcast.SongEffect.DW = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
	} --Only weapons in this set. This set is overlayed onto SongEffect

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
    range="Gjallarhorn",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck="Mnbw Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}	
	sets.midcast.SongDebuff.DW = {}	--Only weapons in this set. This set is overlayed onto  SongDebuff}
	--Only weapons in this set. This set is overlayed onto  SongDebuff

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {
    range="Gjallarhorn",
    head="Brioso Roundlet +4",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck="Mnbw. Whistle +1",
    waist="Null Belt",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

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
	sets.Phalanx_Received = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head={ name="Chironic Hat", augments={'STR+5','MND+6','Phalanx +4','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
    body={ name="Chironic Doublet", augments={'"Mag.Atk.Bns."+24','Attack+30','Phalanx +4','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
    hands={ name="Chironic Gloves", augments={'MND+2','Crit. hit damage +1%','Phalanx +4','Accuracy+18 Attack+18','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    legs={ name="Chironic Hose", augments={'MND+4','Mag. Acc.+6','Phalanx +4','Accuracy+19 Attack+19',}},
    feet={ name="Chironic Slippers", augments={'STR+9','Accuracy+4','Phalanx +4',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear={ name="Alabaster Earring", augments={'Path: A',}},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back="Moonlight Cape",
}

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
	-- Resting sets
	sets.resting = {
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
	sets.idle = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Arete Del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
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
    sub="Os. Escutcheon",
    range="Blurred Harp +1",
    head="Mousai Turban +1",
    body="Mou. Manteel +1",
    hands="Mousai Gages +1",
    legs="Mou. Seraweels +1",
    feet="Mou. Crackows +1",
    neck="Mnbw. Whistle +1",
    waist="Skrymir Cord +1",
    left_ear="Regal Earring",
    right_ear="Balder Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.idle.Weak = {
    range={ name="Linos", augments={'Mag. Evasion+15','"Regen"+2','VIT+8',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Arete Del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Intarabus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
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
	
	-- Defense sets

--	sets.defense.PDT = {
--    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
--    head={ name="Bunzi's Hat", augments={'Path: A',}},
--    body="Ashera Harness",
--    hands={ name="Gazu Bracelets +1", augments={'Path: A',}},
--    legs="Fili Rhingrave +3",
--    feet={ name="Nyame Sollerets", augments={'Path: B',}},
--    neck={ name="Bard's Charm +2", augments={'Path: A',}},
--    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
--    left_ear="Telos Earring",
--    right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
--    left_ring="Chirich Ring +1",
--    right_ring="Ephramad's Ring",
--    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
--}

	sets.defense.MDT = {}

	sets.Kiting = {feet="Fili Cothurnes +3"}
--	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	
	sets.engaged = {	          --Non DW sub Naegling.
    main="Naegling",
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ashera Harness",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Volte Tights",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.Twash = {         --Non DW Sub Twashtar.                                                                                                            --
    main={ name="Twashtar", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+15 Attack+15','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ashera Harness",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Volte Tights",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.Carn = {	       --Non DW Sub Carnwenhan.                                                                                                         --
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ashera Harness",
    hands="Volte Mittens",
    legs="Volte Tights",
    feet="Volte Spats",
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
--    left_ring="Moonlight Ring",  
--    right_ring="Moonlight Ring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
	sets.engaged.Staff = {         --Non DW Sub Staff.                                                                                                            --
    main="Xoanon",
    sub="Ultio Grip",
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.DW = {	           --Naegling. 
    main="Naegling",
    sub={ name="Fusetto +3", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ashera Harness",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Volte Tights",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.DW.Twash = {	       --Twash.                                                                                                           --
    main={ name="Twashtar", augments={'Path: A',}},
    sub={ name="Fusetto +3", augments={'TP Bonus +1000',}},
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ashera Harness",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Volte Tights",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Eabani Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.DW.Carn = {	     --Carnwenhan. 69STP, 17%quad-att.                                                                                                    --
    main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Crepuscular Knife",
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ashera Harness",
    hands="Volte Mittens", --Nyame to not get one-tapped. Bunzi option, but AM3.
    legs="Volte Tights",   --Need these in set to cap haste.
    feet="Volte Spats",    --Nyame to not get one-tapped.
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
--    left_ring="Moonlight Ring",
--    right_ring="Moonlight Ring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
}

	sets.engaged.DW.Staff = {                                                                                                        --
    main="Xoanon",
    sub="Ultio Grip",
    range={ name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
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