# frozen_string_literal: true

require 'win_calculator'

describe CalculateWinner do
  let(:player_x) { double :player_x }
  let(:player_o) { double :player_o }

  describe '#check' do
    it 'returns false if play has no winner' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3] }
      expect(subject.check(player_x)).to eq false
    end

    it 'returns true if player has won with rule 0' do
      allow(player_x).to receive(:fields) { %w[A1 B2 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B3 C2] }
      expect(subject.check(player_x)).to eq true
    end

    it 'returns player if player has won with rule 7' do
      allow(player_x).to receive(:fields) { %w[C1 C2 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B1 B2] }
      expect(subject.check(player_x)).to eq true
    end

    it 'returns true if player has won with fields that are unsorted' do
      allow(player_x).to receive(:fields) { %w[C3 C2 C1] }
      allow(player_o).to receive(:fields) { %w[A2 B1 B2] }
      expect(subject.check(player_x)).to eq true
    end
  end
end
