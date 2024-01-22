--game loop
function _init()	--initialise game (run once)
	poke(24365,1)	--mouse & key devkit
	init_player()
	init_missile()
	init_enemies()
end

function _update()	--update game (runs 30 times a second)
	move_player()
	update_missile()
	update_enemies()
end

function _draw()	--called once per visible frame
	cls(0)
	draw_player()
	draw_missile()
	draw_enemy()
	draw_lives(lives)
end