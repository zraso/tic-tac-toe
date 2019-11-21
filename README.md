## Try our Tic Tac Toe Tech Test!
This is a very common tech test as it demonstrates a candidate's knowledge of basic data structures.

## The brief
The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)

As a player,
So that I can play against someone else,
I want to know what symbol I am using

* Players take turns until the game is over

As a player,
So that I can play against my opponent,
I want to be able to take turns

* A player can claim a field if it is not already taken

As a player,
So that I can play the game,
I want to be able to claim an empty field

* A turn ends when a player claims a field

As a player,
So my opponent can take their turn,
I want to switch turns after I claim a field

* A player wins if they claim all the fields in a row, column or diagonal

As a player,
So that I know I can win,
I want to check if my claim has completed a row, column or diagonal

* A game is over if a player wins
As a player,
So I know that the game is over,
I want to know if a player has won

* A game is over when all fields are taken
As a player,
So I know if the game is over,
I want to know if all the fields are taken

Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.

OBJECT    |      MESSAGES
Player          Symbol, Claim(field), Fields_taken          
Game            New.Player, Check_if_empty, Switch_turn, Check_claim_wins?, All_fields_taken?

# Example Game

## Player initialises new game
Game = Game.new

## Player starts game
New_Player => X
New_Player => O
=> "Player X's turn"

## First player claims a field
X.claim('A1')
Game.check_if_empty -> Game.Field_A1.empty? => True -> Game.Field_A1.empty? => False
Game.check_claim_wins -> False
Game.switch_turn => "Player O's turn!"

## Second player claims a field
O.claim('B2')
Game.check_if_empty -> Game.Field_A1.empty? => True -> Game.Field_B2.empty? => False
Game.check_claim_wins -> False
Game.switch_turn => "Player X's turn!"

## First player claims a taken field, sees error, then claims an empty field
O.claim('B2')
Game.check_if_empty -> Game.Field_A1.empty? => False => Error: Choose another field
O.claim('A2')
Game.check_if_empty -> Game.Field_A2.empty? => True -> Game.Field_A2.empty? => False
Game.check_claim_wins -> False
Game.switch_turn => "Player X's turn!"

## Second player claims a field
X.claim('B2')
Game.check_if_empty -> Game.Field_B3.empty? => True -> Game.Field_B3.empty? => False
Game.check_claim_wins -> False
Game.switch_turn => "Player O's turn!"

## First player wins
O.claim('A3')
Game.check_if_empty -> Game.Field_A3.empty? => True -> Game.Field_B3.empty? => False
Game.check_claim_wins -> True
Game.Over? => True => "PLAYER O WINS!"

## All fields taken
O.claim('A3')
Game.check_if_empty -> Game.Field_A3.empty? => True -> Game.Field_B3.empty? => False
Game.check_claim_wins -> False
Game.all_fields_taken? -> True
Game.Over? => True => "All fields taken, game over!"









