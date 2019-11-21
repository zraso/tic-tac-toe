require 'game'

describe Game do
  it 'starts a game' do
    game = Game.new
    expect(game.start).to eq "Player X's turn!"
  end
end