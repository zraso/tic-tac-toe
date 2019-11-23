class CalculateWinner

  def check(player)
    # puts player.fields
    diagonal1 = ['A1', 'B2', 'C3']
    diagonal2 = ['A3', 'B2', 'C1']
    column1 = ['A1', 'B1', 'C1']
    if player.fields == diagonal1
      'Win'
    elsif player.fields == diagonal2
      'Win'
    elsif player.fields == column1
      'Win'
    else
      false
    end
  end

end