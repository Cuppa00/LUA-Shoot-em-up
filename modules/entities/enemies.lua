--enemies
function init_enemies()
    enemies = {}

    en = {}
    en.x = 0
    en.y = 20
    en.spr = 4

    add(enemies, en)
end

function update_enemies()
    for en in all(enemies) do
        for b in all(buls) do   --enemy bullet collision
            if (b.x<=en.x+7 and b.x+4>=en.x) and en.y == b.y then -- where en.x < b.x < en.x+7
                del(enemies, en)
            end
        end

        spr_blink_spd = 0.0625  --enemy animation
        en.spr += spr_blink_spd
        if en.spr >= 6 then
            en.spr = 4
        end

        en.x += 1               --enemy movement
        if en.x > 120 then
            en.x = 0
        end
        spr(en.spr, en.x, en.y)
    end
end

function draw_enemy()
	for en in all(enemies) do 
		spr(en.spr, en.x, en.y)
	end
end