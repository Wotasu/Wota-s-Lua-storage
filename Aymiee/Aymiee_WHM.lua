-- IdleMode determines the set used after casting. You change it with "/console gs c <IdleMode>"
-- The modes are:
-- Auto: Uses "Refresh" below 50%, "DT" at 50-70%, and "MEva" above 70%.
-- Refresh: Uses the most refresh available.
-- MEva: Uses magic evasion build.
-- DT: Uses PDT and DT.
-- TP: TP build for meleeing.
-- KC: Seperate TP build used for Kraken Club (less double attack)

-- Additional Commands:
-- "/console gs c AccMode" will toggle high-accuracy mode for melee.
-- "/console gs c ResistStun/ResistPara/ResistSilence" enables specific idle pieces to resist ailments.
--		Note: Resist ailment gear works best in combination with the magic evasion IdleMode.

-- Additional Bindings:
-- F9 - Toggles between a subset of IdleModes (Refresh > MEva > DT)
-- F10 - Toggles MeleeMode (When enabled, changes idle mode to TP and disables main & sub slots from swapping)

function file_unload()
	send_command('unbind f9')
	send_command('unbind f10')
end

function get_sets()
	send_command('bind f9 gs c ToggleMEva')
	send_command('bind f10 gs c MeleeMode')

	StartLockStyle = '66'
	IdleMode = 'Auto'
	MeleeMode = false
	AccMode = false
	ResistStun = false
	ResistPara = false
	ResistSilence = false

	-- ===================================================================================================================
	--		Sets
	-- ===================================================================================================================

	sets.precast = {}

	-- Main fast cast set
	sets.precast.FC = {
		main={ name="Gada", augments={'"Fast Cast"+4','MND+1','Mag. Acc.+20','DMG:+11',}},
    sub="Sors Shield",
    ammo="Incantor Stone",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Ayanmo Cosciales +2",
    feet="Regal Pumps",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}

	-- Fast cast for enhancing spells
	sets.precast.FC_Enhancing = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})

	-- Fast cast for cure spells
	sets.precast.FC_Cure = set_combine(sets.precast.FC, {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Incantor Stone",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Ebers Pant. +1",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Mendi. Earring",
    right_ear="Nourish. Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	})

	-- Fast cast for ailment spells (Divine Benison works well here)
	sets.precast.FC_Ailment = set_combine(sets.precast.FC, {
	main={ name="Gada", augments={'"Fast Cast"+4','MND+1','Mag. Acc.+20','DMG:+11',}},
    sub="Sors Shield",
    ammo="Incantor Stone",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Ebers Pant. +1",
    feet="Regal Pumps",
    neck="Orison Locket",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Ephedra Ring",
    right_ring="Kishar Ring",
	back={ name="Alaunus's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	})

	-- Yes, I have a blood pact timer set on WHM...
	sets.precast.BP = {
		head={ name="Helios Band", augments={'Pet: Mag. Acc.+29','"Blood Pact" ability delay -5','Summoning magic skill +8',}},
		legs={ name="Helios Spats", augments={'Pet: Mag. Acc.+25','"Blood Pact" ability delay -5','Summoning magic skill +6',}},
		feet={ name="Helios Boots", augments={'Pet: Mag. Acc.+29','"Blood Pact" ability delay -5','Summoning magic skill +8',}}
	}

    sets.midcast = {}

	-- Cure potency build. I pretty much just assume Aurorastorm is up. 
	sets.midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Plumose Sachet",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Bokwus Gloves",
    legs="Ebers Pant. +1",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque",
    waist="Witful Belt",
    left_ear="Mendi. Earring",
    right_ear="Nourish. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kuchekula Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}

	-- Afflatus Solace doesn't work on Curaga so there are some changes here.
	sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Incantor Stone",
     head="Ebers Cap +1",
    body="Theo. Briault +3",
    hands="Bokwus Gloves",
    legs="Ebers Pant. +1",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque",
    waist="Witful Belt",
    left_ear="Mendi. Earring",
    right_ear="Nourish. Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	})

	-- Enhancing set with 500 skill
	sets.midcast.Enhancing = {
		main="Beneficus",
    sub="Sors Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Ebers Mitts +1",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Ebers Duckbills +1",
    neck="Melic Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Nourish. Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
    back={ name="Mending Cape", augments={'Healing magic skill +7','Enha.mag. skill +8','Mag. Acc.+6',}},

	}
	
	-- Max enhancing duration set, for when skill doesn't matter.
	sets.midcast.EnhancingDuration = set_combine(sets.midcast.Enhancing, {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+3','Mag. Acc.+13','DMG:+5',}},
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +7',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +8',}},
	})

	-- Make sure this set has 500 skill as well.
	sets.midcast.Barspell = set_combine(sets.midcast.Enhancing, {
		main="Beneficus",
    sub="Sors Shield",
    ammo="Incantor Stone",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Ebers Mitts +1",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Ebers Duckbills +1",
    neck="Melic Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Nourish. Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
    back="Mending Cape",	
	})

	sets.midcast.Regen = {
		main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Impatiens",
    head="Inyanga Tiara +2",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands="Ebers Mitts +1",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'"Fast Cast"+2','Enh. Mag. eff. dur. +8',}},
	}

	sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
		head="Chironic Hat",
		--legs="Shedir Seraweels"
	})

	sets.midcast.Enfeebling = {
		main={ name="Gada", augments={'"Fast Cast"+4','MND+1','Mag. Acc.+20','DMG:+11',}},
    sub="Thuellaic Ecu +1",
    ammo="Kalboron Stone",
    head="Theophany Cap +2",
    body="Theo. Briault +3",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Cure" spellcasting time -6%','CHR+5','Mag. Acc.+15',}},
    feet="Theo. Duckbills +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Stikini Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	
	sets.midcast.Divine = {
		main={ name="Gada", augments={'"Fast Cast"+4','MND+1','Mag. Acc.+20','DMG:+11',}},
    sub="Thuellaic Ecu +1",
    ammo="Kalboron Stone",
    head="Theophany Cap +2",
    body="Theo. Briault +3",
    hands="Inyan. Dastanas +2",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Cure" spellcasting time -6%','CHR+5','Mag. Acc.+15',}},
    feet="Theo. Duckbills +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Stikini Ring",
    right_ring="Kishar Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	
	sets.midcast.NaSpell = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Homiliary",
    head="Ebers Cap +1",
    body={ name="Piety Briault +1", augments={'Enhances "Benediction" effect',}},
    hands="Ebers Mitts +1",
    legs="Ebers Pant. +1",
    feet={ name="Telchine Pigaches", augments={'Evasion+20','"Elemental Siphon"+30','Pet: Damage taken -4%',}},
    neck="Cleric's Torque",
    waist="Channeler's Stone",
    left_ear="Glorious Earring",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring="Kuchekula Ring",
    back={ name="Mending Cape", augments={'Healing magic skill +6','Enha.mag. skill +10','Mag. Acc.+6','"Cure" potency +2%',}},
	}

	sets.midcast.Erase = set_combine(sets.midcast.NaSpell, {
		neck="Cleric's Torque"
	})

	sets.midcast.Cursna = {
		    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Incantor Stone",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    body="Ebers Bliaud +1",
    hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
    legs="Th. Pantaloons +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Malison Medallion",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}
	
	sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
		neck="Nodens Gorget",
		ear2="Earthcry Earring",
		waist="Siegel Sash"
	})

	sets.midcast.Nuke = {
		main={ name="Grioavolr", augments={'"Fast Cast"+6','INT+2','"Mag.Atk.Bns."+17',}},
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head="Buremte Hat",
		neck="Eddy Necklace",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
		body="Witching Robe",
		hands="Fanatic Gloves",
		ring1="Strendu Ring",
		ring2="Acumen Ring",
		back="Toro Cape",
		waist="Eschan Stone",
		legs="Lengo Pants",
		feet="Navon Crackows"
	}

    sets.midcast["Benediction"] = { body="Piety Briault +1" }

    sets.midcast["Protectra V"] = set_combine(sets.midcast.EnhancingDuration, {
		
	})

    sets.midcast["Shellra V"] = set_combine(sets.midcast.EnhancingDuration, {
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}},
	})

	sets.midcast["Divine Caress"] = {
		hands="Ebers Mitts +1",
		back="Mending Cape"
	}
	
	sets.midcast["Realmrazer"] = {
		ammo="Hasty Pinion +1",
		head={ name="Chironic Hat", augments={'Accuracy+17 Attack+17','"Fast Cast"+1','STR+10','Accuracy+3','Attack+7',}},
		neck="Fotia Gorget",
		ear1="Tati Earring",
		ear2="Tati Earring",
		body={ name="Chironic Doublet", augments={'Accuracy+20 Attack+20','"Dual Wield"+1','STR+10','Accuracy+15',}},
		hands={ name="Chironic Gloves", augments={'Accuracy+16 Attack+16','Weapon Skill Acc.+11','MND+5','Accuracy+3',}},
		ring1="Rufescent Ring",
		ring2="Ilabrat Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs={ name="Telchine Braconi", augments={'Accuracy+17','Weapon Skill Acc.+14','Weapon skill damage +3%',}},
		feet={ name="Chironic Slippers", augments={'Chance of successful block +3','MND+10','Haste+1','Accuracy+20 Attack+20',}}
	}

	sets.midcast["Judgment"] = {
		ammo="Hasty Pinion +1",
		head={ name="Chironic Hat", augments={'Accuracy+17 Attack+17','"Fast Cast"+1','STR+10','Accuracy+3','Attack+7',}},
		neck="Fotia Gorget",
		ear1="Tati Earring",
		ear2="Tati Earring",
		body={ name="Chironic Doublet", augments={'Accuracy+20 Attack+20','"Dual Wield"+1','STR+10','Accuracy+15',}},
		hands={ name="Chironic Gloves", augments={'Accuracy+16 Attack+16','Weapon Skill Acc.+11','MND+5','Accuracy+3',}},
		ring1="Rufescent Ring",
		ring2="Shukuyu Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs={ name="Telchine Braconi", augments={'Accuracy+17','Weapon Skill Acc.+14','Weapon skill damage +3%',}},
		feet={ name="Chironic Slippers", augments={'Chance of successful block +3','MND+10','Haste+1','Accuracy+20 Attack+20',}}
	}

	sets.midcast["Black Halo"] = {
		ammo="Hasty Pinion +1",
		head={ name="Chironic Hat", augments={'Accuracy+17 Attack+17','"Fast Cast"+1','STR+10','Accuracy+3','Attack+7',}},
		neck="Fotia Gorget",
		ear1="Tati Earring",
		ear2="Tati Earring",
		body={ name="Chironic Doublet", augments={'Accuracy+20 Attack+20','"Dual Wield"+1','STR+10','Accuracy+15',}},
		hands={ name="Chironic Gloves", augments={'Accuracy+16 Attack+16','Weapon Skill Acc.+11','MND+5','Accuracy+3',}},
		ring1="Rufescent Ring",
		ring2="Leviathan Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs={ name="Telchine Braconi", augments={'Accuracy+17','Weapon Skill Acc.+14','Weapon skill damage +3%',}},
		feet={ name="Chironic Slippers", augments={'Chance of successful block +3','MND+10','Haste+1','Accuracy+20 Attack+20',}}
	}

	sets.midcast["Hexa Strike"] = {
		ammo="Hasty Pinion +1",
		head={ name="Chironic Hat", augments={'Accuracy+17 Attack+17','"Fast Cast"+1','STR+10','Accuracy+3','Attack+7',}},
		neck="Fotia Gorget",
		ear1="Tati Earring",
		ear2="Tati Earring",
		body={ name="Chironic Doublet", augments={'Accuracy+20 Attack+20','"Dual Wield"+1','STR+10','Accuracy+15',}},
		hands={ name="Chironic Gloves", augments={'Accuracy+16 Attack+16','Weapon Skill Acc.+11','MND+5','Accuracy+3',}},
		ring1="Rufescent Ring",
		ring2="Begrudging Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs={ name="Telchine Braconi", augments={'Accuracy+17','Weapon Skill Acc.+14','Weapon skill damage +3%',}},
		feet="Ayanmo Gambieras +2"
	}
	
	sets.midcast["Flash Nova"] = sets.midcast.Nuke

    sets.aftercast = {}

	-- Idle set used when IdleMode is "Refresh"
    sets.aftercast.Refresh = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Inyanga Tiara +2",
    body="Theo. Briault +3",
    hands={ name="Chironic Gloves", augments={'"Mag.Atk.Bns."+11','Weapon skill damage +4%','"Refresh"+2',}},
    legs="Assid. Pants +1",
    feet="Inyan. Crackows +2",
    neck="Loricate Torque",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Moonshade Earring",
    left_ring="Inyanga Ring",
    right_ring="Shneddick Ring",
	}

	-- Used when IdleMode is "Refresh" and your MP is under 50%
    sets.aftercast.Refresh_Sub50 = set_combine(sets.aftercast.Refresh, {
		waist="Fucho-no-obi"
	})

    -- Perp Down set, used when you have a pet out
	sets.aftercast.Perp = set_combine(sets.aftercast.Refresh, {
		waist="Avatar Belt"
	})

	-- Used when IdleMode is "DT"
	sets.aftercast.DT = set_combine(sets.aftercast.Refresh, {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Ayanmo Cosciales +2",
    feet="Aya. Gambieras +1",
    neck="Loricate Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Moonshade Earring",
    left_ring="Ephedra Ring",
    right_ring="Shneddick Ring",
	})

	-- Used when IdleMode is "MEva"
	sets.aftercast.MEva = {
		main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Incantor Stone",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Loricate Torque",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Moonshade Earring",
    left_ring="Inyanga Ring",
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	}

	-- Used when IdleMode is "TP"
	sets.aftercast.TP = {
		 main="Izcalli",
		ammo="Staunch Tathlum",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Ayanmo Cosciales +2",
    feet="Aya. Gambieras +1",
    neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Hetairoi Ring",
    right_ring="Ilabrat Ring",
	}

	-- Used when IdleMode is "KC"
	sets.aftercast.TP_KC = {
		ammo="Hasty Pinion +1",
		head={ name="Chironic Hat", augments={'"Dual Wield"+3','INT+4','"Store TP"+5','Accuracy+2 Attack+2',}},
		neck="Combatant's Torque",
		ear1="Telos Earring",
		ear2="Suppanomimi",
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+25','"Dual Wield"+2','AGI+4',}},
		ring1="Rajas Ring",
		ring2="Ilabrat Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
		waist="Goading Belt",
		legs={ name="Chironic Hose", augments={'Accuracy+20 Attack+20','"Dual Wield"+3','CHR+6','Accuracy+1','Attack+7',}},
		feet={ name="Chironic Slippers", augments={'"Dual Wield"+4','Rng.Acc.+21 Rng.Atk.+21','Quadruple Attack +3','Accuracy+17 Attack+17',}}
	}

	sets.aftercast.TP_MidAcc = {
		ammo="Hasty Pinion +1",
		head={ name="Chironic Hat", augments={'"Dual Wield"+3','INT+4','"Store TP"+5','Accuracy+2 Attack+2',}},
		neck="Combatant's Torque",
		ear1="Zennaroi Earring",
		ear2="Telos Earring",
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+25','"Dual Wield"+2','AGI+4',}},
		ring1="Rajas Ring",
		ring2="Ilabrat Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
		waist="Eschan Stone",
		legs={ name="Chironic Hose", augments={'Accuracy+20 Attack+20','"Dual Wield"+3','CHR+6','Accuracy+1','Attack+7',}},
		feet={ name="Chironic Slippers", augments={'"Dual Wield"+4','Rng.Acc.+21 Rng.Atk.+21','Quadruple Attack +3','Accuracy+17 Attack+17',}}
	}

	-- Used when IdleMode is "TP" and AccMode is true.
	sets.aftercast.TP_Acc = {
		ammo="Hasty Pinion +1",
		head={ name="Chironic Hat", augments={'"Dual Wield"+3','INT+4','"Store TP"+5','Accuracy+2 Attack+2',}},
		neck="Combatant's Torque",
		ear1="Zennaroi Earring",
		ear2="Cessance Earring",
		body="Ayanmo Corazza +2",
		hands="Ayanmo Manopolas +2",
		ring1="Ilabrat Ring",
		ring2="Varar Ring +1",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
		waist="Cetl Belt",
		legs="Ayanmo Cosciales +2",
		feet="Ayanmo Gambieras +2"
	}

	-- ===================================================================================================================
	--		End of Sets
	-- ===================================================================================================================

	TownIdle = S{"windurst woods","windurst waters","windurst walls","port windurst","bastok markets","bastok mines","port bastok","southern san d'oria","northern san d'oria","port san d'oria","upper jeuno","lower jeuno","port jeuno","ru'lude gardens","norg","kazham","tavnazian safehold","rabao","selbina","mhaura","aht urhgan whitegate","al zahbi","nashmau","western adoulin","eastern adoulin"}
	NaSpells = S{"Blindna","Erase","Paralyna","Poisona","Silena","Stona","Viruna"}
	EnhancingSpells = S{"Boost-STR","Boost-DEX","Boost-VIT","Boost-AGI","Boost-INT","Boost-MND","Boost-CHR"}

	send_command('input /macro book 15;wait .1;input /macro set 2;wait 5;input /lockstyleset 13 '..StartLockStyle)
