# frozen_string_literal: true

require_relative 'player'

class Game
  attr_reader :player_x, :player_o, :current_player
  MAX_FIELDS = 9

  def initialize(player_x: Player.new('X'), player_o: Player.new('O'))
    @player_x = player_x
    @player_o = player_o
    @current_player = player_x
  end

  def start
    "Player #{@current_player.symbol}'s turn!"
  end

  def claim(field)
    raise 'Error: field already taken' unless field_empty?(field)
    current_player.claim(field)
    switch_turn
  end

  def switch_turn
    if current_player == player_x
      @current_player = player_o
    else
      @current_player = player_x
    end
    
    "Player #{@current_player.symbol}'s turn!"
  end

  def field_empty?(field)
    !((player_x.fields.include? field) || (player_o.fields.include? field))
  end

  def all_fields_taken?
    if (player_x.fields.length + player_o.fields.length) >= MAX_FIELDS
      true
    else
      false
    end
  end

end
