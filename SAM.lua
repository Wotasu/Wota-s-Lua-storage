-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- lockstyle
function user_setup()

end
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Retaliation = buffactive.Retaliation or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.PhysicalDefenseMode:options('PDT', 'Reraise')

	send_command('wait 5; input /lockstyleset 20')
    select_default_macro_book(17)
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA["Meditate"] = {head="Wakido kabuto +1",hands="Sakonji kote +1",back="Smertrios's Mantle"}
    sets.precast.JA["Sekkanoki"] = {body="",feet="",back=""}
    sets.precast.JA["Hasso"] = {hands="Wakido kote +3",legs="Unkai Haidate +1"}
    sets.precast.JA["Meikyo Shisui"] = {head="",body=""}
    sets.precast.JA["Third Eye"] = {legs="Sao. Haidate +2"}
    sets.precast.JA["Konzen-ittai"] = {legs="Unkai Haidate +1"}
    sets.precast.JA["Tomahawk"] = {feet=""}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {legs="Dashing Subligar"}
	

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Knobkierrie",
	head={ name="Valorous Mask", augments={'Accuracy+9','Weapon skill damage +4%','STR+15',}},
    body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +3%','STR+11','Accuracy+15','Attack+5',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Weapon skill damage +4%','STR+10','Accuracy+9',}},
    neck="Sam. Nodowa +1",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    }
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS["Tachi: Ageha"] = {
    ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+9','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS["Tachi: Shoha"] = {
    ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +3%','STR+11','Accuracy+15','Attack+5',}},
    legs="Wakido Haidate +3",
    feet="Flam. Gambieras +2",
    neck="Sam. Nodowa +1",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
    
	sets.precast.WS["Tachi: Jinpu"] = {
    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+9','Weapon skill damage +4%','STR+15',}},
    body={ name="Found. Breastplate", augments={'Accuracy+9','Mag. Acc.+8','"Mag.Atk.Bns."+12',}},
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs="Wakido Haidate +3",
    feet={ name="Founder's Greaves", augments={'VIT+10','Accuracy+15','"Mag.Atk.Bns."+15','Mag. Evasion+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	-- Midcast Sets
    sets.midcast.FastRecast = {}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {
    ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
    hands="Wakido Kote +3",
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Accuracy+12 Attack+12','"Dbl.Atk."+5','AGI+6','Accuracy+11','Attack+13',}},
    neck="Moonbeam Nodowa",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Shneddick Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+9','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
	
    sets.idle.Field = {
        ammo="Staunch Tathlum",
    head="Ynglinga Sallet",
    body="Wakido Domaru +3",
    hands={ name="Sakonji Kote +1", augments={'Enhances "Blade Bash" effect',}},
    legs="Arjuna Breeches",
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+9','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
    sets.idle.Weak = {
        head="Twilight Helm",neck="Wiglen Gorget",
        body="Twilight Mail",ring1="Sheltered Ring",ring2="Paguroidea Ring", feet="Hermes' sandals",
        back="Shadow Mantle",waist="Flume Belt"}
    
    -- Defense sets
    sets.defense.PDT = {
        ammo="Staunch Tathlum",
    ammo="Staunch Tathlum",
    head="Ynglinga Sallet",
    body="Wakido Domaru +3",
    hands="Kurys Gloves",
    legs="Arjuna Breeches",
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Loricate Torque +1",
	waist="Windbuffet Belt +1",
    left_ear="Genmei Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+9','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		}

    sets.defense.Reraise = {
        head="Twilight Helm",neck="Wiglen Gorget",
        body="Twilight Mail",ring1="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt"}

    sets.defense.MDT = {
        head="Yaoyotl Helm",neck="Wiglen Gorget",
        ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt"}

    sets.Kiting = {}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Ken. Samue",
    hands="Wakido Kote +3",
    legs="Ken. Hakama",
    feet={ name="Valorous Greaves", augments={'Accuracy+12 Attack+12','"Dbl.Atk."+5','AGI+6','Accuracy+11','Attack+13',}},
    neck="Sam. Nodowa +1",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+9','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
    sets.engaged.Acc = {
        ammo="Ginsen",
		head="Flam. Zucchetto +2",
    body="Wakido Domaru +3",
    hands="Wakido Kote +3",
    legs="Wakido Haidate +3",
    feet="Flam. Gambieras +2",
    neck="Sam. Nodowa +1",
    waist="Ioskeha Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+9','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
    sets.engaged.PDT = {
	ammo="Staunch Tathlum",
    head="Ynglinga Sallet",
    body="Wakido Domaru +3",
    hands={ name="Sakonji Kote +1", augments={'Enhances "Blade Bash" effect',}},
    legs="Arjuna Breeches",
    feet={ name="Amm Greaves", augments={'HP+50','VIT+10','Accuracy+15','Damage taken-2%',}},
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+9','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
    sets.engaged.Acc.PDT = {}
    sets.engaged.Reraise = {head="Twilight Helm",body="Twilight Mail"}
    sets.engaged.Acc.Reraise = {head="Twilight Helm",body="Twilight Mail"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Effectively lock these items in place.
    if state.HybridMode.value == 'Reraise' or
        (state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
        equip(sets.Reraise)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)

end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 17)
end
