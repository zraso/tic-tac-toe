# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { described_class.new(player_x: player_x, player_o: player_o) }
  let (:player_x) { double :player_x, symbol: 'X', claim: 'A1 claimed by Player X!', fields: [] }
  let (:player_o) { double :player_o, symbol: 'O', claim: 'B1 claimed by Player O!', fields: [] }

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
      expect(game.claim('A1')).to eq "Player O's turn!"
    end

    it 'switches turn second time' do
      game.claim('A1')
      game.switch_turn
      game.claim('B1')
      expect(game.switch_turn).to eq "Player X's turn!"
    end
  end

  describe '#claim_field' do
    it 'raises an error if the field is already taken' do
      game.claim('A1')
      allow(player_x).to receive(:fields) { ['A1'] }
      expect { game.claim('A1') }.to raise_error('Error: field already taken')
    end
  end
end
