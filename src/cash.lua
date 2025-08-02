cash = 0

function start_cash()
    cash = 0
end

last_sell = -1

function sell(n)
    if time() - last_sell >= 1 then
        last_sell = time()
        if fish.count > 3 then
            fish.count -= n
            cash += n
        end
    end
end

function autosell()
    -- testing
    if fish.count > 10 then 
        sell(5)
        sfx(2)
    end
    -- if fish.count > 7500 then
    --     sell(1000)
    -- elseif fish.count > 1500 then
    --     sell(5)
    -- elseif fish.count > 500 then
    --     sell(1)
    -- else
    --     sell(0)
    -- end
end
    

function draw_cash()
    print("cash: " .. cash, 15, 7)
end 