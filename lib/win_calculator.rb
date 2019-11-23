class CalculateWinner

  def initialize
    @win_rules = [['A1', 'B2', 'C3'],
    ['A3', 'B2', 'C1'],
    ['A1', 'B1', 'C1'],
    ['A2', 'B2', 'C2'],
    ['A3', 'B3', 'C3'], 
    ['A1', 'A2', 'A3'], 
    ['B1', 'B2', 'B3'], 
    ['C1', 'C2', 'C3']]
  end

  def check(player)
    index = 0

    loop do
      return true if player.fields.sort == @win_rules[index].sort
      break if index == 7
      index += 1
    end

    return false if player.fields.sort != @win_rules[index].sort
  end
end