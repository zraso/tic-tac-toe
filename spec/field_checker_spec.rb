require 'field_checker'

describe FieldChecker do
  let(:player_x) {double :player_x, fields: ['A1', 'C1'] }
  let(:player_o) {double :player_o, fields: ['B1']}
  subject(:field_checker) { described_class.new(player_x, player_o)}

  describe '#empty?' do
    it 'returns true if field is empty' do
      expect(field_checker.empty?('A2')).to eq true
    end

    it 'returns false if field is taken' do
      expect(field_checker.empty?('A1')).to eq false
    end

    it 'returns false if field is taken' do
      expect(field_checker.empty?('C1')).to eq false
    end
  end

  describe '#all_fields_taken?' do
    it 'returns true if all friends are taken' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2 A3 C3] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3 C1] }
      expect(field_checker.all_taken?).to eq true
    end

    it 'returns false if there are empty fields' do
      allow(player_x).to receive(:fields) { %w[A1 B1 C2] }
      allow(player_o).to receive(:fields) { %w[A2 B2 B3 C1] }
      expect(field_checker.all_taken?).to eq false
    end
  end
end