$turn = 1
$board = Array.new(6) {Array.new(7) {'.'}}
$stack = []
class Input
  def choose_move
    puts 'Choose a column to play on'
    input = gets.chomp.to_i
    cond = true
    i = 5
    while cond do
      if i >= 0 && input < $board[i].length - 1
        tmp = $board[i][input]
        if tmp.eql?(".")
            if $turn.even?
                $board[i][input] = "Y"
                $stack.push([i,input,"Y"])
                cond = false
            else
                $board[i][input] = "R"
                $stack.push([i,input,"R"])
                cond = false
            end
        else
            i -= 1
        end
      else
        cond = false
        puts "ERROR"
      end
    end
    return input
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
  def win_cond()
    val = $stack.shift
    return if val.nil?
    y = val[0]
    x = val[1]
    turn = val[3]
    if x <= 3 && y <= 2
      arr_row = $board[y][x..(x+3)]
      arr_col = $board[y..(y+1)][x]
      arr_diag = $board[y..(y+3)][x..(x+3)]
    else
      arr_row = $board[y][3..6]
      arr_col = $board[2..5][x]
      arr_diag = $board[2..5][3..6]
    end
    if x >= 3 && y >= 2
      arr_row_r = $board[y][(x-3)..x]
      arr_col_r = $board[(y-3)..y][x]
      arr_diag_r = $board[(y-3)..y][(x-3)..x]
    else
      arr_row_r = $board[y][0..3]
      arr_col_r = $board[0..2][x]
      arr_diag_r = $board[0..2][0..3]
    end
    arr_diag.flatten!
    arr_diag_r.flatten!
    p arr_row
    p arr_row_r
    p arr_col
    p arr_col_r
    p arr_diag
    p arr_diag_r
    if arr_row.all?(turn) || arr_col.all?(turn) || arr_diag.all?(turn)
      puts "Congratulations, you win #{turn}"
      true
    elsif arr_row_r.all?(turn) || arr_col_r.all?(turn) || arr_diag_r.all?(turn)
      puts "Congratulations, you win #{turn}"
      true
    else
      false
    end
  end
end
i = Input.new
r = Rules.new
i.print_board
i.choose_move
$turn += 1
until r.win_cond do
    i.print_board
    i.choose_move
    $turn += 1
end
puts "GAME OVER"
i.print_board