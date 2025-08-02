fish = {
    count = 0,
    thousand = 0,
    happiness = 0
}

function fish_start()
    fish.count = 2
    fish.happiness = 10
    tank.max = 20
end

last_spawn_time = -1

function spawn_fish()
    if time() - last_spawn_time >= 1 and fish.happiness > 8 then
        fish.count *= 1.05
        last_spawn_time = time()
        if fish.count > 999 then
            fish.thousand += flr(fish.count / 1000)
            fish.count = fish.count % 1000
end
    end
end

tank = {
    max = 0
}

function digits(n)
    return #tostr(abs(n))
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
end