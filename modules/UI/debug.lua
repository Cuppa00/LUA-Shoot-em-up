function draw_debug()
    if false then   --screen centre
        rectfill(62,0,65,128,3)
        rectfill(0,62,128,65,3)
        rectfill(0,30,128,33,5)
    end

    -- rect(60,60,68,68,11)
    -- rect(58,60,62,68,7)
    -- rect(66,60,70,68,3)
    -- rect(60,68,68,72,7)
    -- spr(3, 60, 65)
    
    if false then -- print bullet x and y
        for x in all(buls) do   --print all bullet y
            printh(x.y)
        end
    end

    if false then
        for y in all(enemies) do    --print enemy y
            --printh('mission: '..y.mission)
            printh('y_pos: '..y.y)
        end
    end

    
    x = 1
    if true then
        for p in all(enemies) do    --print enemy speed of y
            printh('enemy '..x..' '..p.y)
            if x == 3 then
                x = 1
            else
                x += 1
            end
        end
    end
end

function update_debug() --activate explosion
    if btnp(2) then
        explosion(60, 60)
    end
end