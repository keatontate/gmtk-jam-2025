fish = {
    count = 0,
    happiness = 0
}

function fish_start()
    fish.count = 2
    fish.happiness = 10
    tank.max = 20
end

last_spawn_time = -1

function spawn_fish()
    if time() - last_spawn_time >= 20 and fish.happiness > 8 then
        fish.count *= 2
        last_spawn_time = time()
    end
end

tank = {
    max = 0
}

function digits(n)
    return #tostr(abs(n))
end

function format(n)
    if n >= 1000000 then
        return tostr(flr(n / 100000) / 10).."m"
    elseif n >= 1000 then
        return tostr(flr(n / 100) / 10).."k"
    else
        return tostr(n)
    end
end



function draw_count()
    local display = format(fish.count)
    print(display, 92 - #display * 2, 37, 0)
end