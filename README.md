## Tic Tac Toe Tech Test
A common tech test that builds the business logic for a game of tic tac toe. It is easy implement a working game of tic tac toe by combining the code with any user interface, whether web or command line.

## How to install
1. Clone this repo
2. Run `bundle install`

## How to run tests
Run `rspec` to see *100% test coverage* and *all tests passing*.

## Development

### Process
I used test-driven development (TDD) to develop this program. My approach was to:

* Define user stories from the given requirements
* Define objects (classes) and methods needed to implement the user stories
* Plan the test cases needed to satisfy the user stories and acceptance criteria
* Perform manual and automated feature tests
* Apply the TDD cycle for each unit test case to develop the code

### Specifications and user stories

* There are two players in the game (X and O)

```
As a player,
So that I can play against someone else,
I want the game to start with two players
```

* Players take turns until the game is over

```
As a player,
So that I can play against my opponent,
I want to be able to switch turns
```

* A player can claim a field if it is not already taken

```
As a player,
So that I can play the game,
I want to be able to claim a field only if it is empty
```

* A turn ends when a player claims a field

```
As a player,
So my opponent can take their turn,
I want to switch turns after I claim a field
```

* A player wins if they claim all the fields in a row, column or diagonal

```
As a player,
So that I know I can win,
I want to check if my claim has completed a row, column or diagonal
```

* A game is over if a player wins

```
As a player,
So I know that the game is over,
I want to know if a player has won
```

* A game is over when all fields are taken

```
As a player,
So I know if the game is over,
I want to know if all the fields are taken
```