--lives indicator
function draw_lives(l)	--pass in amount of lives
	livesx = 0	--lives sprite indicator x starts at 0
	repeat
		spr(6, livesx, 120)	--draw sprite at 120 (bottom of screen)
		livesx+=8	--add 8 (width of sprite) so next sprite will be drawn to its side
		l -= 1	--take away from loop
	until l == 0	--end loop when l=0
end