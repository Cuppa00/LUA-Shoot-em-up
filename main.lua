--game loop
function _init()	--initialise game (run once)
	poke(24365,1)	--mouse & key devkit
	init_player()
	init_missile()
	init_enemies()
	init_starfield()
end

function _update()	--update game (runs 30 times a second)
    time += 1		--time counter
	update_player()
	update_missile()
	update_enemies()
	update_starfield()
end

function _draw()	--called once per visible frame
	cls(0)
	draw_starfield()
	draw_missile()
	draw_enemy()
	rectfill(0,120,128,128,0)	--fill box behind lives indicator
	draw_player()
	draw_lives(lives)
	if false then
		debug()
	end
end