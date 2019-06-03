-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','TPEat')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

	--gear.obi_cure_waist = "Austerity Belt +1"
	--gear.obi_cure_back = "Alaunus's Cape"

	--gear.obi_nuke_waist = "Sekhmet Corset"
	--gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	--gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	--send_command('bind ^` input /ma "Arise" <t>')
	--send_command('bind !` input /ja "Penury" <me>')
	--send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind ^@!` gs c toggle AutoCaress')
	--send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	--send_command('bind @backspace input /ma "Aurora Storm" <me>')
	--send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	--send_command('bind !backspace input /ja "Accession" <me>')
	--send_command('bind != input /ja "Sublimation" <me>')
	--send_command('bind ^delete input /ja "Dark Arts" <me>')
	--send_command('bind !delete input /ja "Addendum: Black" <me>')
	--send_command('bind @delete input /ja "Manifestation" <me>')
	--send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	--send_command('bind @\\\\ input /ma "Shellra V" <me>')
	--send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    send_command('wait 5;input /lockstyleset 13 ')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Yagrush",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Yagrush",sub="Sindri"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		main={ name="Gada", augments={'"Fast Cast"+5','MND+7','Mag. Acc.+19','"Mag.Atk.Bns."+9',}},
		ammo="Sapience Orb",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
		legs="Aya. Cosciales +2",
		feet="Regal Pumps",
		neck="Cleric's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}
		
    sets.precast.FC.DT = {
		main={ name="Gada", augments={'"Fast Cast"+5','MND+7','Mag. Acc.+19','"Mag.Atk.Bns."+9',}},
		ammo="Sapience Orb",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
		legs="Aya. Cosciales +2",
		feet="Regal Pumps",
		neck="Cleric's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
	main={ name="Gada", augments={'"Fast Cast"+5','MND+7','Mag. Acc.+19','"Mag.Atk.Bns."+9',}},
		ammo="Sapience Orb",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
		legs="Aya. Cosciales +2",
		feet="Regal Pumps",
		neck="Cleric's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
	main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
		legs="Ebers Pant. +1",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Cleric's Torque",
		waist="Witful Belt",
		left_ear="Nourish. Earring +1",
		right_ear="Mendi. Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Perimede Cape",
		})
	
	sets.precast.FC.Cure.DT = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
		legs="Ebers Pant. +1",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Cleric's Torque",
		waist="Witful Belt",
		left_ear="Nourish. Earring +1",
		right_ear="Mendi. Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Perimede Cape",
		}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Nahtirah Hat",ear1="Roundel Earring",
		body="Piety Briault +1",hands="Telchine Gloves",
		waist="Chaac Belt",back="Aurist's Cape +1"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Homiliary",
		head={ name="Piety Cap +3", augments={'Enhances "Devotion" effect',}},
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands={ name="Piety Mitts +3", augments={'Enhances "Martyr" effect',}},
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Shellra V" effect',}},
		feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Shukuyu Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+9','Weapon skill damage +10%',}},
		}
		
    sets.precast.WS.Dagan = {
		ammo="Homiliary",
		head={ name="Piety Cap +3", augments={'Enhances "Devotion" effect',}},
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands={ name="Piety Mitts +3", augments={'Enhances "Martyr" effect',}},
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Shellra V" effect',}},
		feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Shukuyu Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+9','Weapon skill damage +10%',}},
		}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    sets.precast.WS['Mystic Boon'] = {
	ammo="Homiliary",
    head={ name="Piety Cap +3", augments={'Enhances "Devotion" effect',}},
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands={ name="Piety Mitts +3", augments={'Enhances "Martyr" effect',}},
    legs={ name="Piety Pantaln. +3", augments={'Enhances "Shellra V" effect',}},
    feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
    neck="Cleric's Torque",
    waist="Luminary Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Ilabrat Ring",
    right_ring="Shukuyu Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+9','Weapon skill damage +10%',}},
	}

    -- Midcast Sets

    sets.Kiting = {left_ring="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {
		head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Gifted Earring",
		ear2="Gwati Earring",
		body="Vedic Coat",
		hands="Fanatic Gloves",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back="Solemnity Cape",
		waist="Austerity Belt",
		legs="Vanya Slops",
		feet="Medium's Sabots"
		}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {}
	
    sets.midcast.FastRecast = {
		main={ name="Gada", augments={'"Fast Cast"+5','MND+7','Mag. Acc.+19','"Mag.Atk.Bns."+9',}},
		ammo="Sapience Orb",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
		legs="Aya. Cosciales +2",
		feet="Regal Pumps",
		neck="Cleric's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Staunch Tathlum",
		head="Ebers Cap +1",
		body="Theo. Briault +3",
		hands="Theophany Mitts +2",
		legs="Ebers Pant. +1",
		feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque +1",
		waist="Hachirin-no-Obi",
		left_ear="Regal Earring",
		right_ear="Glorious Earring",
		left_ring="Kuchekula Ring",
		right_ring="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}
		
	sets.midcast.CureSolace = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Staunch Tathlum",
		head="Ebers Cap +1",
		body="Ebers Bliaud +1",
		hands="Theophany Mitts +2",
		legs="Ebers Pant. +1",
		feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque +1",
		waist="Hachirin-no-Obi",
		left_ear="Regal Earring",
		right_ear="Glorious Earring",
		left_ring="Kuchekula Ring",
		right_ring="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}

	sets.midcast.LightWeatherCure = {
	main="Chatoyant Staff",sub="Curatio Grip",ammo="Esper Stone +1",
		head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body="Kaykaus Bliaut",hands="Theophany Mitts +3",ring1="Janniston Ring",ring2="Lebeche Ring",
		back="Twilight Cape",waist="Hachirin-no-Obi",legs="Ebers Pant. +1",feet="Kaykaus Boots"}

	sets.midcast.LightWeatherCureSolace = {waist="Hachirin-no-Obi"}
		
	sets.midcast.LightDayCureSolace = {waist="Hachirin-no-Obi"}

	sets.midcast.LightDayCure = {waist="Hachirin-no-Obi"}

	sets.midcast.Curaga = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Staunch Tathlum",
		head="Ebers Cap +1",
		body="Theo. Briault +3",
		hands="Theophany Mitts +2",
		legs="Ebers Pant. +1",
		feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque +1",
		waist="Hachirin-no-Obi",
		left_ear="Regal Earring",
		right_ear="Glorious Earring",
		left_ring="Kuchekula Ring",
		right_ring="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}
		
	sets.midcast.LightWeatherCuraga = {waist="Hachirin-no-Obi"}
		
	sets.midcast.LightDayCuraga = {waist="Hachirin-no-Obi"}

	sets.midcast.Cure.DT = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		ammo="Staunch Tathlum",
		head="Ebers Cap +1",
		body="Theo. Briault +3",
		hands="Theophany Mitts +2",
		legs="Ebers Pant. +1",
		feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
		neck="Cleric's Torque +1",
		waist="Hachirin-no-Obi",
		left_ear="Regal Earring",
		right_ear="Glorious Earring",
		left_ring="Kuchekula Ring",
		right_ring="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {
	ammo="Staunch Tathlum",
    head="Ebers Cap +1",
    body="Theo. Briault +3",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','"Regen" potency+3',}},
    legs="Ebers Pant. +1",
    feet={ name="Piety Duckbills +3", augments={'Enhances "Protectra V" effect',}},
    neck="Clr. Torque +1",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Glorious Earring",
    left_ring="Kuchekula Ring",
    right_ring="Lebeche Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+3','Mag. Acc.+13','DMG:+5',}},
		sub="Sors Shield",
		ammo="Homiliary",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body="Ebers Bliaud +1",
		hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
		legs="Th. Pant. +3",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck="Debilis Medallion",
		waist="Witful Belt",
		left_ear="Glorious Earring",
		right_ear="Regal Earring",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
		}

	sets.midcast.StatusRemoval = {
		main="Yagrush",
		sub="Sors Shield",
		ammo="Homiliary",
		head="Ebers Cap +1",
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Ebers Mitts +1",
		legs="Ebers Pant. +1",
		feet={ name="Telchine Pigaches", augments={'Evasion+20','"Elemental Siphon"+30','Pet: Damage taken -4%',}},
		neck="Clr. Torque +1",
		waist="Channeler's Stone",
		left_ear="Glorious Earring",
		right_ear="Regal Earring",
		left_ring="Lebeche Ring",
		right_ring="Kuchekula Ring",
		back={ name="Mending Cape", augments={'Healing magic skill +6','Enha.mag. skill +10','Mag. Acc.+6','"Cure" potency +2%',}},
		}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+3','Mag. Acc.+13','DMG:+5',}},
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head={ name="Telchine Cap", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'"Elemental Siphon"+35','Enh. Mag. eff. dur. +10',}},
    hands={ name="Telchine Gloves", augments={'"Elemental Siphon"+25','Enh. Mag. eff. dur. +9',}},
    legs={ name="Telchine Braconi", augments={'Accuracy+14 Attack+14','"Elemental Siphon"+35','Enh. Mag. eff. dur. +9',}},
    feet="Theo. Duckbills +3",
		}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {sub="Ammurapi Shield",hands="Regal Cuffs"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		ammo="Impatiens",
   		head="Inyanga Tiara +2",
		body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
		hands="Ebers Mitts +1",
		legs="Th. Pant. +3",
		feet="Theo. Duckbills +3",
		})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = {
		main="Beneficus",
		sub="Ammurapi Shield",
		ammo="Homiliary",
		head="Ebers Cap +1",
		body="Ebers Bliaud +1",
		hands="Ebers Mitts +1",
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Shellra V" effect',}},
		feet="Ebers Duckbills +1",
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Nourish. Earring +1",
		right_ear="Loquac. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Mending Cape", augments={'Healing magic skill +6','Enha.mag. skill +10','Mag. Acc.+6','"Cure" potency +2%',}},
		}

	sets.midcast.Impact = {
		main="Oranyan",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head=empty,
		neck="Erra Pendant",
		ear1="Regal Earring",
		ear2="Digni. Earring",
		body="Twilight Cloak",
		hands=gear.chironic_enfeeble_hands,
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		back="Toro Cape",
		waist="Acuity Belt +1",
		legs="Chironic Hose",
		feet=gear.chironic_nuke_feet
		}
		
	sets.midcast['Elemental Magic'] = {main=gear.grioavolr_nuke_staff,sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist=gear.ElementalObi,legs="Chironic Hose",feet=gear.chironic_nuke_feet}

	sets.midcast['Elemental Magic'].Resistant = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Crematio Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

	sets.midcast['Divine Magic'] = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",
		body="Theo. Briault +3",
		hands={ name="Piety Mitts +3", augments={'Enhances "Martyr" effect',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+6','Mag. Acc.+15',}},
		feet="Theo. Duckbills +3",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20',}},
		}
		
	sets.midcast.Holy = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Chironic Hat", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','INT+10','Mag. Acc.+13','"Mag.Atk.Bns."+8',}},
		body={ name="Chironic Doublet", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Mag. Acc.+12','"Mag.Atk.Bns."+9',}},
		hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},
		legs="Gyve Trousers",
		feet={ name="Chironic Slippers", augments={'Accuracy+17','"Dbl.Atk."+4','STR+9',}},
		neck="Baetyl Pendant",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Shneddick Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20',}},
		}

	sets.midcast['Dark Magic'] = {main="Oranyan", sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Inyanga Jubbah +2",hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}

	sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Nahtirah Hat",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

	sets.midcast['Enfeebling Magic'] = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",
		body="Theo. Briault +3",
		hands="Regal Cuffs",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+6','Mag. Acc.+15',}},
		feet="Theo. Duckbills +3",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20',}},
		}

	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",
		body="Theo. Briault +3",
		hands={ name="Piety Mitts +3", augments={'Enhances "Martyr" effect',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Resist Silence"+6','Mag. Acc.+15',}},
		feet="Theo. Duckbills +3",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Friomisi Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20',}},
		}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back="Alaunus's Cape",ring1="Stikini Ring"})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {
		}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Volte Beret",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Inyan. Dastanas +2",
    legs="Assid. Pants +1",
    feet="Inyan. Crackows +2",
    neck="Clr. Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Mendi. Earring",
    left_ring="Shneddick Ring",
    right_ring="Inyanga Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
	}

	sets.idle.PDT = {
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Clr. Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Mendi. Earring",
		left_ring="Ayanmo Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
	}
		
    sets.idle.TPEat = set_combine(sets.idle, {})

	sets.idle.Weak = {
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Volte Beret",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		neck="Clr. Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Defending Ring",
		right_ring="Inyanga Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
	 }

    -- Defense sets

	sets.defense.PDT = {
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Clr. Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Genmei Earring",
		right_ear="Mendi. Earring",
		left_ring="Ayanmo Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
		}

	sets.defense.MDT = {
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Volte Beret",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		neck="Clr. Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Defending Ring",
		right_ring="Inyanga Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
	 }

    sets.defense.MEVA = {
		sub="Genmei Shield",
		ammo="Staunch Tathlum",
		head="Volte Beret",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		neck="Clr. Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Defending Ring",
		right_ring="Inyanga Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}},
	 }
		
	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		ammo="Staunch Tathlum",
		head={ name="Chironic Hat", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+2','STR+7','Accuracy+9','Attack+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+3','Accuracy+13',}},
		legs="Aya. Cosciales +2",
		feet={ name="Chironic Slippers", augments={'Accuracy+17','"Dbl.Atk."+4','STR+9',}},
		neck="Combatant's Torque",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Hetairoi Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

    sets.engaged.Acc = {
		ammo="Staunch Tathlum",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +2",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +2",
    neck="Combatant's Torque",
    waist="Grunfeld Rope",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Cacoethic Ring +1",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.DW = {
		ammo="Staunch Tathlum",
		head={ name="Chironic Hat", augments={'Accuracy+20 Attack+20','"Dbl.Atk."+2','STR+7','Accuracy+9','Attack+9',}},
		body="Ayanmo Corazza +2",
		hands={ name="Chironic Gloves", augments={'Accuracy+14 Attack+14','"Dbl.Atk."+3','Accuracy+13',}},
		legs="Aya. Cosciales +2",
		feet={ name="Chironic Slippers", augments={'Accuracy+17','"Dbl.Atk."+4','STR+9',}},
		neck="Combatant's Torque",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Hetairoi Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}

    sets.engaged.DW.Acc = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Combatant's Torque",
		waist="Grunfeld Rope",
		left_ear="Digni. Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Cacoethic Ring +1",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}

	sets.HPDown = {
		head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}

	sets.HPCure = {
		main="Queller Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pant. +1",feet="Kaykaus Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 15)
end