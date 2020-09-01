# Classes

## Game

### Methods
init: Create players, create board
play: loops until board.is_full board.is_winner: board.draw. player1 choose. player2 choose.
the_winner_is

### Variables
board
player1
player2

## Player

### Methods
- init: choose names.
- chose_play 

### Variables
name
marc: circle or cross

## Board

### Methods
- initialize: creates de matrix 
- place_marc (marc): if not occupied places the marc and return true. If occupied returns false
- is_full: if all matrix is full returns true, else returns false
- draw: draws board content to screen
- has_winner: returns winner

### Variables
matrix = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]