end

function precast(spell)
    --if midaction() then
        --cancel_spell()
        --return
	--end
	if spell.type=="Item" then
		return
	end
	-- Spell fast cast
    if spell.action_type=="Magic" then
		if spell.skill=="Enhancing Magic" then
			equip(sets.precast.FC_Enhancing)
		elseif string.find(spell.name,"Cure") or string.find(spell.name,"Curaga") then
			equip(sets.precast.FC_Cure)
		elseif NaSpells:contains(spell.name) or spell.name=="Cursna" then
			equip(sets.precast.FC_Ailment)
		else
			equip(sets.precast.FC)
		end
    end
end

function midcast(spell)
	if spell.type=="Item" then
		return
	end
    -- Check for a specific set
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	-- Specific Spells
	elseif string.find(spell.name,"Cure") then
		equip(sets.midcast.Cure)
	elseif string.find(spell.name,"Cura") then
		equip(sets.midcast.Curaga)
	elseif NaSpells:contains(spell.name) then
		equip(sets.midcast.NaSpell)
	elseif string.find(spell.name,"Regen") then
		equip(sets.midcast.Regen)
	elseif string.sub(spell.name,1,3)=="Bar" then
		equip(sets.midcast.Barspell)
	-- Spells by Type/Skill
	elseif spell.skill=="Enfeebling Magic" then
		equip(sets.midcast.Enfeebling)
	elseif spell.skill=="Enhancing Magic" then
		if EnhancingSpells:contains(spell.name) then
			equip(sets.midcast.Enhancing)
		else
			equip(sets.midcast.EnhancingDuration)
		end
	elseif spell.skill=="Divine Magic" then
		if spell.name=="Repose" then
			equip(sets.midcast.Divine)
		else
			equip(sets.midcast.Nuke)
		end
	elseif spell.type=="BloodPactWard" or spell.type=="BloodPactRage" then
		equip(sets.precast.BP)
    else
        idle()
    end
	-- Auto-cancel existing buffs
	if spell.name=="Stoneskin" and buffactive["Stoneskin"] then
		windower.send_command('cancel 37;')
	elseif spell.name=="Sneak" and buffactive["Sneak"] and spell.target.type=="SELF" then
		windower.send_command('cancel 71;')
	elseif spell.name=="Utsusemi: Ichi" and buffactive["Copy Image"] then
		windower.send_command('wait 1;cancel 66;')
	end
