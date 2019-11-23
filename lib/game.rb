# frozen_string_literal: true

require_relative 'player'
require_relative 'win_calculator'
require_relative 'field_checker'

class Game
  attr_reader :player_x, :player_o, :current_player, :over

  def initialize(player_x: Player.new('X'), player_o: Player.new('O'))
    @player_x = player_x
    @player_o = player_o
    @current_player = player_x
    @over = false
    @field_checker = FieldChecker.new(player_x, player_o)
  end

  def claim(field)
    raise 'Error: field already taken' unless @field_checker.empty?(field)

    current_player.claim(field)
    over?
    switch_turn
  end

  def switch_turn
    @current_player = if current_player == player_x
                        player_o
                      else
                        player_x
                      end
  end

  def over?
    @over = @field_checker.all_taken?
    @over = current_player.win
  end
end
