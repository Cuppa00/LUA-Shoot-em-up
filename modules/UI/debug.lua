function draw_debug()
    if false then
        rect(pl.x,104,pl.x,104,7)
    end

    if true then   --screen centre
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
    if false then
        for p in all(enemies) do    --print enemy speed of y
            printh('enemy '..x..' '..p.y)
            if x == 3 then
                x = 1
            else
                x += 1
            end
        end
    end

    col = 9
    if false then
        for en in all(enemies) do

            -- if col > 10 then
            --     col = 8
            -- else col += 1 end
            if en.type == 2 then
                line(en.x+4, en.y+4, pl.x+8, 112, 7) -- hyp
                line(en.x+4, en.y+4, en.x+4, 112, 8) -- vertical
                line(en.x+4, 112, pl.x+8, 112, col) -- hori
            end

            -- vertical = 112 - en.y
            -- horizontal = pl.x - en.x
            -- hypo_length = sqrt(vertical^2 + horizontal^2)
            -- temp = (1/hypo_length)*-horizontal
            -- angle = asin(temp) -- = atan2(horizontal, vertical)

            -- new_horizontal = 2 * sin(angle)
            -- new_vertical = sqrt(4-new_horizontal) - 0.3
            -- new_hypo_length = sqrt(new_horizontal^2 + new_vertical^2)

            -- print('vertical: '..vertical, 8)
            -- print('horizontal: '..horizontal, 8)
            -- print('hypotenuse: '..hypo_length, 8)
            -- print('angle: '..angle)

            -- print('')

            -- print('new vertical: '..new_vertical, 9)
            -- print('new horizontal: '..new_horizontal, 9)
            -- print('new hypotenuse: '..new_hypo_length, 9)

            -- b^2 = sqrt(c^2 - a^2)
            --flr((x + 4)>>3)<<3
        end
    end

end

function update_debug() --activate explosion
    if false and btnp(2) then
        explosion(60, 60)
    end
end


   
function asin(y)
    return atan2(sqrt(1-y*y),-y)
end