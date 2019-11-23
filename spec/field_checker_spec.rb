require 'field_checker'

describe FieldChecker do
  let(:player_x) {double :player_x, claim: 'A1 claimed by Player X!' }
  describe '#empty?' do
    it 'returns true if it is empty' do
      player_x.claim('A1')
      expect(subject.empty?('B1')).to eq true
    end
  end
end