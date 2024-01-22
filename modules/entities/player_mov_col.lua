--player movement, draw & collison
function init_player() --initial player values
	pl = {}		--empty player table
	pl.w = 16	--width
	pl.x = 56	--start location
	pl.s = 4	--player speed
	lives = 3
end

function move_player() --movement
	pl.ox = pl.x	--old x value for collision
	if btn(1) then	--left
    	pl.x += pl.s
  	elseif btn(0) then	--right
    	pl.x -= pl.s
	end

	if map_collide(pl.x, pl.w) then	--call collision function
		pl.x = pl.ox	--if function return true then set players x to old x
	end
end

function draw_player()
	spr(1, pl.x, 104, 2, 2)	--draw 4 sprites for 16x16 sprite
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