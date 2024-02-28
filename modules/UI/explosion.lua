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
    ex_sprites = {35, 37, 39, 41, 43}
    for ex in all(explosions) do
        if ex.age == 1 then
           sfx(1)  --explosion sfx
        end

        if ex.age % 1 == 0 then
            ex_spr = ex_sprites[ex.age]
            printh(ex_spr)
        end

        spr(ex_spr, ex.x-4, ex.y-4, 2, 2)
        ex.age += 0.5
    end
end

function explosion(spawn_x, spawn_y) --create the explosion
    local ex = {
        x = spawn_x,
        y = spawn_y,
        age = 1
    }

    add(explosions, ex)
end
