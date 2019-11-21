class Player

  attr_reader :fields

  def initialize(symbol)
    @symbol = symbol
    @fields = []
  end

  def claim(field)
    @fields << field
    "#{field} claimed by Player #{@symbol}!"
  end

end