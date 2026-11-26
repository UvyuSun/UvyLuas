-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('None','Naeg','Shiny','Mafic')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Crepuscular'}

    select_default_macro_book()
	
	send_command('wait 3; input /lockstyleset 1')
	-- Additional local binds

end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	sets.TreasureHunter = {
}
	-- Precast sets to enhance JAs

	sets.precast.JA.Jump = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +3",
    hands="Vis. Fng. Gaunt. +3",
    legs={ name="Clem. Haidate", augments={'Path: A',}},
    feet="Ostro Greaves",
    neck="Vim Torque +1",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.precast.JA['High Jump'] = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +3",
    hands="Vis. Fng. Gaunt. +3",
    legs={ name="Clem. Haidate", augments={'Path: A',}},
    feet="Ostro Greaves",
    neck="Vim Torque +1",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.precast.JA['Soul Jump'] = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +3",
    hands="Vis. Fng. Gaunt. +3",
    legs={ name="Clem. Haidate", augments={'Path: A',}},
    feet="Ostro Greaves",
    neck="Vim Torque +1",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.precast.JA['Spirit Jump'] = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Vishap Mail +3",
    hands="Vis. Fng. Gaunt. +3",
    legs={ name="Clem. Haidate", augments={'Path: A',}},
    feet="Ostro Greaves",
    neck="Vim Torque +1",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.precast.JA['Ancient Circle'] = {} --legs="Vishap Brais"
	sets.precast.JA.Angon = {ammo="Angon",hands="Ptero. Fin. G. +3"} 
	sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +3"}
	sets.precast.JA['Deep Breathing'] = {} --hands="Ptero. Armet +1"
	sets.precast.JA['Spirit Link'] = {hands="Pel. Vambraces +3",feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},} --head="Vishap Armet +1"
	sets.precast.JA['Spirit Surge'] = {body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},}
	sets.precast.JA['Steady Wing'] = {}
	sets.precast.JA['Super Jump'] = {}
	
	-- Breath sets
	sets.HealingBreath = {
    head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
    waist="Glassblower's Belt",
}
	sets.precast.JA['Restoring Breath'] = {
    head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
    waist="Glassblower's Belt",
}
	sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
	sets.SmitingBreath = {back="Brigantia's Mantle"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Adamantite Armor",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Enif Cosciales",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Flume Belt +1",
    left_ear="Loquac. Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Rahab Ring",
    right_ring="Lebeche Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {
	ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Adamantite Armor",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Enif Cosciales",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Orunmila's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Loquac. Earring",
    right_ear="Sanare Earring",
    left_ring="Rahab Ring",
    right_ring="Lebeche Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})--head="Vishap Armet +1"
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Ptero. Fin. G. +4", augments={'Enhances "Angon" effect',}},
    legs="Vishap Brais +4",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear={ name="Alabaster Earring", augments={'Path: A',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})



	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
    ammo="Aurgelmir Orb +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Twilight Mail"})
	sets.idle.Weak.Pet = {}		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {
    ammo="Aurgelmir Orb +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	sets.defense.MDT = {
    ammo="Aurgelmir Orb +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}	
	sets.defense.MEVA = {
    ammo="Aurgelmir Orb +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Warder's Charm",
    waist="Carrier's Sash",
    left_ear="Arete del Luna +1",
    right_ear="Hearty Earring",
    left_ring="Archon Ring",
    right_ring="Shadow Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Crepuscular Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
    sets.passive.Crepuscular = {head="Crepuscular Helm", body="Twilight Mail"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {left_ear="Sherida Earring",right_ear={ name="Alabaster Earring", augments={'Path: A',}},}
	
	-- Normal melee group

	sets.engaged = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Clemen. Hara.",
    hands="Nyame Gauntlets",
    legs="Clem. Haidate",
    feet="Flam. Gambieras +2",
    neck="Vim Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Sherida Earring",
    right_ear="Alabaster Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}
	sets.engaged.Acc = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Pel. Vambraces +3",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Null Loop",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}

--	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.Naeg = {main="Naegling",sub="Regis",}
	sets.weapons.Mafic = {main="Mafic Cudgel",sub="Regis",}
	sets.weapons.Shiny = {main="Shining One",sub="Utu Grip"}
end

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