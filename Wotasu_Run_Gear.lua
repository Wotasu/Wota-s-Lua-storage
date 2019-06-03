function user_setup()

	state.OffenseMode:options('Normal','Acc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Normal','Acc','FullAcc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP')
	state.IdleMode:options('Normal','Tank','KiteTank')
	state.Weapons:options('Aettir','Lionheart','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}

	-- Additional local binds
	--send_command('bind !` gs c SubJobEnmity')
	--send_command('bind @` gs c cycle RuneElement')
	--send_command('bind ^` gs c RuneElement')
	--send_command('bind @pause gs c toggle AutoRuneMode')
	--send_command('bind ^delete input /ja "Provoke" <stnpc>')
	--send_command('bind !delete input /ma "Cure IV" <stal>')
	--send_command('bind @delete input /ma "Flash" <stnpc>')
	--send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	--send_command('bind @\\\\ input /ma "Shell V" <t>')
	--send_command('bind !\\\\ input /ma "Crusade" <me>')
	--send_command('bind ^backspace input /ja "Lunge" <t>')
	--send_command('bind @backspace input /ja "Gambit" <t>')
	--send_command('bind !backspace input /ja "Rayke" <t>')
	--send_command('bind @f8 gs c toggle AutoTankMode')
	--send_command('bind @f10 gs c toggle TankAutoDefense')
	--send_command('bind ^@!` gs c cycle SkillchainMode')
	--send_command('bind !r gs c weapons Lionheart;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {
	ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Ahosi Leggings",
    neck="Futhark Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Cryptic Earring",
    right_ear="Friomisi Earring",
    left_ring="Defending Ring",
    right_ring="Ayanmo Ring",
    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
		 
    sets.Enmity.SIRD = {
		ammo="Staunch Tathlum",
		head="Meghanada Visor +2",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Trux Earring",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
		back=gear.enmity_jse_back,
		waist="Rumination Sash",
		legs="Carmine Cuisses +1",
		feet="Erilaz Greaves +1"}

    sets.Enmity.DT = {
		ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Emet Harness +1",
		hands="Kurys Gloves",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +1",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +1", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
		ammo="Seeth. Bomblet +1",
    head={ name="Herculean Helm", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Weapon skill damage +4%','INT+1','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
    body="Ayanmo Corazza +2",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Weapon skill damage +2%','INT+6','"Mag.Atk.Bns."+13',}},
    feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +4%','INT+7','Mag. Acc.+11',}},
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Ethereal Earring",
    left_ring="Defending Ring",
    right_ring="Ayanmo Ring",}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	sets.element.Earth = {neck="Quanpur Necklace"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",
		neck="Unmoving Collar +1",
		ear1="Enchntr. Earring +1",
		ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,
		hands=gear.herculean_waltz_hands,
		ring1="Defending Ring",
		ring2="Valseur's Ring",
        back="Moonlight Cape",
		waist="Chaac Belt",
		legs="Dashing Subligar",
		feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		body={ name="Adhemar Jacket", augments={'HP+80','"Fast Cast"+7','Magic dmg. taken -3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Aya. Cosciales +2",
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Baetyl Pendant",
		waist="Windbuffet Belt +1",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Ogma's cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
	}
			
	sets.precast.FC.DT = {
		ammo="Staunch Tathlum",
        head="Rune. Bandeau +3",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Runeist's Coat +3",
		hands=gear.herculean_dt_hands,
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
            ammo="Seeth. Bomblet +1",
		head={ name="Herculean Helm", augments={'Attack+19','Weapon skill damage +3%','STR+15','Accuracy+15',}},
		body="Ayanmo Corazza +2",
		hands="Meg. Gloves +2",
		legs={ name="Herculean Trousers", augments={'Accuracy+28','Weapon skill damage +4%','STR+12',}},
		feet={ name="Herculean Boots", augments={'Weapon skill damage +4%','STR+9','Accuracy+14','Attack+8',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}
			
	sets.precast.WS.SomeAcc = {
		ammo="Seeth. Bomblet +1",
		head={ name="Herculean Helm", augments={'Attack+19','Weapon skill damage +3%','STR+15','Accuracy+15',}},
		body="Ayanmo Corazza +2",
		hands="Meg. Gloves +2",
		legs={ name="Herculean Trousers", augments={'Accuracy+28','Weapon skill damage +4%','STR+12',}},
		feet={ name="Herculean Boots", augments={'Weapon skill damage +4%','STR+9','Accuracy+14','Attack+8',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}
			
	sets.precast.WS.Acc = {
		ammo="Seeth. Bomblet +1",
		head={ name="Herculean Helm", augments={'Attack+19','Weapon skill damage +3%','STR+15','Accuracy+15',}},
		body="Ayanmo Corazza +2",
		hands="Meg. Gloves +2",
		legs={ name="Herculean Trousers", augments={'Accuracy+28','Weapon skill damage +4%','STR+12',}},
		feet={ name="Herculean Boots", augments={'Weapon skill damage +4%','STR+9','Accuracy+14','Attack+8',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Regal Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}
			
	sets.precast.WS.HighAcc = {
		ammo="Seeth. Bomblet +1",
    head="Meghanada Visor +2",
    body="Ayanmo Corazza +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','DEX+9','Accuracy+13','Attack+15',}},
    neck="Fotia Gorget",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}

	sets.precast.WS.FullAcc = {
		ammo="Seeth. Bomblet +1",
    head="Meghanada Visor +2",
    body="Ayanmo Corazza +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','DEX+9','Accuracy+13','Attack+15',}},
    neck="Fotia Gorget",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Digni. Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}

    sets.precast.WS['Resolution'] = {
		ammo="Seeth. Bomblet +1",
    head={ name="Lustratio Cap +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Meg. Chausses +2",
    feet={ name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}	
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{}) 
	
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{}) 
	
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{}) 

    sets.precast.WS['Dimidiation'] = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands="Meg. Gloves +2",
		legs={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}},
		feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','DEX+9','Accuracy+13','Attack+15',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
}	
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{})
	
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
	
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {
		ammo="Impatiens",
        head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
        body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Kishar Ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Rawhide Trousers",
		feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",
		neck="Twilight Torque",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Runeist's Coat +3",
		hands=gear.herculean_dt_hands,
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		head="Carmine Mask",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		hands="Runeist Mitons +1",
		back="Merciful Cape",
		waist="Olympus Sash",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		legs="Carmine Cuisses +1"})
    
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		ammo="Staunch Tathlum",
		head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
		body={ name="Taeon Tabard", augments={'Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
		neck="Incanter's Torque",
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Ayanmo Ring",})
    
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{
	head="Rune. Bandeau +1"})
	
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{
	head="Erilaz Galea +1"})
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
	ear2="Earthcry Earring",waist="Siegel Sash"})
	
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	
	sets.midcast.Foil = set_combine(sets.Enmity, {})
    
	sets.midcast.Stun = set_combine(sets.Enmity, {})
	
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
		ammo="Staunch Tathlum",
        head="Carmine Mask +1",
		neck="Phalaina Locket",
		ear1="Mendi. Earring",
		ear2="Roundel Earring",
        body="Vrikodara Jupon",
		hands="Buremte Gloves",
		ring1="Lebeche Ring",
		ring2="Janniston Ring",
        back="Tempered Cape +1",
		waist="Luminary Sash",
		legs="Carmine Cuisses +1",
		feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {
		neck="Phalaina Locket",
		hands="Buremte Gloves",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"}
	
	sets.Cure_Received = {
		neck="Phalaina Locket",
		hands="Buremte Gloves",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"}
	
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
		ammo="Staunch Tathlum", 
		head="Meghanada Visor +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Ayanmo Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {
	ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",
		neck="Futhark Torque +1",
		ear1="Genmei Earring",
		ear2="Ethereal Earring",
        body="Runeist's Coat +3",
		hands="Aya. Manopolas +2",
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
        back="Shadow Mantle",
		waist="Flume Belt",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"}
		
	sets.idle.KiteTank = {
	ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",
		neck="Vim Torque +1",
		ear1="Genmei Earring",
		ear2="Ethereal Earring",
        body="Futhark Coat +1",
		hands=gear.herculean_dt_hands,
		ring1="Defending Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Carmine Cuisses +1",
		feet="Hippo. Socks +1"}

	sets.idle.Weak = {ammo='Homiliary',
		head="Rawhide Mask",
		neck="Futhark Torque +1",
		ear1="Genmei Earring",
		ear2="Ethereal Earring",
		body="Runeist's Coat +3",
		hands=gear.herculean_refresh_hands,
		ring1="Defending Ring",
		ring2="Dark Ring",
		back="Moonlight Cape",
		waist="Flume Belt",
		legs="Rawhide Trousers",
		feet=gear.herculean_refresh_feet}

	sets.Kiting = {right_ring="Shneddick Ring",}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {
        ammo="Staunch Tathlum",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Ayanmo Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
	sets.defense.PDT_HP = {
		ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Runeist's Coat +3",
		hands=gear.herculean_dt_hands,
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"}
		
	sets.defense.MDT = {
		ammo="Yamarang",
        head="Erilaz Galea +1",
		neck="Futhark Torque +1",
		ear1="Odnowa Earring +1"
		,ear2="Sanare Earring",
        body="Runeist's Coat +3",
		hands=gear.herculean_dt_hands,
		ring1="Defending Ring",
		ring2="Shadow Ring",
        back="Moonlight Cape",
		waist="Engraved Belt",
		legs=gear.herculean_dt_legs,
		feet="Erilaz Greaves +1"}
		
	sets.defense.MDT_HP = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Runeist's Coat +3",
		hands=gear.herculean_dt_hands,
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Engraved Belt",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"}
	
	sets.defense.BDT = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Warder's Charm +1",
		ear1="Odnowa Earring +1",
		ear2="Sanare Earring",
        body="Runeist's Coat +3",
		hands=gear.herculean_dt_hands,
		ring1="Defending Ring",
		ring2="Shadow Ring",
        back="Moonlight Cape",
		waist="Engraved Belt",
		legs=gear.herculean_dt_legs,
		feet="Erilaz Greaves +1"}
	
	sets.defense.BDT_HP = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Runeist's Coat +3",
		hands=gear.herculean_dt_hands,
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Engraved Belt",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1"}
	
	sets.defense.MEVA = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Warder's Charm +1",
		ear1="Odnowa Earring +1",
		ear2="Sanare Earring",
        body="Runeist's Coat +3",
		hands="Erilaz Gauntlets +1",
		ring1="Purity Ring",
		ring2="Vengeful Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Rune. Trousers +3",
		feet="Erilaz Greaves +1"}
		
	sets.defense.MEVA_HP = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Warder's Charm +1",
		ear1="Odnowa Earring +1",
		ear2="Sanare Earring",
        body="Runeist's Coat +3",
		hands="Erilaz Gauntlets +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonlight Cape",
		waist="Engraved Belt",
		legs="Rune. Trousers +3",
		feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Warder's Charm +1",
		ear1="Odnowa Earring +1",
		ear2="Sanare Earring",
        body="Runeist's Coat +3",
		hands="Erilaz Gauntlets +1",
		ring1="Purity Ring",
		ring2="Vengeful Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Rune. Trousers +3",
		feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Unmoving Collar +1",
		ear1="Odnowa Earring +1",
		ear2="Sanare Earring",
        body="Runeist's Coat +3",
		hands="Erilaz Gauntlets +1",
		ring1="Defending Ring",
		ring2="Dark Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Rune. Trousers +3",
		feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {
		ammo="Staunch Tathlum",
        head="Erilaz Galea +1",
		neck="Unmoving Collar +1",
		ear1="Odnowa Earring +1",
		ear2="Sanare Earring",
        body="Runeist's Coat +3",
		hands="Erilaz Gauntlets +1",
		ring1="Purity Ring",
		ring2="Vengeful Ring",
        back=gear.enmity_jse_back,
		waist="Engraved Belt",
		legs="Rune. Trousers +3",
		feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
        ammo="Ginsen",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+11','INT+3','Quadruple Attack +2','Accuracy+18 Attack+18',}},
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		left_ear="Brutal Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epona's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
    sets.engaged.SomeAcc = {
		ammo="Ginsen",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+11','INT+3','Quadruple Attack +2','Accuracy+18 Attack+18',}},
		neck="Combatant's Torque",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epona's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.engaged.Acc = {
		ammo="Ginsen",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+11','INT+3','Quadruple Attack +2','Accuracy+18 Attack+18',}},
		neck="Combatant's Torque",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epona's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},}
		
	sets.engaged.HighAcc = {
		ammo="Ginsen",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+11','INT+3','Quadruple Attack +2','Accuracy+18 Attack+18',}},
		neck="Combatant's Torque",
		waist="Kentarch Belt",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Begrudging Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
		
	sets.engaged.FullAcc = {
		ammo="Seeth. Bomblet +1",
		head="Meghanada Visor +2",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','DEX+9','Accuracy+13','Attack+15',}},
		neck="Incanter's Torque",
		waist="Kentarch Belt",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Ilabrat Ring",
		right_ring="Cacoethic Ring +1",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
    sets.engaged.DTLite = {
		ammo="Staunch Tathlum",
    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
    body="Ayanmo Corazza +2",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Erilaz Greaves +1",
    neck="Futhark Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Genmei Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
}
    sets.engaged.SomeAcc.DTLite = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Twilight Torque",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
		
	sets.engaged.Acc.DTLite = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Twilight Torque",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
		
	sets.engaged.HighAcc.DTLite = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Twilight Torque",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
		
	sets.engaged.FullAcc.DTLite = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Combatant's Torque",
		waist="Kentarch Belt",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Defending Ring",
		right_ring="Cacoethic Ring +1",
		back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
	
    sets.engaged.Tank = {
		ammo="Staunch Tathlum",
		head="Meghanada Visor +2",
		body="Ayanmo Corazza +2",
		hands="Turms Mittens",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Futhark Torque +1",
		waist="Flume Belt",
		left_ear="Ethereal Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Defending Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},}
	
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		--set_macro_page(4, 19)
	elseif player.sub_job == 'RDM' then
		--set_macro_page(5, 19)
	elseif player.sub_job == 'SCH' then
		--set_macro_page(5, 19)
	elseif player.sub_job == 'BLU' then
		set_macro_page(2, 19)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 19)
	elseif player.sub_job == 'SAM' then
		set_macro_page(8, 19)
	elseif player.sub_job == 'DRK' then
		set_macro_page(9, 19)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 19)
	else
		set_macro_page(5, 19)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = (framerate * 3)
					return true
				else
					return false
				end
			end
		end
	end
	return false
end