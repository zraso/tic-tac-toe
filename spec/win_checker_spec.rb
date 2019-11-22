require 'calculatewinner'

describe CalculateWinner do
  let(:player_x) {double :player_x}
  let(:player_o) {double :player_o}

  describe '#check' do
    it 'returns nil if play has no winner' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3] }
      expect(subject.check(player_x)).to eq nil
    end

    it 'returns player if player has won with Diagonal 1' do
      allow(player_x).to receive(:fields) { %w[A1 B2 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B3 C2] }
      expect(subject.check(player_x)).to eq player_x
    end

  end
end