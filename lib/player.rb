# frozen_string_literal: true

class Player
  attr_reader :fields, :symbol

  def initialize(symbol)
    @symbol = symbol
    @fields = []
  end

  def claim(field)
    @fields << field
    "#{field} claimed by Player #{@symbol}!"
  end

end
