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

# Flight Academy

Welcome to Flight Academy! Let’s get you ready to be the ultimate pilot!

Each player will need:
x1 plane token, x4 altitude tokens, x1 stat wheel (dial with x4 1-9)
The players will share:
x1 of each move template, x1 range string (with 2 knots are 30cm apart), x4 Red d8 Attack dice, x4 d8 Green Defense dice

At the start of the game each player secretly sets their stat wheel to determine their Attack, Defense, Speed & Health values. They have 12 points to spend.

Each player takes it in turns to go first. Determine who starts with a high roll of a d8.
Each player places their ship in front of them in turn, and not closer than the range string to another players’ token.

There are 2 stages each round. Move & Attack:

## Move Stage:

- Players take turns to move their ship using the move templates, up to their Speed value. Each move template has a cost of 1, 2 or 3, for the straight, bank & turn templates respectively.
- To move, place the template at the front of the ship, and move the ship token to the other end of the template.
- The player may use templates up to the value of their speed, for example a Ship with a Speed of 4 can use the 2 straights & 1 bank
- A player must move at least once each turn.

## Attack Stage:

- Players take turns to roll a number of Attack dice equal to your Attack value, while the defending ship rolls a number of Defense equal to their Defense value.
- Each value of 6-7 rolled on the Attack dice counts as 1 damage. An 8 rolled counts as a critical hit.
- Each value of 6-8 rolled on the Defense dice counts as a dodge and cancels out a hit. It takes 2 dodges to cancel out a critical hit.
- The defender loses Health equal to the hits that haven’t been canceled out.
- A player can only attack if the enemy ship is in range. Range is determined with the knots on the range string and measuring from the front arc of the attackers ship.

A new turn begins and the player who went second in the previous turn now goes first this turn.

## End of the game:

The game ends when all but one player has been shot down (their Health reduced to 0). That player is victorious. They dance on the table (if it’s strong enough).

## Altitude: (optional rule)

- At the start of the game each player starts with no altitude tokens.
- Once per turn when a player moves, they may spend 1 speed to Climb and add 1 altitude token.
- On a turn they haven’t climbed, players may Dive by removing any number of altitude tokens to add that number to their speed for the turn.
- Finally, when rolling dice for the attack step, if the attacker is at a higher altitude they roll an additional die.

Alright pilot, let’s fly!
