<img width="689" alt="Screenshot 2022-01-30 at 23 39 07" src="https://user-images.githubusercontent.com/91621088/151722728-1c324f2c-841d-44c4-a855-62ca75a395dc.png">

<img width="290" alt="Screenshot 2022-01-27 at 23 56 18" src="https://user-images.githubusercontent.com/91621088/151462929-f3453e9a-8d7a-48c4-8527-c347105f29c7.png">

### Printing instructions

You will need to print the following from the STLs folder:

- plane.stl x1 for each player
- altitude.stl x4 for each player
- straight.stl x1 (or 1x for each player if you wish)
- bank.stl x1 (or 1x for each player if you wish)
- turn.stl x1 (or 1x for each player if you wish)
- statwheel_inner_axle.stl x1 for each player
- statwheel_outer_axle.stl x1 for each player
- statwheel_A.stl x1 for each player
- statwheel_D.stl x1 for each player
- statwheel_S.stl x1 for each player
- statwheel_H.stl x1 for each player

At 2mm layer height the number wheels can be printed no smaller than 85% or the charcaters don't print properly.
To adjust the tightness in the wheel, play around with "springWidth" variable around line 20 of the scad file.
Assemble to the stat wheel in the order ADSH (Attack, Defense, Speed, Health)

You will also need a piece of string more than 30cm long, and tie 2 knots 30cm apart for the range string.

### End Printing instructions

# Aeronauts

Welcome to Aeronauts! An aerial combat game you can fit in your pocket!

Each aeronaut will need:
x1 plane token, x4 altitude tokens
The aeronauts will share:
x1 of each move template, x1 range string (with 2 knots 23cm apart), x4 Red d8 Attack dice, x4 d8 Green Defense dice

At the start of the game each player secretly assigns the numbers 4,3,3,2 to their Attack, Defense, Speed & Health and simultaneously reveals their choices.

Determine who starts with a high roll of a d8.
Each player places their plane in front of them in turn, and not closer than the range string to another players’ token.

### There are 2 stages each round. Move & Attack:

## Move Stage:

- Players take turns to move their plane using the move templates, up to their Speed value. Each move template has a cost of 1, 2 or 3, for the straight, bank & turn templates respectively.
- To move, place the template at the front of the plane, and move the plane token to the other end of the template.
- The player may use templates up to the value of their speed, for example a plane with a Speed of 4 can use move execute 2 straight maneuvers & 1 bank maneuver.
- A player must move at least
  once each turn otherwise their plane will stall and they would plummet to the ground!

## Attack Stage:

- Players take turns to roll a number of Attack dice equal to your Attack value, while the defending plane rolls a number of Defense equal to their Defense value.
- Each value of 6-7 rolled on the Attack dice counts as 1 damage. An 8 rolled counts as a critical hit.
- Each value of 6-8 rolled on the Defense dice counts as a dodge and cancels out a hit. It takes 2 dodges to cancel out a critical hit.
- The defender loses Health equal to the hits that haven’t been canceled out.
- A player can only attack if the enemy plane is in range. Range is determined with the knots on the range string and measuring from the front arc of the attackers plane.

A new turn begins and the player who went second in the previous turn now goes first this turn.

## Altitude: (optional rule)

- At the start of the game each player takes off with 0 altitude tokens.
- Once per turn when a player moves, they may spend 1 speed to Climb and add 1 altitude token.
- On a turn they haven’t climbed, players may Dive by removing any number of altitude tokens to add that number to their speed for the turn.
  Beware the enemy in the sun! When rolling dice for the attack step, if the attacker is at a higher altitude they roll an additional die.

## Loop the Loop:

Any turn a player hasn’t executed a climb or dive, they may spend 3 altitude tokens to play their ship 180° (facing backwards). The Speed cost of the maneuver is doubles (the straight becomes a 2 etc)

Alright Aeronauts, let’s fly!
