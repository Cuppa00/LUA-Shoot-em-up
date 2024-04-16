function draw_end()
    print('game over',46,61,7)
end

circle = {
    x = 64,
    y = 64,
    r = 100,
    draw = true
}

function update_fade()
    circle.r -= 4
    if circle.r == 0 then
        circle.draw = false
    end
end

function draw_fade()
    if circle.draw == true then
        circfill(circle.x,circle.y,circle.r,0)
    end
end