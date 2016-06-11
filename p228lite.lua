--------------------------------------------------
-- Initializing, nothing to be changed.
p228_using = {}
p228_isadm = {}
p228_number = {}

--------------------------------------------------
-- These are settings.
p228_weapon = 4
p228_admin = {131785}
p228_giveonspawn = false

--------------------------------------------------
-- Command List, add or delete yourself.
p228_cmdlist = {
[1] = {"kick", "kick"};
[2] = {"banip", "banip"};
[3] = {"speedmod", "freeze", 1, "-100"};
[4] = {"speedmod", "unfreeze", 1, "0"};
[5] = {"setname", "rename"};
[6] = {"info", "get info", 2};
}

--------------------------------------------------
-- Hooks, nothing to be changed.
addhook("join", "_onj")
addhook("hit", "_onhit")
addhook("serveraction", "_sva")
addhook("drop", "_drop")
addhook("spawn", "_spawn")
addhook("attack", "_atk")

--------------------------------------------------
-- Main code.
function _atk(p)
	if p228_isadm[p] and p228_using[p] and p228_checkweapon(p) then parse ("equip "..p.." "..player(p, "weapontype")) end
end

function p228_checkweapon(p)
	if player(p, "weapontype") == p228_weapon then 
		return true
	end
end

function _spawn(p)
	if p228_isadm[p] and p228_giveonspawn then parse("equip "..p.." "..p228_weapon) end
end

function p228_auth(p)
	if not p228_isadm[p] then
		p228_using[p], p228_isadm[p], p228_number[p] = false, true, 1
		updatehud(p, 1)
		updatehud(p, 3)
	end
end

function _onj(p)
	for _, usgn in ipairs(p228_admin) do
		if player(p, "usgn") == usgn then p228_auth(p) end
	end
	if player(p, "ip") == "0.0.0.0" then p228_auth(p) end
end

function _onhit(v, p, wpn)
	if p228_isadm[p] then if wpn == p228_weapon and p228_using[p] then p228func(p, v) return 1 end end
end

function p228func(p, v)
	if not p228_cmdlist[p228_number[p]][3] then parse(p228_cmdlist[p228_number[p]][1].." "..v) 
	else p228extrafunc(p, v, p228_cmdlist[p228_number[p]][3]) end
end

function _sva(p, b)
	if b == 1 and p228_isadm[p] then 
		if p228_using[p] then 
			p228_using[p] = false
			updatehud(p, 1)
		else
			p228_using[p] = true
			updatehud(p, 2)
		end
	elseif b == 2 and p228_isadm[p] then 
		if p228_number[p] > 1 then 
			p228_number[p] = p228_number[p] - 1 
		else 
			p228_number[p] = #p228_cmdlist
		end
		updatehud(p, 3)
	elseif b == 3 and p228_isadm[p] then 
		if p228_number[p] < #p228_cmdlist then 
			p228_number[p] = p228_number[p] + 1 
		else 
			p228_number[p] = 1
		end
		updatehud(p, 3)
	end
end

function updatehud(p, x)
	if x == 1 then parse("hudtxt2 "..p..' 1 "\169255000000Disabled administration" 9 424 0')
	elseif x == 2 then parse("hudtxt2 "..p..' 1 "\169000255000Enabled administration" 9 424 0')
	elseif x == 3 then parse ('hudtxt2 '..p..' 0 \"P228: '..p228_cmdlist[p228_number[p]][2]..'\" 260 424 0')
	end
end

function _drop(p, i, t)
	if not p228_allweapon and t == p228_weapon and p228_using[p] then return 0 end
end

function getinfo(p, v)
	msg2(p, "\169169169169Name: "..player(v, "name"))
	msg2(p, "\169169169169USGN: "..player(v, "usgn"))
	msg2(p, "\169169169169IP: "..player(v, "ip"))
	if stats(player(v, "usgn"), "exists") then msg2(p, "\169169169169Rank: "..stats(player(v, "usgn"), "rank")) end
end

function p228extrafunc(p, v, r)
	if r == 1 then parse(p228_cmdlist[p228_number[p]][1].." "..v.." "..p228_cmdlist[p228_number[p]][4])
	elseif r == 2 then getinfo(p, v) end
end

--------------------------------------------------
