class CalculateWinner

  def check(player)
    if player.fields.include? ('A1' && 'B2' && 'C3')
      player
    else
      nil
    end
  end

end