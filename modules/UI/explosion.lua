--explosions
function init_explosion()
    explosions = {}
end

function update_explosion()
    for expl in all(explosions) do
        if expl.age == 6 then  -- for age % 1 this should be a 6
            del(explosions, expl)
        end
    end
end

function draw_explosion()
    --ex_sprites = {35, 37, 39, 41, 43}
    ex_sprites = {24, 40, 56, 72, 88}
    for ex in all(explosions) do
        if ex.age == 1 then
           sfx(1)  --explosion sfx
        end

        if ex.age % 1 == 0 then
            ex_spr = ex_sprites[ex.age]
        end

        --spr(ex_spr, ex.x-4, ex.y-4, 2, 2)    
        sspr(ex_spr, 16, 16, 16, ex.x-(4*ex.size), ex.y-(4*ex.size),16*ex.size,16*ex.size)    
        ex.age += 0.5
    end
end

function explosion(spawn_x, spawn_y, ex_size) --create the explosion
    local ex = {
        size = ex_size,
        x = spawn_x,
        y = spawn_y,
        age = 1
    }

    add(explosions, ex)
end
