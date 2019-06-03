-- Setup your Key Bindings here:  
    windower.send_command('bind f7 gs c toggle mb')
    windower.send_command('bind f9 gs c avatar mode')
    windower.send_command('bind f10 gs c toggle auto')
    windower.send_command('bind f12 gs c toggle melee')
     
     
-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.avatar = {}    -- leave this empty
      
    -- Your idle set when you DON'T have an avatar out
    sets.me.idle = {
		main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Caller's Pendant",
    waist="Fucho-no-Obi",
    left_ear="Evans Earring",
    right_ear="Moonshade Earring",
    left_ring="Shneddick Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
      
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = {
		main="Nirvana",
		sub="Elan Strap",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet="Baayami Sabots",
		neck="Caller's Pendant",
		waist="Fucho-no-Obi",
		left_ear="Evans Earring",
		right_ear="Moonshade Earring",
		left_ring="Shneddick Ring",
		right_ring="Evoker's Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10','System: 1 ID: 1246 Val: 4',}},
	}
      
    -----------------------
    -- Perpetuation Related
    -----------------------
      
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
    sets.avatar.perp = {
		main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Shomonjijoe +1",
    hands="Asteria Mitts +1",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Caller's Pendant",
    waist="Fucho-no-Obi",
    left_ear="Evans Earring",
    right_ear="Moonshade Earring",
    left_ring="Shneddick Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}

  
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
    sets.avatar["Carbuncle"] = {hands="Asteria Mitts +1"}
    --sets.avatar["Cait Sith"] = {hands="Lamassu Mitts +1"}
    -- When we want our avatar to stay alive
    sets.avatar.tank = set_combine(sets.avatar.perp,{
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Convoker's Horn +2",
    body={ name="Telchine Chas.", augments={'Mag. Evasion+24','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    hands={ name="Telchine Gloves", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    legs={ name="Telchine Braconi", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    neck="Caller's Pendant",
    waist="Isa Belt",
    left_ear="Evans Earring",
    right_ear="Moonshade Earring",
    left_ring="Shneddick Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10','System: 1 ID: 1246 Val: 4',}},
	})
      
    -- When we want our avatar to shred
    sets.avatar.melee = set_combine(sets.avatar.perp,{
		Main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Helios Band", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: "Dbl. Atk."+6','Blood Pact Dmg.+5',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Blood Pact Dmg.+8','Pet: INT+3','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Helios Boots", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
    neck="Smn. Collar +1",
    waist="Incarnation Sash",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},
	})
      
    -- When we want our avatar to hit
    sets.avatar.acc = set_combine(sets.avatar.perp,{
		main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Helios Band", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: "Dbl. Atk."+6','Blood Pact Dmg.+5',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Blood Pact Dmg.+8','Pet: INT+3','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Helios Boots", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
    neck="Smn. Collar +1",
    waist="Incarnation Sash",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},
	})
      
    -- When Avatar's Favor is active
    sets.avatar.favor = set_combine(sets.avatar.perp,{
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",
		body={ name="Apo. Dalmatica +1", augments={'Summoning magic skill +20','Enmity-6','Pet: Damage taken -4%',}},
		hands="Lamassu Mitts +1",
		legs="Assiduity Pants +1",
		feet="Baayami Sabots",
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear="Smn. Earring",
		left_ring="Evoker's Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: "Regen"+5',}},
	})
      
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
      
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Con. Doublet +2",
    hands="Lamassu Mitts",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Melic Torque",
    waist="Lucidity Sash",
    left_ear="Evans Earring",
    right_ear="Telos Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
    }
      
    -------------------------
    -- Individual Blood Pacts
    -------------------------
      
    -- Physical damage
    sets.avatar.atk = set_combine(sets.avatar.skill,{
		main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Helios Band", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: "Dbl. Atk."+6','Blood Pact Dmg.+5',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Blood Pact Dmg.+8','Pet: INT+3','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Helios Boots", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
    neck="Smn. Collar +1",
    waist="Incarnation Sash",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},
	})
    sets.avatar.pacc = set_combine(sets.avatar.atk,{
	main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Helios Band", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: "Dbl. Atk."+6','Blood Pact Dmg.+5',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Blood Pact Dmg.+8','Pet: INT+3','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Helios Boots", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
    neck="Smn. Collar +1",
    waist="Incarnation Sash",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},
	})
      
    -- Magic Attack
    sets.avatar.mab = set_combine(sets.avatar.skill,{
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+25',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+10','Pet: STR+10',}},
    legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+13 Pet: Rng. Acc.+13','Pet: Mag. Acc.+14','Pet: Damage taken -4%',}},
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Adad Amulet",
    waist="Regal Belt",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	})
    sets.avatar.mb = set_combine(sets.avatar.mab,{hands="Glyphic Bracers +1",})
    -- Hybrid
    sets.avatar.hybrid = { 
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+25',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+10','Pet: STR+10',}},
    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Adad Amulet",
    waist="Regal Belt",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20',}},
	}
      
    -- Magic Accuracy
    sets.avatar.macc = set_combine(sets.avatar.skill,{
		main="Nirvana",
		sub="Elan Strap",
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +2",
		body="Con. Doublet +3",
		hands="Convo. Bracers +3",
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet="Baayami Sabots",
		neck="Smn. Collar +1",
		waist="Regal Belt",
		left_ear="Lugalbanda Earring",
		right_ear="Enmerkar Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
    })
      
    -- Buffs
    sets.avatar.buff = set_combine(sets.avatar.skill,{
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Con. Doublet +2",
    hands="Lamassu Mitts",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps +1", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Melic Torque",
    waist="Lucidity Sash",
    left_ear="Evans Earring",
    right_ear="Telos Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
    })
      
    -- Other
    sets.avatar.other = set_combine(sets.avatar.skill,{main="Nirvana",
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Baayami Hat",
    body="Baayami Robe",
    hands="Baayami Cuffs",
    legs="Baayami Slops",
    feet="Baayami Sabots",
    neck="Incanter's Torque",
    waist="Lucidity Sash",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
    })
      
    -- Combat Related Sets
      
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = set_combine(sets.avatar.perp,{
        main="Nirvana",
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Tali'ah Turban +1",
    body="Tali'ah Manteel +2",
    hands="Convo. Bracers +3",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+19 Pet: R.Acc.+19 Pet: Atk.+19 Pet: R.Atk.+19','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	})
      
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {
        main="",
        sub="",
        ranged="",
		ammo="Sancus Sachet +1",
		head="Tali'ah Turban +1",
		body="Shomonjijoe +1",
		hands="Tali'ah Gages +1",
		legs="Tali'ah Sera. +1",
		feet="Tali'ah Crackows +1",
		neck="Sanctity Necklace",
		waist="Windbuffet Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Evoker's Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: "Regen"+5',}},
    }
    sets.me["Garland of Bliss"] = {
        ammo="Sancus Sachet +1",
    head="Inyanga Tiara +2",
    body="Inyanga Jubbah +2",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Combatant's Torque",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+19 Pet: R.Acc.+19 Pet: Atk.+19 Pet: R.Atk.+19','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
      
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though
  
    ---------------
    -- Casting Sets
    ---------------
      
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
      
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+25',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+25','"Fast Cast"+4','INT+10',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','"Fast Cast"+3',}},
    neck="Caller's Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	}
   
      
    -- Summoning Magic Cast time - gear
    sets.precast.summoning = set_combine(sets.precast.casting, {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+25',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+25','"Fast Cast"+4','INT+10',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','"Fast Cast"+3',}},
    neck="Caller's Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	})
      
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{
        main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+25',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+25','"Fast Cast"+4','INT+10',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','"Fast Cast"+3',}},
    neck="Caller's Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{
        main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: Mag. Acc.+12','Pet: "Mag.Atk.Bns."+25',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+25','"Fast Cast"+4','INT+10',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+4','"Fast Cast"+3',}},
    neck="Caller's Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Evoker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
        main="Nirvana",
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+25','"Fast Cast"+4','INT+10',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Mendi. Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
	})
      
    ---------------------
    -- Ability Precasting
    ---------------------
      
    -- Blood Pact Ability Delay
    sets.precast.bp = {
        main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +1",
    body="Con. Doublet +2",
    hands="Glyphic Bracers +1",
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Melic Torque",
    waist="Lucidity Sash",
    left_ear="Evans Earring",
    right_ear="Telos Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+10','Blood Pact Dmg.+1','Blood Pact ab. del. II -2',}},
    }
      
    -- Mana Cede
    sets.precast["Mana Cede"] = {
        main="",
        sub="",
        ranged="",
        ammo="Sancus Sachet +1",
		head="",
		body="",
		hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
		legs="",
		feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},
		neck="",
		waist="",
		left_ear="Evans Earring",
		right_ear="",
		left_ring="Evoker's Ring",
		right_ring="",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
    }
      
    -- Astral Flow  
    sets.precast["Astral Flow"] = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    ----------
    -- Midcast
    ----------
      
    -- We handle the damage and etc. in Pet Midcast later
      
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
        main="",
        sub="",
        ranged="",
        ammo="",
        head="",
        neck="",
        lear="",
        rear="",
        body="",
        hands="",
        lring="",
        rring="",
        back="",
        waist="",
        legs="",
        feet=""
    }
      
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
        main="Nirvana",
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +7',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +8',}},
    neck="Incanter's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','"Fast Cast"+10',}},
    })
      
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
        main="",
        sub="",
        ranged="",
        ammo="",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +7',}},
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}},
    feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +8',}},
        neck="Nodens gorget",
        lear="",
        rear="",
        lring="",
        rring="",
        back="",
        waist="",
        
    })
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.midcast.siphon = set_combine(sets.avatar.skill,{
        main="Nirvana",
    sub="Elan Strap",
    ammo="Sancus Sachet +1",
    head={ name="Telchine Cap", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Elemental Siphon"+25','Enh. Mag. eff. dur. +8',}},
    legs={ name="Telchine Braconi", augments={'Accuracy+14 Attack+14','"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
    feet="Beck. Pigaches +1",
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Evans Earring",
    right_ear="Gelos Earring",
    left_ring="Stikini Ring",
    right_ring="Evoker's Ring",
    back={ name="Conveyance Cape", augments={'Summoning magic skill +5','Pet: Enmity+10','Blood Pact ab. del. II -3',}},
    })
        
    -- Cure Potency
    sets.midcast.cure = set_combine(sets.midcast.casting,{
        ammo="Sancus Sachet +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Bokwus Gloves",
    legs="Assid. Pants +1",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Caller's Pendant",
    waist="Witful Belt",
    left_ear="Mendi. Earring",
    right_ear="Telos Earring",
    left_ring="Lebeche Ring",
    right_ring="Evoker's Ring",
    back="Solemnity Cape",
    })
      
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
  
end