end

function aftercast(spell)
	if spell.type=="Item" then
		return
	end
	idle()
end

function status_change(new,old)
	if new=="Idle" then
        idle()
	end
end

function self_command(command)
	IdleModeCommands = S{'Refresh','DT','MEva','TP','KC','Auto'}
	is_valid = (command=="Idle") -- "//gc c Idle" will call idle() without triggering the console help line

	if IdleModeCommands:contains(command) then
		IdleMode = command
		is_valid = true
		send_command('console_echo "Idle Mode: '..IdleMode..'"')
	elseif command=="ToggleMEva" then
		if IdleMode=="MEva" then
			IdleMode = "DT"
		elseif IdleMode=="DT" then
			IdleMode = "Refresh"
		else
			IdleMode = "MEva"
		end
		is_valid = true
		send_command('console_echo "Idle Mode: '..IdleMode..'"')
	elseif command=="MeleeMode" then
		if MeleeMode then
			IdleMode = "Refresh"
			MeleeMode = false
			enable("main","sub","range")
			send_command('console_echo "Melee Mode: false"')
		else
			IdleMode = "TP"
			MeleeMode = true
			--equip({main="Kraken Club"})
			disable("main","sub","range")
			send_command('console_echo "Melee Mode: true"')
		end
		is_valid = true
	elseif command=="AccMode" then
		AccMode = AccMode==false
		send_command('console_echo "Acc Mode: '..tostring(AccMode)..'"')
		is_valid = true
	elseif command=="ResistStun" then
		ResistStun = ResistStun==false
		send_command('console_echo "Resist Stun: '..tostring(ResistStun)..'"')
		is_valid = true
	elseif command=="ResistPara" then
		ResistPara = ResistPara==false
		send_command('console_echo "Resist Para: '..tostring(ResistPara)..'"')
		is_valid = true
	elseif command=="ResistSilence" then
		ResistSilence = ResistSilence==false
		send_command('console_echo "Resist Silence: '..tostring(ResistSilence)..'"')
		is_valid = true
	end

	if not is_valid then
		send_command('console_echo "gs c {Refresh|DT|MEva|TP} {MeleeMode} {ResistStun|ResistPara|ResistSilence}"')
	end
	idle()
