--starfield
--random pick x and y add object to array, iterate through objects and pset to screen.
function init_starfield()
    foreground = {}
    background = {}
    for x=0,35 do
        create_stars('front')
    end
    for x=0,25 do
        create_stars('back')
    end
    star_placements()
end

function update_starfield()     --star movement
    for fore in all(foreground) do 
        fore.y += fore.spd
        if fore.y > 128 then fore.y = 0
        end
    end
    for back in all(background) do 
        back.y += back.spd
        if back.y > 128 then back.y = 0
        end
    end
end

function draw_starfield()       
    for fore in all(foreground) do
        pset(fore.x, fore.y, 7) --pset sets a pixel
    end
    for back in all(background) do 
        pset(back.x, back.y, 1)
    end
end

function create_stars(type) --creates star objects
    if type == 'front' then
        local star = {
            x = 0,
            y = 0,
            spd = 1
        }
        add(foreground, star)
    elseif type == 'back' then
        local star = {
            x = 0,
            y = 0,
            spd = 0.5
        }
        add(background, star)
    end
end

function star_placements()  --generates a stars coords
    loop_end = false
    while loop_end == false do 
        for fore in all(foreground) do
            fore.x = flr(rnd(128))
            fore.y = flr(rnd(128)) 
        end
        for back in all(background) do
            back.x = flr(rnd(128))
            back.y = flr(rnd(128))   
        end
        loop_end = true
    end
end