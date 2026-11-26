function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','Sbtl')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','PDT','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('None','SwdShld','Chango','ClubShld','ShiningOne')

	-- Additional local binds

	
	select_default_macro_book()
	send_command('wait 3; input /lockstyleset 7')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

	-- Weapons sets
	sets.weapons.Chango = {main={ name="Chango", augments={'Path: A',}},sub="Utu Grip",}   
	sets.weapons.ClubShld = {main={ name="Loxotic Mace +1", augments={'Path: A',}},sub="Blurred Shield +1",}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip",}
	sets.weapons.SwdShld = {main="Naegling",sub="Blurred Shield +1",}
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	sets.Knockback = {}
	sets.passive.Twilight = {head="Crepuscular Helm",body="Crepuscular Mail"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {body="Pumm. Lorica +3",feet={ name="Agoge Calligae +3", augments={'Enhances "Tomahawk" effect',}},back="Cichol's Mantle"}
	sets.precast.JA['Warcry'] = {head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},}
	sets.precast.JA['Defender'] = {hands={ name="Agoge Mufflers +3", augments={'Enhances "Mighty Strikes" effect',}},}
	sets.precast.JA['Aggressor'] = {body={ name="Agoge Lorica +3", augments={'Enhances "Aggressive Aim" effect',}},}                --head="Pumm. Mask +3",
	sets.precast.JA['Mighty Strikes'] = {hands={ name="Agoge Mufflers +3", augments={'Enhances "Mighty Strikes" effect',}},}
	sets.precast.JA["Warrior's Charge"] = {legs={ name="Agoge Cuisses +3", augments={'Enhances "Warrior\'s Charge" effect',}},}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk",feet={ name="Agoge Calligae +3", augments={'Enhances "Tomahawk" effect',}}}
	sets.precast.JA['Retaliation'] = {feet="Boii Calligae +1",hands="Pummeler's Mufflers +1",}
	sets.precast.JA['Restraint'] = {hands="Boii Mufflers +1",}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +2",}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
                   
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +4", augments={'Enhances "Savagery" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Savage Blade'] = {
    ammo="Knobkierrie",
    head={ name="Agoge Mask +4", augments={'Enhances "Savagery" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}


    sets.precast.WS['Upheaval'] = {
    ammo="Knobkierrie",
    ammo="Knobkierrie",
    head={ name="Agoge Mask +4", augments={'Enhances "Savagery" effect',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring +1",
    back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring"}

     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Idle sets
	sets.idle = {
    ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.idle.Weak = {
    ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
	
	-- Defense sets
	sets.defense.PDT = {
    ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.defense.MDT = {
    ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.defense.MEVA = {
    ammo="Staunch Tathlum +1",
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Murky Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

	sets.Kiting = {feet="Hermes' Sandals +1",}
	sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Vim Torque +1"}
     
            -- Engaged sets
	sets.engaged = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Hjarrandi Helm",
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Pumm. Cuisses +4",
    feet="Pumm. Calligae +4",
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	sets.engaged.Acc = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear={ name="Boii Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 VIT+7',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}

	sets.engaged.Sbtl = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Boii Mask +3",
    body="Dagon Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="War. Beads +2", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear={ name="Schere Earring", augments={'Path: A',}},
    right_ear={ name="Boii Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Crit.hit rate+6','STR+7 VIT+7',}},
    left_ring="Niqmaddu Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}

end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(5, 1)
    elseif player.sub_job == 'DNC' then
        set_macro_page(5, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(5, 1)
    else
        set_macro_page(5, 1)
    end
end