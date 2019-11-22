# frozen_string_literal: true

require 'player'

describe Player do
  subject(:player_x) { described_class.new('X') }
  subject(:player_o) { described_class.new('O') }

  describe '#claim' do
    it 'player x can claim a field' do
      expect(player_x.claim('A1')).to eq 'A1 claimed by Player X!'
    end

    it 'player o can claim a field' do
      expect(player_o.claim('B1')).to eq 'B1 claimed by Player O!'
    end
  end
end
