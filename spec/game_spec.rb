# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_x: player_x, player_o: player_o) }
  let (:player_x) { double :player_x, symbol: 'X', claim: 'A1 claimed by Player X!', fields: [] }
  let (:player_o) { double :player_o, symbol: 'O', claim: 'B1 claimed by Player O!', fields: [] }

  describe '#start' do
    it 'starts a game with Player X' do
      expect(game.start).to eq "Player X's turn!"
    end

    it 'starts a game with player X' do
      expect(game.player_x).to eq player_x
    end

    it 'starts a game with player O' do
      expect(game.player_o).to eq player_o
    end
  end

  describe '#switch_turns' do
    it 'switches turns first time' do
      game.start
      expect(game.claim('A1')).to eq "Player O's turn!"
    end

    it 'switches turn second time' do
      game.start
      game.claim('A1')
      game.switch_turn
      game.claim('B1')
      expect(game.switch_turn).to eq "Player X's turn!"
    end
  end

  describe '#field_empty?' do
    it 'returns true if field is empty' do
      game.start
      expect(game.field_empty?('A1')).to eq true
    end

    it 'returns false if field is not empty' do
      game.start
      game.claim('A1')
      allow(player_x).to receive(:fields) { ['A1'] }
      expect(game.field_empty?('A1')).to eq false
    end
  end

  describe '#claim_field' do
    it 'raises an error if the field is already taken' do
      game.start
      game.claim('A1')
      allow(player_x).to receive(:fields) { ['A1'] }
      expect { game.claim('A1') }.to raise_error('Error: field already taken')
    end
  end

  describe '#all_fields_taken?' do
    it 'returns true if all fields are taken' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2 A3 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3 C1] }
      expect(game.all_fields_taken?).to eq true
    end

    it 'returns false if there are empty fields' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3 C1] }
      expect(game.all_fields_taken?).to eq false
    end
  end

  describe '#in_play?' do
    it 'ends game if all fields are taken' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2 A3 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3 C1] }
      expect(game.in_play?).to eq false
    end
  end

  describe 'calculate_winner' do
    it 'returns nil if players have less than three fields' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3] }
      expect(game.calculate_winner).to eq nil
    end

    it 'returns player if player has won with Diagonal 1' do
      allow(player_x).to receive(:fields) { %w[A1 B2 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B3 C2] }
      expect(game.calculate_winner).to eq player_x
    end

    it 'returns player if player has won with Diagonal 2' do
      allow(player_x).to receive(:fields) { %w[A3 B2 C1] }
      allow(player_o).to receive(:fields) { %w[A1 B2 C2] }
      expect(game.calculate_winner).to eq player_x
    end
  end
end