end

function idle()
	--if TownIdle:contains(world.area:lower()) then
	--	return
	--end
	if IdleMode=='Auto' then
		if player.mpp < 50 then
			equip(sets.aftercast.Refresh_Sub50)
		elseif player.mpp < 70 then
			equip(sets.aftercast.DT)
		else
			equip(sets.aftercast.MEva)
		end
	elseif IdleMode=='DT' then
		equip(sets.aftercast.DT)
	elseif IdleMode=='TP' then
		if AccMode then
			equip(sets.aftercast.TP_MidAcc)
		else
			equip(sets.aftercast.TP)
		end
	elseif IdleMode=='KC' then
		equip(sets.aftercast.TP_KC)
	elseif IdleMode=='MEva' then
		equip(sets.aftercast.MEva)
    elseif pet.isvalid then
        equip(sets.aftercast.Perp)
	else
		if player.mpp < 50 then
			equip(sets.aftercast.Refresh_Sub50)
		else
			equip(sets.aftercast.Refresh)
		end
    end
	-- Ailment Resistance Gear - Last Takes Priority
	if (ResistPara or ResistStun or ResistSilence) and not IdleMode=='DT' then
		equip({ammo="Staunch Tathlum +1",neck="Warder's Charm +1"})
	end
	if ResistPara then
		equip({ear2="Hearty Earring",ring2="Blood Ring",back="Disperser's Cape"})
	end
	if ResistStun then
		equip({ear2="Dominance Earring",back="Tantalic Cape"})
	end
	if ResistSilence then
		if ResistPara then
			equip({ring1="Insect Ring"})
		else
			equip({ring2="Insect Ring"})
		end
		equip({ear2="Etiolation Earring"})
	end
end