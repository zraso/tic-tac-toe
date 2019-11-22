# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_x: player_x, player_o: player_o) }
  let (:player_x) { double :player_x, claim: 'A1 claimed by Player X!', fields: [] }
  let (:player_o) { double :player_o, claim: 'B1 claimed by Player O!', fields: [] }

  describe '#start' do
    it 'starts a game' do
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
      player_x.claim('A1')
      expect(game.switch_turn).to eq "Player O's turn!"
    end

    it 'switches turn second time' do
      game.start
      player_x.claim('A1')
      game.switch_turn
      player_o.claim('B1')
      expect(game.switch_turn).to eq "Player X's turn!"
    end
  end

  describe 'empty?' do
    it 'returns true if field is empty' do
      game.start
      expect(game.field_empty?('A1')).to eq true
    end

    it 'returns false if field is not empty' do
      game.start
      player_x.claim('A1')
      allow(player_x).to receive(:fields) { ['A1'] }
      expect(game.field_empty?('A1')).to eq false
    end
  end
end
