require 'game'

describe Game do
  subject(:game) { described_class.new(player_x: player_x )}
  let (:player_x) { double :player_x, claim: "A1 claimed by Player X!" }
  let (:player_o) { double :player_o, claim: "B1 claimed by Player O!" }

  describe '#start' do
    it 'starts a game' do
      game = Game.new
      expect(game.start).to eq "Player X's turn!"
    end

    it 'starts a game with player X' do
      game = Game.new
      expect(game.player_x).to be_a Player
    end

    it 'starts a game with player O' do
      game = Game.new
      expect(game.player_o).to be_a Player
    end
  end

  describe '#switch_turns' do
    it 'switches turns first time' do
      game = Game.new
      game.start
      player_x.claim('A1')
      expect(game.switch_turn).to eq "Player O's turn!"
    end

    it 'switches turn second time' do
      game = Game.new
      game.start
      player_x.claim('A1')
      game.switch_turn
      player_o.claim('B1')
      expect(game.switch_turn).to eq "Player X's turn!"
    end
  end
end