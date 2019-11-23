# frozen_string_literal: true

require_relative 'player'

class Game
  attr_reader :player_x, :player_o, :current_player, :winner

  def initialize(player_x: Player.new('X'), player_o: Player.new('O'), winner: CalculateWinner.new)
    @player_x = player_x
    @player_o = player_o
    @current_player = player_x
    @winner = winner
    @field_checker = FieldChecker.new(player_x, player_o)
  end

  def start
    "Player #{@current_player.symbol}'s turn!"
  end

  def claim(field)
    raise 'Error: field already taken' unless @field_checker.empty?(field)

    current_player.claim(field)
    switch_turn
  end

  def switch_turn
    @current_player = if current_player == player_x
                        player_o
                      else
                        player_x
                      end

    "Player #{@current_player.symbol}'s turn!"
  end
end
