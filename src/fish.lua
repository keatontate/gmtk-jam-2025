fish = {
    count = 0,
    thousand = 0,
    happiness = 0,
    happy_max = 10
}

tank = {
    max = 0
}

exponential = 1.05
rate = 1

fish_spread = 30


-- note: start with 2
fish_sprites = {
    {
        sprite = 186,
        x = 63 - (fish_spread/2) + rnd(fish_spread),
        y = 63 - (fish_spread/2) + rnd(fish_spread)
    },
    {
        sprite = 153,
        x = 63 - (fish_spread/2) + rnd(fish_spread),
        y = 63 - (fish_spread/2) + rnd(fish_spread)
    }
}


function fish_start()
    fish.count = 2
    fish.happiness = 10
    tank.max = 300
end

last_spawn_time = -1

function spawn_fish()
    if time() - last_spawn_time >= rate and fish.happiness > 8 and fish.count < tank.max then
        fish.count *= exponential
        last_spawn_time = time()
        if fish.count > 999 then
            fish.thousand += flr(fish.count / 1000)
            fish.count = fish.count % 1000
        end

        

    elseif time() - last_spawn_time >= rate and fish.happiness < 5 then 
        -- start to decrease fish
        fish.count /= exponential
        last_spawn_time = time()
    end

    
end

function happiness()
    broke = broke_count()
    if broke == 0 and fish.happiness < fish.happy_max then
        fish.happiness += 0.01
    else
        fish.happiness = fish.happiness - broke * 0.001
    end

end

function format(count, thousand)
        local total = thousand * 1000 + count
    if total < 1000 then
        return tostr(flr(total))
    elseif total < 10000 then
        local value = total / 1000
        local rounded = flr(value * 10 + 0.5) / 10
        return tostr(rounded).."k"
    else
        return tostr(flr(total / 1000)).."k"
    end
end

function draw_count()
    local display = format(fish.count, fish.thousand)
    print(display, 92 - #display * 2, 37, 0)
    happiness()
    print(fish.happiness, 15, 15, 0)
end


function draw_fish()
    -- ensure fish match how many they say

    -- get a left or right facing one
    local fsh_sprite = 186
    if (rnd() > 0.5) fsh_sprite = 153

    add(fish_sprites, {
        sprite = fsh_sprite,
        x = 63 - (fish_spread/2) + rnd(fish_spread),
        y = 63 - (fish_spread/2) + rnd(fish_spread)
    })
    while (#fish_sprites > fish.count + special_fish_count) do 
        del(fish_sprites, fish_sprites[#fish_sprites])
    end 

    for i=1, #fish_sprites do 
        local fsh = fish_sprites[i]
        spr(fsh.sprite, fsh.x, fsh.y)
        if (rnd() > 0.9) then 
            fsh.x += -0.5 + rnd()
        end
    end
end