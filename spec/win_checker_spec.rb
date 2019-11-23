require 'calculatewinner'

describe CalculateWinner do
  let(:player_x) {double :player_x, fields: []}
  let(:player_o) {double :player_o}

  ## need to be testing whether it's a win or not. So check if the winning grids
  ## matches what the player has

  describe '#check' do
    it 'returns false if play has no winner' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3] }
      expect(subject.check(player_x)).to eq false
    end

    it 'returns player if player has won with Diagonal 1' do
      allow(player_x).to receive(:fields) { %w[A1 B2 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B3 C2] }
      expect(subject.check(player_x)).to eq 'Win'
    end

    it 'returns player if player has won with Diagonal 2' do
      allow(player_x).to receive(:fields) { %w[A3 B2 C1] }
      allow(player_o).to receive(:fields) { %w[A1 B2 C2] }
      expect(subject.check(player_x)).to eq 'Win'
    end

    it 'returns player if player has won with Column 1' do
      allow(player_x).to receive(:fields) { ['A1', 'B1', 'C1'] }
      allow(player_o).to receive(:fields) { %w[A2 B2 C3] }
      expect(subject.check(player_x)).to eq "Win"
    end

  end
end