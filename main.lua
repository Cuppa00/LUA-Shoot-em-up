--game loop
function _init()	--initialise game (run once)
	poke(24365,1)	--mouse & key devkit
	init_player()
	init_missile()
	init_enemies()
	init_starfield()
	init_explosion()
end

function _update()	--update game (runs 30 times a second)
    time += 1		--time counter
	update_player()
	update_missile()
	update_enemies()
	update_starfield()
	update_explosion()
	if true then
		update_debug()
	end
end

function _draw()	--called once per visible frame
	cls(0)
	draw_starfield()
	draw_missile()
	draw_enemy()
	rectfill(0,120,128,128,0)	--fill box behind lives indicator
	draw_player()
	draw_lives(lives)
	draw_explosion()
	if false then
		draw_debug()
	end
end