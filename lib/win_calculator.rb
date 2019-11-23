# frozen_string_literal: true

class CalculateWinner
  def initialize
    @win_rules = [%w[A1 B2 C3],
                  %w[A3 B2 C1],
                  %w[A1 B1 C1],
                  %w[A2 B2 C2],
                  %w[A3 B3 C3],
                  %w[A1 A2 A3],
                  %w[B1 B2 B3],
                  %w[C1 C2 C3]]
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
