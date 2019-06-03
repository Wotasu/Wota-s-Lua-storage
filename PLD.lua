----- Credit: Krystela of Asura | Last Update: 29 december 2015 ---->
---- .:: This was entirely created by me, it's not based off anyone's file ::. ---->
---- Always visit http://pastebin.com/u/KrystelaRose to look for possible updates ---->
---- .:: Please leave credit where it's due ::. ---->
---- .:: If you have any problem contact me via ffxiah: http://www.ffxiah.com/player/Asura/Krystela ::. ---->
                    ---- This lua was customly made for Cbbs of Asura ----

function user_unload()	
    send_command('unbind !f10')
    send_command('unbind !f11')	
    send_command('unbind !f12')		
	send_command('unbind !f1')
    send_command('unbind @1')		
end
function get_sets()
-- Binds for modes
	send_command('bind !f10 gs c C10')
	send_command('bind !f11 gs c C11')
	send_command('bind !f12 gs c C12')	
	send_command('bind !f1 gs c C1')
	send_command('bind @1 input /item "Remedy" <me>')	
-- Modes --
    TankIndex = 3
    TankArray = {"TP","PDT","MDT"} -- Press ctrl + F10 to circle through Tank modes --
	Capacity = 'OFF' -- Press ctrl + F11 to have Capacity cape on while Idle --
	DT = 'OFF' -- Press ctrl + F12 to have DT/Kiting on --
	Cursna = 'OFF'
-- Set macro book/set --
    send_command('input /macro book 6;wait .1;input /macro set 1') -- set macro book/set here --	
-- Spell Maps --
    BlueMagic = S{"Jettatura","Sheep Song","Soporific","Blank Gaze","Geist Wall"}	
-- Area mapping --	
    Town = S{"Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno","Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
	         "Port San d'Oria","Northern San d'Oria","Southern San d'Oria","Port Bastok","Bastok Markets","Bastok Mines","Metalworks","Aht Urhgan Whitegate",
	         "Tavnazian Safehold","Nashmau","Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Heavens Tower"}

