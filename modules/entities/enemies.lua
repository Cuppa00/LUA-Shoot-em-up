--enemies
function init_enemies()
    enemies = {}    -- collection of enemies
    attackfreq = 60 -- enemy attacks every 2 seconds (attackfreq/30)
    time = 0

    enemy_placement({             --10 by 3 level board where '0' is empty and other is type
        {1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1},
        {1,1,1,1,1,1,1,1,1,1}
    })
end


function update_enemies()
    time += 1

    for en in all(enemies) do
        for b in all(buls) do   --enemy bullet collision
            if (en.x-2<=b.x+6 and b.x<=en.x+8) and (en.y<=b.y+3 and b.y+3<=en.y+8) then
                sfx(1)  --explosion sfx                                                    
                del(enemies, en)    --delete enemy
                del(buls, b)    --delete missile
            end
        end

        if en.mission == 'attack' then  --enemy attack movement
            en.y += 1
        end
        if en.y > 128 then
            en.y = 0
            en.x = en.start_x
        elseif (en.y == en.start_y) and (en.x == en.start_x) then
            en.x = en.start_x
            en.y = en.start_y
            en.mission = 'wait'
        end
    end

    pick_enemy()
end


function draw_enemy()
	for en in all(enemies) do
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
            start_x = x,    --for resetting to rest after attack
            start_y = y,
            spr = 4,
            type = 1,
            mission = 'wait'
        }
        add(enemies, enemy)
    elseif type == 2 then   --enemy type 'red rocket'
        local enemy = {
            x = x,
            y = y,
            start_x = x,
            start_y = y,
            spr = 19,
            type = 2,
            mission = 'wait'
        }
        add(enemies, enemy) --adds to collection
    end
end


function enemy_placement(lvl_board) --function to take board and generate x, y and create ens
    for y=1,3 do    --amount of lines
        local myline = lvl_board[y] 
        for x=1,10 do
            if myline[x] !=0 then
                create_enemy(x*12-6, 5+y*10, myline[x])   --where type != 0 take type and create an enemy 5+y*10 4+y*12
            end
        end
    end
end


function pick_enemy()
    if time % attackfreq == 0 then  -- to space out enemies
        maximum = min(10,#enemies)
        pick_index = flr(rnd(maximum))    -- generate random number 0-9
        pick_index = #enemies - pick_index -- this index will be an enemy which is at the forefront from the player

        picked_enemy = enemies[pick_index]
        picked_enemy.mission = 'attack'
    end
end