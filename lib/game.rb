# frozen_string_literal: true

require_relative 'player'

class Game
  attr_reader :player_x, :player_o, :turn

  def initialize(player_x: Player.new('X'), player_o: Player.new('O'))
    @player_x = player_x
    @player_o = player_o
    @turn = @player_x
  end

  def start
    "Player #{@turn.symbol}'s turn!"
  end

  def switch_turn
    if turn == player_x
      @turn = player_o
    else
      @turn = player_x
    end
    
    "Player #{@turn.symbol}'s turn!"
  end

  def field_empty?(field)
    !((player_x.fields.include? field) || (player_o.fields.include? field))
  end

  # def claim(field)
  #   raise error unless field_empty?(field)
  #   @turn.claim(field)
  # end

end
