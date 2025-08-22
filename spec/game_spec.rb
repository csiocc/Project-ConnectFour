require_relative '../lib/game'
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
    context 'valid input' do
      before do
        allow(game_two).to receive(:player_input).and_return(5)
      end
      it 'returns 5' do
        expect(game_two.player_input).to eq(5)
      end
    end
  end
end
