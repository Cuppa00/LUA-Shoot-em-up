--enemies
function init_enemies()
    enemies = {}    --collection of enemies

    start_x = 30
    for y=0,3 do
        create_enemy(start_x,60,1)
        start_x += 16
    end
end

function update_enemies()
    for en in all(enemies) do
        for b in all(buls) do   --enemy bullet collision
            if (b.x<=en.x+7 and b.x+4>=en.x) and en.y == b.y then -- where en.x < b.x < en.x+7
                del(enemies, en)
                del(buls, b)
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

function create_enemy(x,y,type) --creates enemy as obj and adds to collection
    if type == 1 then   --basic enemy 'blue fighter'
        enemy = {}
        enemy.x = x
        enemy.y = y
        enemy.spr = 4
    end

    add(enemies, enemy) --adds to collection
end