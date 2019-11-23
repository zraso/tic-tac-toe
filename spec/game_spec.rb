# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_x: player_x, player_o: player_o) }
  let (:player_x) { double :player_x, symbol: 'X', claim: 'A1 claimed by Player X!', fields: [], win: true }
  let (:player_o) { double :player_o, symbol: 'O', claim: 'B1 claimed by Player O!', fields: [], win: false }

  describe '#initialize' do
    it 'starts a game with player X' do
      expect(game.player_x).to eq player_x
    end

    it 'starts a game with player O' do
      expect(game.player_o).to eq player_o
    end
  end

  describe '#switch_turns' do
    it 'switches turns first time' do
      game.claim('A1')
      expect(game.current_player).to eq player_o
    end

    it 'switches turn second time' do
      game.claim('A1')
      game.claim('B1')
      expect(game.current_player).to eq player_x
    end
  end

  describe '#claim' do
    it 'raises an error if the field is already taken' do
      game.claim('A1')
      allow(player_x).to receive(:fields) { ['A1'] }
      expect { game.claim('A1') }.to raise_error('Error: field already taken')
    end
  end

  describe '#over?' do
    it 'ends game if a player wins' do
      allow(player_x).to receive(:fields) { %w[A1 B1] }
      allow(player_o).to receive(:fields) { %w[A2 B2] }
      game.claim('C1')
      expect(game.over).to eq true
    end

    it 'ends game if all fields taken' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2 A3] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3 C1] }
      game.claim('C3')
      expect(game.over).to eq true
    end
  end
end
