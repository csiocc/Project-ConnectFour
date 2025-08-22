require_relative '../lib/board'
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

describe Board do
  subject(:play_board) { described_class.new }
  describe 'change color' do
    before do
      play_board.setup
      play_board.get_cell(0, 0).change_color('red')
      play_board.get_cell(1, 0).change_color('yellow')
    end
    it 'changes color' do
      expect(play_board.get_cell(0, 0).color).to eq('red')
      expect(play_board.get_cell(1, 0).color).to eq('yellow')
    end
  end
  describe 'four_row? at start' do
    before do
      play_board.setup
      play_board.get_cell(0, 0).change_color('red')
      play_board.get_cell(0, 1).change_color('red')
      play_board.get_cell(0, 2).change_color('red')
      play_board.get_cell(0, 3).change_color('red')
    end
    it 'returns true' do
      expect(play_board.four_row?('red')).to be true
    end
    it 'returns false' do
      expect(play_board.four_row?('yellow')).to be false
    end
  end

  describe 'four_row? at end' do
    before do
      play_board.setup
      play_board.get_cell(0, 3).change_color('red')
      play_board.get_cell(0, 4).change_color('red')
      play_board.get_cell(0, 5).change_color('red')
      play_board.get_cell(0, 6).change_color('red')
    end
    it 'returns true' do
      expect(play_board.four_row?('red')).to be true
    end
    it 'returns false' do
      expect(play_board.four_row?('yellow')).to be false
    end
  end

  describe 'four_column? at start' do
    before do
      play_board.setup
      play_board.get_cell(0, 0).change_color('red')
      play_board.get_cell(1, 0).change_color('red')
      play_board.get_cell(2, 0).change_color('red')
      play_board.get_cell(3, 0).change_color('red')
    end
    it 'returns true' do
      expect(play_board.four_column?('red')).to be true
    end
    it 'returns false' do
      expect(play_board.four_column?('yellow')).to be false
    end
  end

  describe 'four_column? at end' do
    before do
      play_board.setup
      play_board.get_cell(2, 0).change_color('red')
      play_board.get_cell(3, 0).change_color('red')
      play_board.get_cell(4, 0).change_color('red')
      play_board.get_cell(5, 0).change_color('red')
    end
    it 'returns true' do
      expect(play_board.four_column?('red')).to be true
    end
    it 'returns false' do
      expect(play_board.four_column?('yellow')).to be false
    end
  end

  describe 'four_diagonal? at start' do
    before do
      play_board.setup
      play_board.get_cell(0, 0).change_color('red')
      play_board.get_cell(1, 1).change_color('red')
      play_board.get_cell(2, 2).change_color('red')
      play_board.get_cell(3, 3).change_color('red')
    end
    it 'returns true' do
      expect(play_board.four_diagonal?('red')).to be true
    end
    it 'returns false' do
      expect(play_board.four_diagonal?('yellow')).to be false
    end
  end

  describe 'four_diagonal? at start should return false' do
    before do
      play_board.setup
      play_board.get_cell(0, 0).change_color('red')
      play_board.get_cell(1, 1).change_color('red')
      play_board.get_cell(2, 2).change_color('red')
    end
    it 'returns false' do
      expect(play_board.four_diagonal?('red')).to be false
    end
    it 'returns false' do
      expect(play_board.four_diagonal?('yellow')).to be false
    end
  end

  describe 'four_diagonal? at mid' do
    before do
      play_board.setup
      play_board.get_cell(2, 2).change_color('red')
      play_board.get_cell(3, 3).change_color('red')
      play_board.get_cell(4, 4).change_color('red')
      play_board.get_cell(5, 5).change_color('red')
    end
    it 'returns true' do
      expect(play_board.four_diagonal?('red')).to be true
    end
    it 'returns false' do
      expect(play_board.four_diagonal?('yellow')).to be false
    end
  end

  describe 'first empty is second row' do
    before do
      play_board.setup
      play_board.get_cell(0, 0).change_color('red')
      play_board.get_cell(1, 0).change_color('red')
    end
    it 'returns 1' do
      expect(play_board.first_empty_cell(0)).to eq
    end
  end
end
