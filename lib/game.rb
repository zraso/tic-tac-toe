require 'player'

class Game

  attr_reader :player_x, :player_o, :turn

  def initialize(player_x: Player.new('X'), player_o: Player.new('O'))
    @player_x = player_x
    @player_o = player_o
    @turn = "Player X's turn!"
  end

  def start
    "Player X's turn!"
  end

  def switch_turn
    if turn == "Player X's turn!"
      @turn = "Player O's turn!"
    else
      @turn = "Player X's turn!"
    end
  end

end