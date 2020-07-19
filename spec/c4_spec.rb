require './lib/c4.rb'
describe Input do
  describe '#choose_move' do
    it 'changes the board' do
      i = Input.new
      expect(i.check_move).to change($board)
    end
  end
  describe '#print_board' do
    it 'prints the board' do
      i = Input.new
      expect(i.print_board).to output.to_stdout
    end
  end
end
describe Rules do
  describe '#win_cond' do
    it 'returns a boolean of the win condition' do
      r = Rules.new
      expect(r.win_cond).to be_truthy
    end
  end
end
