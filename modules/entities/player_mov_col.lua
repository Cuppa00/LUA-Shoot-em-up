--player movement, draw & collison
function init_player() --initial player values
	pl = {	--player table
		w = 16,	--width
		x = 56,	--start location
		y = 104,
		s = 3,	--player speed
		res_t = 0, --respawn timer
		lives = 3,
		godmode = false,
		destroyed = false
	}
	
	flame_time = 0
end

function update_player() --movement
	pl.ox = pl.x	--old x value for collision
	if btn(1) then	--left
    	pl.x += pl.s
  	elseif btn(0) then	--right
    	pl.x -= pl.s
	end

	if flame_time <= 8 then --ships exhaust
		flame_spr = 21
		flame_time += 1
	elseif flame_time > 8 and flame_time <= 16 then 
		flame_spr = 254
		flame_time += 1
	else flame_time = 0 end

	if map_collide(pl.x, pl.w) then	--call collision function
		pl.x = pl.ox	--if function return true then set players x to old x
	end

	respawn()
end

function draw_player()
	if pl.destroyed != true then
		spr(1, pl.x, 104, 2, 2)		--draw 4 sprites for 16x16 sprite
		spr(flame_spr, pl.x, 120, 2, 1)	--draw engine exhaust flames
	end
end

function map_collide(x, w)	--collision
	l = x	--left of sprite
	r = x + w	--right of sprite
	if l < 0 or r > 128 then
		return true
	else
		return false
	end	  
end

function ship_en_col(en, pl)
	if pl.godmode != true then
		if (en.x<=pl.x+16 and en.x+4>=pl.x) and (en.y+4>104 and en.y<=120) then
			return true
		else
			return false
		end
	else
		return false
	end
end

function ship_dead()
	pl.destroyed = true
	pl.x = 500
	pl.y = 500
	pl.lives -= 1
end

waiting = false
enemies_waiting = 0
function respawn()
	if pl.destroyed == true then
		for en in all(enemies) do
			if en.mission == 'wait' then
				enemies_waiting += 1
			end
			if enemies_waiting == count(enemies) then
				waiting = true
			elseif enemies_waiting > count(enemies) then
				enemies_waiting = 0
			end
		end

		if pl.lives != 0 and waiting == true then
			if pl.res_t == 75 then
				pl.destroyed = false
				waiting = false
				pl.res_t = 0
				pl.x = 56
				pl.y = 104
			else
				pl.res_t += 1
			end
		elseif pl.lives == 0 then
			if pl.res_t == 45 then
				pl.res_t = 0
				gameend = true
			else
				pl.res_t += 1
			end
		end
	end
end
