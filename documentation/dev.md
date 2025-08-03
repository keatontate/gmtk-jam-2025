# Developer notes

## Flags:
- `0`: Solid platform. Player can't pass through it.
- `1`: Ladder. Basically gravity and jumps turn off, they have freedom to move up or down
- `2`: Interactive object (upgrade tower)
- `3`: Shop
- `7`: loop right
- `6`: loop left

## sfx:
NOTE: Sound effects should use same channel as flags. for example ladder sfx is played on channel 1. 

## Sound Effects List:
- RREEAROW! - 00
- meow - 01
- ka-ching for fish sale - 02
- jump - 03
- splash (new fish) - 04
- fish bubbles - 05
- upgrade purchase - 06
- something borked - 07
- timer ticking - 08 
- ladder - 09
- button push - 10
- error - 11

# Todo
- Player state: falling, standing, walking, climbing, working
  - not only will this simplify player code but it will help us with animations later.

- Max tank capacity


# BUGS
- [X] Second-to-last row of the map is cut off..?
- [X] Player's hitbox is taller than their sprite. This is hard to fix, james should look at character.lua line 103:
```lua
pl.y = flr((new_y + pl.h) / 8) * 8 - 16
```
- [X] Player can sometimes glitch into floor when falling large distance on right side of map, maybe use `_update60()` for collision checking?
        Added a max velocity to prevent it -Jame
- [ ] Sfx all need separate channels, they are interrupting eachother
- [x] Sell function isn't quite right. It allows you to sell more than you have


# Releasing
1. capture label
```
sspr(8, 6, 8, 10, 5, 0, 120, 128)
```
2. capture label with fn + f7
3. export to html
```
export index.html
```
4. zip it up and put it on itch
```
folder
```

# Ideas:
- fire if machine leaves untouched for too long,
- flood if fish get too much
- Upgrades:
  - machines break less, but when they do they instantly cause a fire
  - fish spawn a lot faster for a brief period

- buy fish
  - one fish makes machines break way more but the fish cost more 