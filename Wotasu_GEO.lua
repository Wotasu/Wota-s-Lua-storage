-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
    state.CapacityMode = M(false, 'Capacity Point Mantle')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.Buff.Poison = buffactive['Poison'] or false

    state.OffenseMode:options('None', 'Normal', 'Melee','Skillup')
    state.CastingMode:options('Normal','MagicBurst', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Melee')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"

    geo_sub_weapons = S{"Nehushtan", "Bolelabunga"}

    select_default_macro_book()
    send_command('bind != gs c toggle CapacityMode')
	
	send_command('wait 5;input /lockstyleset 80 ')
end

function file_unload()
    send_command('unbind !=')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga', 
        'Stonera', 'Watera', 'Aerora', 'Fira', 'Blizzara', 'Thundara',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
    --------------------------------------
    -- Precast sets
    --------------------------------------
	
  
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life Cycle'] = {head="Azimuth Hood +1",body="Geomancy Tunic",back="Nantosuelta's Cape"}
    sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}

    sets.CapacityMantle  = { back="Aptitude Mantle" }


    -- Fast cast sets for spells

    sets.precast.FC = {
        main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+1','"Fast Cast"+5','Mag. Acc.+4',}},
    body="Zendik Robe",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','CHR+4','Mag. Acc.+11','"Mag.Atk.Bns."+9',}},
    legs="Geo. Pants +1",
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','DEX+1','Mag. Acc.+4',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}},
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        sub="Sors Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+1','"Fast Cast"+5','Mag. Acc.+4',}},
    body="Shango Robe",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','CHR+4','Mag. Acc.+11','"Mag.Atk.Bns."+9',}},
    legs="Geo. Pants +1",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}},
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+1','"Fast Cast"+5','Mag. Acc.+4',}},
    body="Zendik Robe",
    hands={ name="Merlinic Dastanas", augments={'"Fast Cast"+6','CHR+4','Mag. Acc.+11','"Mag.Atk.Bns."+9',}},
    legs="Geo. Pants +1",
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','DEX+1','Mag. Acc.+4',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}},
    })
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], { 
		
	})
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Merlinic Hood",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Ischemia Chasuble",
		hands="Amalric Gages",
        ring1="Rajas Ring",
        ring2="Apate Ring",
        back="Buquwik Cape",
        waist="Windbuffet Belt +1",
		legs="Psycloth Lappas",
		feet="Battlecast Gaiters"
    }

    sets.precast.WS['Exudation'] = {
        head="Merlinic Hood",
        neck="Asperity Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Ischemia Chasuble",
		hands="Amalric Gages",
        ring1="Shiva Ring +1",
        ring2="Apate Ring",
        back="Buquwik Cape",
        waist="Windbuffet Belt +1",
		legs="Merlinic Shalwar",
		feet="Battlecast Gaiters"
	}
    sets.precast.WS['Flash Nova'] = {
        --sub=""Willpower Grip"",
        ammo="Dosis Tathlum",
        head="Merlinic Hood",
        neck="Sanctity Necklace",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body="Count's Garb",
        hands="Amalric Gages",
        ring1="Acumen Ring",
        ring2="Shiva Ring +1",
        back="Nantosuelta's Cape",
        waist="Eschan Stone",
        legs="Merlinic Shalwar",
        feet="Merlinic Crackows"
    }
	
	sets.precast.WS['Shattersoul'] = {
        ammo="Dosis Tathlum",
        head="Merlinic Hood",
        neck="Eddy Necklace",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body="Artsieq Jubbah",
        hands="Amalric Gages",
        ring1="Acumen Ring",
        ring2="Shiva Ring +1",
        back="Nantosuelta's Cape",
        waist="Channeler's Stone",
        legs="Merlinic Shalwar",
        feet="Merlinic Crackows"
		
	}

	sets.precast.WS['Cataclysm'] = sets.precast.WS['Flash Nova']
	
    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Zendik Robe",
		hands="Geo. Mitaines +1",
		legs={ name="Bagua Pants", augments={'Enhances "Mending Halation" effect',}},
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7','DEX+1','Mag. Acc.+4',}},
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Gifted Earring",
		right_ear="Calamitous Earring",
		left_ring="Prolix Ring",
		right_ring="Kuchekula Ring",
		back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}},
    }
    
     sets.midcast["Apururu (UC)"] = set_combine(sets.midcast.Trust, {
         --body="Apururu Unity shirt",
     })

    sets.midcast.Geomancy = {
		main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vedic Coat",
    hands="Shrieker's Cuffs",
    legs={ name="Vanya Slops", augments={'MP+49','"Cure" potency +7%','Enmity-5',}},
    feet={ name="Merlinic Crackows", augments={'"Conserve MP"+6','CHR+10','"Mag.Atk.Bns."+8',}},
    neck="Bagua Charm +1",
    waist="Austerity Belt",
    left_ear="Calamitous Earring",
    right_ear="Gifted Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}},
    }

    sets.midcast.Geomancy.Indi = {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Vedic Coat",
		hands="Geo. Mitaines +2",
		legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
		feet="Azimuth Gaiters +1",
		neck="Incanter's Torque",
		waist="Austerity Belt",
		left_ear="Gifted Earring",
		right_ear="Calamitous Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}},
}
   

    sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {
		main="Idris",
    sub="Sors Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body={ name="Amalric Doublet", augments={'MP+60','"Mag.Atk.Bns."+20','"Fast Cast"+3',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','"Regen" potency+3',}},
    legs="Gyve Trousers",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Calamitous Earring",
    right_ear="Gifted Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}},
    })
    
    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
		waist="Austerity Belt"
	})

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

	sets.midcast.Cursna = {head="Vanya Hood",neck="Malison Medallion",ring1="Haoma's Ring",ring2="Ephedra Ring",back="Tempered cape +1"}

	sets.midcast['Healing Magic'] = {
		head="Vanya Hood",
		back="Tempered cape +1",
		ring1="Haoma's Ring",
		ring2="Ephedra Ring"
	}
	
    sets.midcast.HighTierNuke = {
        main="Idris",
    sub="Ammurapi Shield",
    head="Jhakri Coronal +2",
    body="Seidr Cotehardie",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Barkaro. Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }
    
	sets.midcast.HighTierNuke.MagicBurst = set_combine(sets.midcast.HighTierNuke, {
		main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+30','Magic burst dmg.+10%','AGI+10',}},
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+30','INT+8','Mag. Acc.+13',}},
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+10%','INT+3',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+9%','"Mag.Atk.Bns."+9',}},
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Barkaro. Earring",
    left_ring="Mujin Band",
    right_ring="Shiva Ring",
	
	})
	
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
        main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Jhakri Coronal +2",
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+30','INT+8','Mag. Acc.+13',}},
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Barkaro. Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Stikini Ring",
    })
	
	sets.midcast.Impact = {
		main="Mindmelter",
		sub="Niobid Strap",
		ammo="Dosis Tathlum",
        head=empty,
		neck="Eddy Necklace",
		ear1="Hecate's Earring",
		ear2="Crematio Earring",
        body="Twilight Cloak",
		hands="Amalric Gages",
		ring1="Archon Ring",
		ring2="Strendu Ring",
        back=gear.Nanto_Nuking,
		waist="Aswang Sash",
		legs="Hagondes Pants",
		feet="Merlinic Crackows"
	}
    --sets.midcast['Elemental Magic'].Mindmelter = set_combine(sets.midcast.HighTierNuke, {
    --    main="Mindmelter"
    --})

    sets.precast.JA['Concentric Pulse'] = sets.midcast.HightTierNuke

    sets.midcast.LowTierNuke = set_combine(sets.midcast.HighTierNuke, {
    main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Mallquis Chapeau +1",
    body="Mallquis Saio +2",
    hands="Mallquis Cuffs +1",
    legs="Mallquis Trews +1",
    feet="Mallquis Clogs +1",
    neck="Baetyl Pendant",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    })
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
     main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Mallquis Chapeau +1",
    body="Mallquis Saio +2",
    hands="Mallquis Cuffs +1",
    legs="Mallquis Trews +1",
    feet="Mallquis Clogs +1",
    neck="Baetyl Pendant",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    })

    sets.midcast.Macc = { 
		 main="Idris",
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Mallquis Chapeau +2",
    body="Mallquis Saio +2",
    hands="Mallquis Cuffs +2",
    legs="Mallquis Trews +2",
    feet="Mallquis Clogs +2",
    neck="Baetyl Pendant",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    }
    
    sets.midcast.Aspir = set_combine(sets.midcast.Macc, {
        head="Bagua Galero +1",
        --neck="Dark Torque",
		waist="Fucho-no-obi",
        --ear1="Gwati Earring",
        --ear2="Hirudinea Earring",
        --ring1="Evanescence Ring",
        --ring2="Excelsis Ring",
        body="Geomancy Tunic +1",
        legs="Azimuth Tights +1",
		feet="Merlinic Crackows"
    })
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = sets.midcast.Macc
    
	
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.Macc, {
        main={ name="Gada", augments={'"Fast Cast"+5','MND+7','Mag. Acc.+19','"Mag.Atk.Bns."+9',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body="Zendik Robe",
    hands="Regal Cuffs",
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet="Skaoi Boots",
    neck="Bagua Charm +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Kishar Ring",
	back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +20',}}, 
    })
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.Macc, {
        --waist="Casso Sash",
		neck="Imbodla Necklace",
		hands="Azimuth Gloves",
		body="Vanya Robe",
        back=gear.Nanto_Nuking,
		waist="Channeler's Stone",
        ring1="Icesoul Ring",
        ring2="Vertigo Ring",
        feet="Merlinic Crackows"
    })
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+3','Mag. Acc.+13','DMG:+5',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Elemental Siphon"+25','Enh. Mag. eff. dur. +9',}},
    legs={ name="Telchine Braconi", augments={'Accuracy+14 Attack+14','"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Barkaro. Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
	})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'],{back=""})
	
	sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'], {back=""})
	
	sets.midcast.Flurry = set_combine(sets.midcast['Enhancing Magic'], {back=""})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{head=""})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{neck="Nodens Gorget",waist="Siegel Sash"})

	sets.midcast.regen = {main="Bolelabunga"}
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
		ammo="Clarus Stone",
		main="Boonwell Staff",
		head=empty,
        neck="Wiglen Gorget",
		ear1="Infused Earring",
        body="Respite Cloak",
        hands="Bagua Mitaines +1",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        waist="Austerity Belt",
		back=gear.Nanto_Regen,
        legs="Assiduity Pants +1",
		feet="Chelona Boots"
    }


    -- Idle sets
    sets.idle = {
        main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Volte Beret",
    body="Jhakri Robe +2",
    hands="Geo. Mitaines +2",
    legs="Assid. Pants +1",
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    neck="Bagua Charm +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

    sets.idle.PDT = set_combine(sets.idle, {
         main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body="Mallquis Saio +2",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    neck="Bagua Charm +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Pet: "Regen"+10','Pet: "Regen"+5',}},
    })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
		 main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    legs={ name="Telchine Braconi", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    neck="Bagua Charm +1",
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Pet: "Regen"+10','Pet: "Regen"+5',}},
    })

    sets.idle.PDT.Pet = set_combine(sets.idle.Pet, {
		 main="Idris",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Azimuth Hood +1",
    body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    legs={ name="Telchine Braconi", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    neck="Bagua Charm +1",
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Pet: "Regen"+10','Pet: "Regen"+5',}},
    })

    sets.idle.Melee = set_combine(sets.idle, {
		range="Dunna"
        --main="Malevolence",
        --sub="Bolelabunga"
    })

    sets.idle.Town = set_combine(sets.idle, {
         main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Volte Beret",
    body="Jhakri Robe +2",
    hands="Geo. Mitaines +2",
    legs="Assid. Pants +1",
    feet="Skaoi Boots",
    neck="Bagua Charm +1",
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Hearty Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+5','Pet: "Regen"+10','Pet: "Regen"+5',}},
    })

    sets.idle.Weak = sets.idle

    -- Defense sets

    sets.defense.PDT = {
		main="Idris",
		sub="Genbu's Shield",	
        range="Dunna",
        head="Merlinic Hood",
        neck="Wiglen Gorget",
        ear1="Ethereal Earring",
		ear2="Sanare Earring",
        body="Artsieq Jubbah",
        hands="Bagua Mitaines +1",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Repulse Mantle",
		waist="Fucho-no-obi",
		legs="Merlinic Shalwar",
        feet="Merlinic Crackows"
    }

    sets.defense.MDT = {
		main="Idris",
		sub="Genbu's Shield",	
        range="Dunna",
        head="Amalric Coif",
        neck="Wiglen Gorget",
        ear1="Ethereal Earring",
		ear2="Sanare Earring",
        body="Artsieq Jubbah",
        hands="Bagua Mitaines +1",
        ring1="Sheltered Ring",
        ring2="Paguroidea Ring",
        back="Repulse Mantle",
		waist="Fucho-no-obi",
		legs="Psycloth Lappas",
        feet="Merlinic Crackows"
    }

    sets.Kiting = {feet="Geomancy Sandals"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        --range="Dunna",
		ammo="Amar Cluster",
		head="Nahtirah Hat",
        neck="Clotharius Torque",
        ear1="Dudgeon Earring",
        ear2="Heartseeker Earring",
        --body="Azimuth Coat +1",
        --body="Vanir Cotehardie",
		body="Ischemia Chasuble",
        hands="Bagua Mitaines +1",
        ring1="Rajas Ring",
        ring2="Apate Ring",
        back=gear.Nanto_Regen,
        waist="Cetl Belt",
        legs="Assiduity Pants +1",
        feet="Battlecast Gaiters"
    }
    sets.engaged.Melee = set_combine(sets.engaged, {
        --main="Mindmelter",
    })
    sets.engaged.Skillup = set_combine(sets.engaged, {
        head="Temachtiani Headband",
		body="Temachtiani Shirt",
		hands="Temachtiani Gloves",
		legs="Temachtiani Pants",
		feet="Temachtiani Boots"
    })	
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
    --if state.Buff.Poison then
    --    classes.CustomClass = 'Mindmelter'
    --end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    -- Make sure abilities using head gear don't swap 
	if spell.type:lower() == 'weaponskill' then
        -- CP mantle must be worn when a mob dies, so make sure it's equipped for WS.
        if state.CapacityMode.value then
            equip(sets.CapacityMantle)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
--function job_status_change(newStatus, oldStatus, eventArgs)
--    if newStatus == 'Engaged' then
--        -- nothing yet
--        elseif newStatus == 'Idle' then
--            determine_idle_group()
--    end
--end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Melee' then
            disable('main','sub')
        else
            enable('main','sub')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
            if lowTierNukes:contains(spell.english) then
                return 'LowTierNuke'
            else
                return 'HighTierNuke'
            end
        elseif spell.type == 'Trust' then
            return 'Trust'

        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.CapacityMode.value then
        idleSet = set_combine(idleSet, sets.CapacityMantle)
    end
    if state.OffenseMode.value == 'Melee' then
        idleSet = set_combine(sets.idle, sets.idle.Melee)
    end
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    return meleeSet
end
-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 12)
end