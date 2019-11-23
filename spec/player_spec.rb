# frozen_string_literal: true

require 'player'

describe Player do
  let(:calculate_winner) {double :calculate_winner}
  subject(:player_x) { described_class.new('X') }
  subject(:player_o) { described_class.new('O') }

  describe '#claim' do
    it 'player x can claim a field' do
      player_x.claim('A1')
      expect(player_x.fields).to include 'A1'
    end

    it 'player o can claim a field' do
      player_o.claim('A1')
      expect(player_o.fields).to include 'A1'
    end
  end

  describe '#check_win' do
    it 'returns false if players fields is not a win' do
      player_x.claim('A1')
      expect(player_x.win).to eq false
    end

    it 'returns true if players fields matches a win rule' do
      player_x.claim('A1')
      player_x.claim('A2')
      player_x.claim('A3')
      expect(player_x.win).to eq true
    end
  end
end
