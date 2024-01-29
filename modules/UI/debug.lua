function debug()
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

    if true then
        for y in all(enemies) do    --print enemy y
            printh('mission: '..y.mission)
        end
    end
end