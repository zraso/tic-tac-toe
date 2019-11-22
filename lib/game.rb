# frozen_string_literal: true

require_relative 'player'

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
    @turn = if turn == "Player X's turn!"
              "Player O's turn!"
            else
              "Player X's turn!"
            end
  end

  def field_empty?(field)
    !((player_x.fields.include? field) || (player_o.fields.include? field))
  end
end
