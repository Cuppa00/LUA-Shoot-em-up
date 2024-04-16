--game loop
function _init()	--initialise game (run once)
	poke(24365,1)	--mouse & key devkit
	init_player()
	init_missile()
	init_enemies()
	init_starfield()
	init_explosion()
	gameend = false
end

function _update()	--update game (runs 30 times a second)
    time += 1		--time counter
	if gameend != true then
		update_player()
		update_missile()
		update_enemies()
	elseif gameend == true then
		update_fade()
	end
	update_explosion()
	update_starfield()
	if true then
		update_debug()
	end
end

function _draw()	--called once per visible frame
	cls(0)
	if false then
		draw_debug()
	end
	draw_starfield()
	if gameend != true then
		draw_missile()
		draw_enemy()
		rectfill(0,120,128,128,0)	--fill box behind lives indicator
		draw_player()
		draw_lives(pl.lives)
	else
		draw_end()
		draw_fade()
	end
	draw_explosion()
end