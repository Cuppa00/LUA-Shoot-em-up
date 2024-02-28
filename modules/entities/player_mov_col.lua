--player movement, draw & collison
function init_player() --initial player values
	pl = {}		--empty player table
	pl.w = 16	--width
	pl.x = 56	--start location
	pl.s = 3	--player speed
	lives = 3

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
end

function draw_player()
	spr(1, pl.x, 104, 2, 2)		--draw 4 sprites for 16x16 sprite
	spr(flame_spr, pl.x, 120, 2, 1)	--draw engine exhaust flames
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