require_relative 'class_board'
system 'clear'

describe Board do
  describe 'setup board' do
    subject(:play_board) { described_class.new }
    it 'set up correctly with 6 rows and 7 columns' do
      play_board.setup
      expect(play_board).to have_attributes(row: 6, column: 7)
    end
    it 'set up with 6 rows' do
      play_board.setup
      expect(play_board.cells.length).to eq(6)
    end
    it 'set up 7 columns' do
      play_board.setup
      expect(play_board.cells[0].length).to eq(7)
    end
    before do
      play_board.setup
    end
    it 'all crods are set (no nil)' do
      play_board.cells.each do |xd, yd|
        expect(xd).not_to be_nil
        expect(yd).not_to be_nil
      end
    end
  end
end

describe Cell do
  describe 'setup cells' do
    subject(:play_cell) { described_class.new(1, 1) }
    it 'set up cell with x=1 y=1' do
      expect(play_cell).to have_attributes(xd: 1, yd: 1)
    end
    subject(:play_cell_two) { described_class.new(5, 5) }
    it 'set up cell with x=5 y=5' do
      expect(play_cell_two).to have_attributes(xd: 5, yd: 5)
    end
  end
end