---- .:: TP Sets ::. ----->
    sets.engaged = {}
	sets.engaged.TP = {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Creed Baudrier",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Sulevia's Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
	sets.engaged.PDT = {
		range=empty,
		ammo="Staunch Tathlum",		
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Creed Baudrier",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Sulevia's Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
	sets.engaged.MDT = {
		range=empty,
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Creed Baudrier",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Sulevia's Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
	

---- .:: Job Abilities Sets ::. ---->
    sets.JA = {}
    -- Warrior's Abilities --
    sets.JA['Provoke'] = {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonbeam Cape",} 
    -- Paladin's Abilities --
	sets.JA['Invicible'] = {
	    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Cab. Breeches +1", augments={'Enhances "Invincible" effect',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonbeam Cape",} 
	sets.JA['Holy Circle'] = {feet="Rev. Leggings +2",}
	sets.JA['Shield Bash'] = {
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonbeam Cape",
}
	sets.JA['Sentinel'] = {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonbeam Cape",}
	sets.JA['Cover'] = {}
	sets.JA['Rampart'] = {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonbeam Cape",}
  	sets.JA['Fealty'] = {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Caballarius Surcoat +1",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Friomisi Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
    back="Moonbeam Cape",}
	sets.JA['Chivalry'] = {}
	sets.JA['Divine Emblem'] = {}
---- .:: Weapon Skill Sets ::. ---->
    -- Generic Set --
     sets.WS = {
		head={name="Valorous Mask", augments={'STR+13',}},
		ammo="",
		neck="",
		ear1="",
		ear2="",		
		body="",
		hands="",
		ring1="",
		ring2="",	
		back={name="Rudianos's Mantle", augments={'STR+20',}},
		waist="",		
		legs="",
		feet=""}
	-- Specific Sets --
	sets.WS.CDC = set_combine(sets.WS, {
		feet="",
		head={name="Valorous Mask", augments={'AGI+4'}},
		waist="", 
		neck="",
		waist="",
		ring1="",
		ring2=""})
		
		
	sets.WS.Req = set_combine(sets.WS, {
		head="", 
		body="",
		hands="",
		legs="",
		neck="",
		waist=""})
	
---- .:: Precast Sets ::. ---->
	sets.precast = {}
	sets.precast.FC = {
	    ammo="Sapience Orb",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Rev. Surcoat +3",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Odyssean Cuisses", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Fast Cast"+5','CHR+10','Mag. Acc.+3','"Mag.Atk.Bns."+9',}},
    feet={ name="Odyssean Greaves", augments={'"Mag.Atk.Bns."+7','"Fast Cast"+6','AGI+8','Mag. Acc.+3',}},
    neck="Baetyl Pendant",
    waist={name="Steppe Sash",priority=1},
    left_ear={name="Etiolation Earring",priority=1},
    right_ear={name="Odnowa Earring +1",priority=1},
    left_ring="Kishar Ring",
    right_ring={name="Regal Ring",priority=1},
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},}
		
	sets.precast['Utsusemi'] = set_combine(sets.precast.FC, {})		
---- .:: Midcast Sets ::. ---->	
	sets.midcast = {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Nierenschutz",
		left_ear="Etiolation Earring",
		right_ear="Cryptic Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonbeam Cape",} 


    sets.midcast.Cure = sets.midcast
    sets.midcast.Enmity = sets.JA['Provoke']
    sets.midcast.SIRD = {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Ethereal Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonbeam Cape",} 
    sets.midcast.Cure = sets.midcast.SIRD

	
    sets.midcast['Flash'] = set_combine(sets.midcast.Enmity, {})
    sets.midcast.Divine = sets.JA['Provoke']	
    sets.midcast.Enhancing = {
		head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
    body={ name="Yorium Cuirass", augments={'Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Yorium Cuisses", augments={'Phalanx +3',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Twilight Torque",
    waist="Steppe Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Regal Ring",
    right_ring="Shneddick Ring",
    back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+2','Phalanx +3',}},}

	sets.midcast['Phalanx'] = {
	head={ name="Yorium Barbuta", augments={'Phalanx +3',}},
    body={ name="Yorium Cuirass", augments={'Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Yorium Cuisses", augments={'Phalanx +3',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Twilight Torque",
    waist="Steppe Sash",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Regal Ring",
    right_ring="Shneddick Ring",
    back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+2','Phalanx +3',}}, 
	}
	
	sets.midcast['Utsusemi'] = {}	
---- .:: Idle Sets ::. ---->
    sets.aftercast = {}
	sets.aftercast.Idle = {
	    range=empty,
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Nierenschutz",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Shneddick Ring",
		back="Rudianos's mantle",}
		
	sets.aftercast.Town = sets.aftercast.Idle, {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Carmine cuisses +1",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Nierenschutz",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Shneddick ring",
		back="Moonbeam Cape",}
	
	sets.aftercast.DT = set_combine(sets.aftercast.Idle, {
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3",
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Carmine cuisses +1",
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Twilight Torque",
		waist="Nierenschutz",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Sulevia's Ring",
		back="Moonbeam Cape",})
		
	sets.Cursna = {
		waist="Gishdubar Sash",
		ring1="Purity Ring",
		
	}	
	
end
---- .::Pretarget Functions::. ---->
function pretarget(spell,action)
-- Auto Echo drop --
    if spell.action_type == 'Magic' and buffactive['Silence'] then 
        cancel_spell()
        send_command('input /item "" <me>')
	end
end	
-- Precast Functions --
function precast(spell,action)
    -- Warrior Ability --
    if spell.english == 'Provoke' then
	    equip(sets.JA[spell.english])		
	-- Paladin Abilities --
	elseif spell.type == 'JobAbility' then
	    equip(sets.JA[spell.english])
	else
        equip(sets.JA)
	end	
    -- Weapon Skill --
    if spell.type == 'WeaponSkill' then
		equip(sets.WS)
    end
    if spell.name == 'Chant du Cygne' then
		equip(sets.WS.CDC)
    end
    if spell.name == 'Requiescat' then
		equip(sets.WS.Req)
    end	

	
	-- Magic Spells
    if spell.action_type == 'Magic' then	
	    equip(sets.precast.FC)
		if string.find(spell.english, 'Utsusemi') then
		    equip(sets.precast['Utsusemi'])
		end
	end	
end	
-- Midcast Functions --
function midcast(spell,action)
    if spell.skill == 'Divine Magic' then
	    equip(sets.midcast.Divine)
		if spell.english == 'Flash' then
		    equip(sets.midcast['Flash'])
	    elseif buffactive['Divine Emblem'] then
		    if spell.english == 'Flash' then
		        equip(sets.midcast['Flash'], {feet=""})
		    else
                equip(sets.midcast.Divine, {feet=""})
		    end
		end	
    elseif string.find(spell.english,'Cure') then
		equip(sets.midcast.Cure)
    elseif spell.type == 'Enhancing Magic' then
        equip(sets.midcast.Enhancing)
    elseif string.find(spell.english, 'Utsusemi') then
		equip(sets.midcast['Utsusemi'])
	elseif spell.type == 'Blue Magic' then
        equip(sets.midcast.SIRD)	
	end
end	
-- Aftercast Functions --
function aftercast(spell,action)
    if player.status == 'Idle' then
	    equip(sets.aftercast.Idle)
		if DT == 'ON' then
		    equip(sets.aftercast.DT)
		elseif Capacity == 'ON' then
            equip(sets.aftercast.Idle, {back="Aptitude Mantle"})
		end
	    status_change(player.status)		
	elseif player.status == 'Engaged' then
	    if TankArray[TankIndex] == 'TP' then
            equip(sets.engaged.TP)
			if buffactive['Doom'] then
			    equip(sets.engaged.TP, {ring=""})
			elseif buffactive['Cover'] then
			    equip(sets.engaged.TP, {head="",body=""})			
			elseif capacity == 'ON' then
			    equip(sets.engaged.TP, {back="Aptitude Mantle"})
			end
	    status_change(player.status)			
 	    elseif TankArray[TankIndex] == 'PDT' then      			
         	equip(sets.engaged.PDT)
			if buffactive['Doom'] then
			    equip(sets.engaged.PDT, {ring=""})			
			elseif buffactive['Cover'] then
			    equip(sets.engaged.PDT, {head="",body=""})
            end	
	    status_change(player.status)			
	    elseif TankArray[TankIndex] == 'MDT' then			
		    equip(sets.engaged.MDT)
			if buffactive['Doom'] then
			    equip(sets.engaged.MDT, {ring=""})			
			elseif buffactive['Cover'] then
			    equip(sets.engaged.MDT, {head="",body=""})
            end
	    status_change(player.status)			
		end
	    status_change(player.status)
	elseif Town:contains(world.zone) then
        equip(sets.aftercast.Town)
	    status_change(player.status)		
	end
end
-- Status Changes Functions --
function status_change(new,tab,old)	
    if new == 'Idle' then
	    equip(sets.aftercast.Idle)
		if DT == 'ON' then
		    equip(sets.aftercast.DT)
		elseif Capacity == 'ON' then
            equip(sets.aftercast.Idle, {back="Aptitude Mantle"})
		end		
	elseif new == 'Engaged' then
	    if TankArray[TankIndex] == 'TP' then
            equip(sets.engaged.TP)
			if buffactive['Doom'] then
			    equip(sets.engaged.TP, {ring=""})			
			elseif buffactive['Cover'] then
			    equip(sets.engaged.TP, {head="",body=""})
			elseif capacity == 'ON' then
			    equip(sets.engaged.TP, {back="Aptitude Mantle"})		
			end
 	    elseif TankArray[TankIndex] == 'PDT' then      			
         	equip(sets.engaged.PDT)
			if buffactive['Doom'] then
			    equip(sets.engaged.PDT, {ring=""})			
			elseif buffactive['Cover'] then
			    equip(sets.engaged.PDT, {head="",body=""})
			end	
	    elseif TankArray[TankIndex] == 'MDT' then			
		    equip(sets.engaged.MDT)
			if buffactive['Doom'] then
			    equip(sets.engaged.MDT, {ring=""})			
			elseif buffactive['Cover'] then
			    equip(sets.engaged.MDT, {head="",body=""})
			end	
		end
	elseif Town:contains(world.zone) then
        equip(sets.aftercast.Town)		
	end
end
-- Modes functions --
function self_command(command)	
	if command == 'C10' then -- Tank Cycle --
        TankIndex = (TankIndex % #TankArray) + 1
        status_change(player.status)
        add_to_chat(158,'Tank Set to: ' .. TankArray[TankIndex])			
    elseif command == 'C11' then -- Capacity toggle --
        if Capacity == 'ON' then
            Capacity = 'OFF'
            add_to_chat(123,'Capacity Set: [OFF]')
        else
            Capacity = 'ON'
            add_to_chat(158,'Capacity Set: [ON]')
        end
        status_change(player.status)
	elseif command == 'C12' then -- Defense Cycle --	
        if DT == 'ON' then
            DT = 'OFF'
            add_to_chat(123,'DT/Kiting Set: [OFF]')
        else
            DT = 'ON'
            add_to_chat(158,'DT/Kiting Set: [ON]')
	        equip(sets.aftercast.DT)			
        end
        status_change(player.status)		
	elseif command == 'C1' then
		if Cursna == 'ON' then
			Cursna = 'OFF'
			add_to_chat(123,'Cursna Set: [OFF]')
			enable('waist')
			enable('ring1')
		else
			Cursna = 'ON'
			add_to_chat(123,'Cursna Set: [ON]')
			equip(sets.Cursna)
			disable('waist')
			disable('ring1')
		end
		status_change(player.status)
	end
end	
-- Automatically changes Idle gears if you zone in or out of town --
windower.register_event('zone change', function()
	if Town:contains(world.zone) then
        equip(sets.aftercast.Town)
    else
        equip(sets.aftercast.Idle)
    end	
end)