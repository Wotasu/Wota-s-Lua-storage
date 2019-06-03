function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','Refresh','Melee')
	  state.Weapons:options('Carnwenhan','AeneasDW','CarnDW')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2

	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')

	-- Additional local binds
  --send_command('bind ^` gs c cycle ExtraSongsMode')
  --send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	--send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind @f10 gs c cycle RecoverMode')
	--send_command('bind @f8 gs c toggle AutoNukeMode')
	--send_command('bind !q gs c weapons NukeWeapons;gs c update')
	--send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Carnwenhan = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.AeneasDW = {main="Aeneas",sub="Taming Sari"}
	sets.weapons.CarnDW = {main="Carnwenhan",sub="Taming Sari"}

	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Aya. Cosciales +2",
		feet={ name="Telchine Pigaches", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC.BardSong = {
	    head="Fili Calot +1 +1",
	    body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -2%','Song spellcasting time -4%',}},
		legs={ name="Gende. Spats +1", augments={'Phys. dmg. taken -1%','Song spellcasting time -5%',}},
		feet={ name="Telchine Pigaches", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
	    neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	sets.precast.FC.BardSong = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC.Paeon = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})

	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla


	-- Precast sets to enhance JAs

	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
	    range={ name="Linos", augments={'Accuracy+12','"Dbl.Atk."+1','STR+6 DEX+6',}},
		head={ name="Lustratio Cap", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
		body={ name="Bihu Jstcorps. +3", augments={'Enhances "Troubadour" effect',}},
		hands={ name="Lustratio Mittens", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
		legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
		feet={ name="Lustratio Leggings", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Mache Earring",
		left_ring="Ayanmo Ring",
		right_ring="Ilabrat Ring",
		back="Intarabus's Cape",--
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Telos Earring",ear2="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, {body="Ashera Harness", legs="Gende. Spats +1"})

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		  back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},waist="Witful Belt",legs="Aya. Cosciales +2",feet="Gende. Galosh. +1"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Daurdabla"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Carol = {hands="Mousai Gages"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"} --feet="Fili Cothurnes +1" Brioso Slippers still provides more Duration
	sets.midcast['Magic Finale'] = {range="Gjallarhorn"}
	sets.midcast.Mazurka = {range="Marsyas"}
	sets.midcast.Paeon = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})


	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
	    head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Defending Ring",
		right_ring="Ayanmo Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
	    head="Brioso Roundlet +2",
		body="Fili Hongreline +1",
		hands="Brioso Cuffs +3",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Luminary Sash",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {
	    sub="Ammurapi Shield",
		head="Brioso Roundlet +2",
		body="Brioso Justau. +2",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +2",
		feet="Brioso Slippers +3",
		neck="Moonbow Whistle +1",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Terpander",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		  back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},waist="Witful Belt",legs="Fili Rhingrave +1",feet="Aya. Gambieras +2"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
	    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body={ name="Kaykaus Bliaut", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','"Regen" potency+3',}},
		legs={ name="Kaykaus Tights", augments={'MP+60','MND+10','Mag. Acc.+15',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Mendi. Earring",
		right_ear="Regal Earring",
		left_ring="Kuchekula Ring",
		right_ring="Lebeche Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
		head={ name="Telchine Cap", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'"Elemental Siphon"+25','Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'Accuracy+14 Attack+14','"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque", -- skill 10

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}

	sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"})

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.idle = {
	    range="Marsyas",
	    head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shneddick Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	sets.idle.Refresh = {
	    range="Marsyas",
	    head="Inyanga Tiara +2",
	    body="Ashera Harness",
	    hands="Inyan. Dastanas +2",
	    legs="Inyanga Shalwar +2",
	    feet="Inyan. Crackows +2",
	    neck="Mnbw. Whistle +1",
	    waist="Flume Belt +1",
	    left_ear="Moonshade Earring",
	    right_ear="Graiai Earring",
			left_ring="Defending Ring",
	    right_ring="Inyanga Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.idle.Melee = {
		range="Marsyas",
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Lissome Necklace",
		waist="Flume Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

	-- Defense sets

	sets.defense.PDT = {
	    sub="Genmei Shield",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		left_ear="Odnowa Earring +1",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shneddick Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	sets.defense.MDT = {
	    ammo="Staunch Tathlum",
		sub="Genmei Shield",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Defending Ring",
		right_ring="Inyanga Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	sets.Kiting = {}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	sets.engaged = {
	    range={ name="Linos", augments={'Accuracy+12','"Dbl.Atk."+1','STR+6 DEX+6',}},
		head={ name="Chironic Hat", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+2','STR+7','Accuracy+9','Attack+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+3','Accuracy+13',}},
		legs="Aya. Cosciales +2",
		feet={ name="Chironic Slippers", augments={'Accuracy+17','"Dbl.Atk."+4','STR+9',}},
		neck="Combatant's Torque",
		waist="Windbuffet belt +1",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},
	}
	sets.engaged.Acc = {
	    range={ name="Linos", augments={'Accuracy+12','"Dbl.Atk."+1','STR+6 DEX+6',}},
		head={ name="Chironic Hat", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+2','STR+7','Accuracy+9','Attack+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+3','Accuracy+13',}},
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Digni. Earring",
		right_ear="Telos Earring",
		left_ring="Begrudging Ring",
		right_ring="Ilabrat Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},
	}
	sets.engaged.DW = {
	    range={ name="Linos", augments={'Accuracy+12','"Dbl.Atk."+1','STR+6 DEX+6',}},
		head={ name="Chironic Hat", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+2','STR+7','Accuracy+9','Attack+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+3','Accuracy+13',}},
		legs="Aya. Cosciales +2",
		feet={ name="Chironic Slippers", augments={'Accuracy+17','"Dbl.Atk."+4','STR+9',}},
		neck="Combatant's Torque",
		waist="Windbuffet belt +1",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},
	}
	sets.engaged.DW.Acc = {
	     range={ name="Linos", augments={'Accuracy+12','"Dbl.Atk."+1','STR+6 DEX+6',}},
		head={ name="Chironic Hat", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+2','STR+7','Accuracy+9','Attack+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+3','Accuracy+13',}},
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Digni. Earring",
		right_ear="Telos Earring",
		left_ring="Begrudging Ring",
		right_ring="Ilabrat Ring",
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10',}},
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end
