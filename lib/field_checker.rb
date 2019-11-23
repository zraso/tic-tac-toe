# frozen_string_literal: true

class FieldChecker
  attr_reader :player_x, :player_o
  MAX_FIELDS = 9

  def initialize(player_x, player_o)
    @player_x = player_x
    @player_o = player_o
  end

  def empty?(field)
    !((player_x.fields.include? field) || (player_o.fields.include? field))
  end

  def all_taken?
    (player_x.fields.length + player_o.fields.length) >= MAX_FIELDS
  end
end
