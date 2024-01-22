--enemies
function init_enemies()
    enemies = {}    --collection of enemies

    enemy_board({             --10 by 3 level board where '0' is empty and other is type
        {0,0,1,1,1,1,1,1,0,0},
        {0,0,0,1,1,1,1,0,0,0},
        {0,0,0,0,2,2,0,0,0,0}
    })
end

function update_enemies()
    for en in all(enemies) do
        for b in all(buls) do   --enemy bullet collision
            if (en.x<=b.x+4 and b.x<=en.x+7) and en.y == b.y then -- where en.x < b.x < en.x+7
                sfx(1)  --explosion sfx
                del(enemies, en)
                del(buls, b)
            end
        end

        en.x += 0               --enemy movement
        if en.x > 120 then
            en.x = 0
        end
    end
end

function draw_enemy()
    for b in all(buls) do
        print(b.y)
    end
	for en in all(enemies) do
        print(en.y)
        spr_blink_spd = 0.0625  --enemy animation depending on type
        if en.type == 1 then
            en.spr += spr_blink_spd
            if en.spr >= 6 then
                en.spr = 4
            end
        elseif en.type == 2 then
            en.spr += spr_blink_spd
            if en.spr >= 21 then
                en.spr = 19
            end
        end 

		spr(en.spr, en.x, en.y)
	end
end

function create_enemy(x,y,type) --creates enemy as obj and adds to collection
    if type == 1 then   --basic enemy type 'blue fighter'
        local enemy = {
            x = x,
            y = y,
            spr = 4,
            type = 1
        }
        add(enemies, enemy)
    elseif type == 2 then   --enemy type 'red rocket'
        local enemy = {
            x = x,
            y = y,
            spr = 19,
            type = 2
        }
        add(enemies, enemy) --adds to collection
    end
end

function enemy_board(lvl_board) --function to take board and generate x, y and create ens
    for y=1,3 do    --amount of lines
        local myline = lvl_board[y] 
        for x=1,10 do
            if myline[x] !=0 then
                create_enemy(x*12-6, y*10, myline[x])   --where type != 0 take type and create an enemy
            end
        end
    end
end