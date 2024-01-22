--missiles
function init_missile()
	fire_rate = 2 --how bullets allowed on screen
	buls = {}	--create empty table
end				--buls 'bullets'

function update_missile()
	if btnp(4) and count(buls) < fire_rate then	--when z/c pressed call function and pass players x value
		shoot(pl.x)
	end
	
	for b in all(buls) do --call all b values from table
		--bullet logic
		b.y -= b.spd	--take away b speed from b y to make missile move up

		if b.y < 0 then	--when missile goes off screen delete it
			del(buls, b)	--delete first added value from table
		end
	end
end

function draw_missile()
	for b in all(buls) do
		spr(3, b.x, b.y)	--draw bullet sprite at b x and b y
	end
end

function shoot(x)	--function pass in x
	add(buls, {	--add these values to table
		x = x + 4,
		y = 100,
		spd = 5	 --bul speed (def 4)
	})
end