$turn = 0
$board = Array.new(6) { Array.new(7, ' ') }
class Input
  def choose_move
    puts 'Choose a column to play on'
    input = gets.chomp.to_i
    cond = true
    i = 0
    tmp = $board[i][input]
    while cond do
        tmp = $board[i][input]
        if tmp.empty?
            if $turn.even?
                $board[i][input] = "Y"
                cond = false
                puts"test"
            else
                $board[i][input] = "R"
                cond = false
                puts "test1"
            end
        else
            i += 1
        end
    end
  end
  def print_board()
    time = 0
    6.times do
      p $board[time]
      time += 1
    end
  end
end
class Rules
  def win_cond
    $board.each_with_index do |_valy, y|
      $board[y].each_with_index do |_valx, x|
        # diagonals
        if x == 0 && y == 0
          if $board[y][x] == $board[y + 1][x + 1] && $board[y + 1][x + 1] == $board[y + 2][x + 2]
            return true
          else
            return false
          end
        elsif x == 1 && y == 1
          if $board[y - 1][x - 1] == $board[y][x] && $board[y][x] == $board[y + 1][x + 1]
            true
          else
            false
          end
        else
          if $board[y - 2][x - 2] == $board[y - 1][x - 1] && $board[y - 1][x - 1] == $board[y][x]
            true
          else
            false
          end
        end
        # rows
        if x == 0 && y == 0
          if $board[y][x] == $board[y][x + 1] && $board[y][x + 1] == $board[y][x + 2]
            true
          else
            false
          end
        elsif x == 1 && y == 1
          if $board[y][x - 1] == $board[y][x] && $board[y][x] == $board[y][x + 1]
            true
          else
            false
          end
        else
          if $board[y][x - 2] == $board[y][x - 1] && $board[y][x - 1] == $board[y][x]
            true
          else
            false
          end
        end
        # columns
        if x == 0 && y == 0
          if $board[y][x] == $board[y + 1][x] && $board[y + 1][x] == $board[y + 2][x]
            true
          else
            false
          end
        elsif x == 1 && y == 1
          if $board[y - 1][x] == $board[y][x] && $board[y][x] == $board[y + 1][x]
            true
          else
            false
          end
        else
          if $board[y - 2][x] == $board[y - 1][x] && $board[y - 1][x] == $board[y][x]
            true
          else
            false
          end
        end
      end
    end
  end
end
i = Input.new
r = Rules.new
puts r.win_cond
until !r.win_cond do
    i.print_board
    i.choose_move
    $turn += 1
end