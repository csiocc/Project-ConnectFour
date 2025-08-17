require_relative 'class_game'
system 'clear'

describe Game do
  subject(:game_one) { described_class.new }

  describe 'valid_input works?' do
    input = 5
    it 'returns true' do
      expect(game_one.valid_input?(input)).to be true
    end
    it 'returns false for wrong input' do
      input = 15
      expect(game_one.valid_input?(input)).to be false
    end
  end

  describe 'player_input' do
    subject(:game_two) { described_class.new }
    let(:input) { 15 }
    before do
      allow(game_two).to receive(:gets).and_return(input)
    end
    describe 'invalid input continues loop' do
      it 'expected wrong input' do
        expect(game_two.player_input).to receive(:gets).with(input)
      end
    end
  end
end
