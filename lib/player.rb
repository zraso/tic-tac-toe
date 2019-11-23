# frozen_string_literal: true

require_relative 'win_calculator'

class Player
  attr_reader :fields, :symbol, :win

  def initialize(symbol)
    @symbol = symbol
    @fields = []
    @win = false
  end

  def claim(field)
    @fields << field
    check_winner
  end

  private
  
  def check_winner
    @win = CalculateWinner.new.check(self)
  end

end
