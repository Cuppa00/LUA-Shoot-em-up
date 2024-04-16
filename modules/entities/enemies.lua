--enemies
function init_enemies()
    enemies = {}    -- collection of enemies
    attackfreq = 30 -- enemy attacks per sec (attackfreq/30) (secs*30)
    time = 0

    enemy_placement({             --10 by 3 level board where '0' is empty and other is type
        {1,1,1,1,1,1,1,1,1,1},    --0,0,0,0,0,0,0,0,0,0
        {0,1,1,1,2,2,1,1,1,0},    --1,1,1,1,1,1,1,1,1,1
        {0,0,2,1,1,1,1,2,0,0}
    })
end


function update_enemies()
    for en in all(enemies) do
        for b in all(buls) do   --enemy bullet collision
            if (en.x-2<=b.x+6 and b.x<=en.x+8) and (en.y<=b.y+3 and b.y+3<=en.y+8) then  
                explosion(en.x, en.y, 1)                                                  
                del(enemies, en)    --delete enemy
                del(buls, b)    --delete missile
            end
        end

        if ship_en_col(en, pl) then --enemy ship collision
            explosion(pl.x, pl.y, 2)
            ship_dead()
            del(enemies, en)
        end

        if en.y > 128 then
            en.y = 0
            en.x = en.start_x
            if #enemies>3 then          
                en.mission = 'attack_1'
                en.passed_y = true
            end
        elseif (en.start_y<=en.y+1 and en.start_y>=en.y-1) and (en.x == en.start_x) and en.passed_y == true then
            en.x = en.start_x
            en.y = en.start_y
            en.mission = 'wait'
            en.passed_y = false
            en.picked = false
        elseif en.mission == 'attack_1' then
            attack_1(en)
        elseif en.mission == 'attack_2' then
            attack_2(en)
        elseif en.mission == 'attack_3' then
            attack_3(en)
        end
    end

    if #enemies != 0 then
        pick_enemy()
    end
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
            spd = 2,
            mission = 'wait',
            passed_y = false,
            picked = false
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
            spd = 2,
            mission = 'wait',
            passed_y = false,
            picked = false
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
    if time % attackfreq == 0 and pl.destroyed != true then  -- to space out enemy attacks
        maximum = min(10,#enemies)
        pick_index = flr(rnd(maximum))    -- generate random number 0-9
        pick_index = #enemies - pick_index -- this index will be an enemy which is at the forefront from the player

        picked_enemy = enemies[pick_index]
        if picked_enemy.type == 1 and picked_enemy.picked == false then
            local random = flr(rnd(10))
            if random < 4 and #enemies > 3 then
                picked_enemy.mission = 'attack_1'
                picked_enemy.picked = true
            elseif random >= 4 then 
                picked_enemy.mission = 'attack_2'
                picked_enemy.picked = true
            end
        elseif picked_enemy.type == 2 and picked_enemy.picked == false then
            picked_enemy.mission = 'attack_3'
            picked_enemy.picked = true
        end
    end
end

--enemy attack sequences
function attack_1(en) --head on attack
    en.y += en.spd
end


function attack_2(en) --wavy attack
    en.x += cos(time/45)
    en.y += en.spd

    --force enemies towards centre
    if en.x<32 then
        en.x += 1-(en.x/32)
    elseif en.x>88 then
        en.x -= (en.x-88)/32
    end
end


function attack_3(en) --diagonal attack 
    vertical = 112 - en.y   --b^2 = sqrt(c^2 - a^2)
    horizontal = pl.x+4 - en.x
    angle = asin((1/sqrt(vertical^2 + horizontal^2))*-horizontal) -- = sin^-1()
                                                                  -- get angle between enemy and vertical
    new_horizontal = en.spd * sin(angle)                          -- see debug
    new_vertical = sqrt(en.spd^2-new_horizontal) - 0.3

    en.x += new_horizontal
    en.y += new_vertical
end

function asin(y)
    return atan2(sqrt(1-y*y),-y)
end
