# Developer notes

## Flags:
- `0`: Solid platform. Player can't pass through it.
- `1`: Ladder. Basically gravity and jumps turn off, they have freedom to move up or down
- `2`: Interactive object (upgrade tower)

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