
=begin
TOP_LABELS = "    1  2  3"

def show_board()
    TOP_LABELS = "    1  2  3"
    rowa = "A|  " + a1 + "  " + a2 + "  " + a3
    rowb = "B|  " + b1 + "  " + b2 + "  " + b3
    rowc = "C|  " + c1 + "  " + c2 + "  " + c3
    puts TOP_LABELS
    puts rowa
    puts rowb
    puts rowc
end
show_board()
a2 = "X"
c3 = "O"
show_board()
puts a2
=end

class TicTacToe
    TOP_LABELS = "    1  2  3"
    attr_reader :ttt_board
    def initialize
        @ttt_board = {"a1" => "-", "a2" => "-", "a3" => "-", "b1" => "-", "b2" => "-", "b3" => "-", "c1" => "-", "c2" => "-", "c3" => "-"}
        @played_cells = []
        @xplayed_cells = []
        @plays_total = 0
    end
    def show_board
        rowa = "A|  " + @ttt_board["a1"] + "  " + @ttt_board["a2"] + "  " + @ttt_board["a3"]
        rowb = "B|  " + @ttt_board["b1"]+ "  " + @ttt_board["b2"] + "  " + @ttt_board["b3"]
        rowc = "C|  " + @ttt_board["c1"]+ "  " + @ttt_board["c2"] + "  " + @ttt_board["c3"]
        puts TOP_LABELS
        puts rowa
        puts rowb
        puts rowc
    end
    def xwin
        if ((@xplayed_cells.include?("a1") && @xplayed_cells.include?("a2") && @xplayed_cells.include?("a3")) ||
            (@xplayed_cells.include?("b1") && @xplayed_cells.include?("b2") && @xplayed_cells.include?("b3")) ||
            (@xplayed_cells.include?("c1") && @xplayed_cells.include?("c2") && @xplayed_cells.include?("c3")) ||
            (@xplayed_cells.include?("a1") && @xplayed_cells.include?("b1") && @xplayed_cells.include?("c1")) ||
            (@xplayed_cells.include?("a2") && @xplayed_cells.include?("b2") && @xplayed_cells.include?("c2")) ||
            (@xplayed_cells.include?("a3") && @xplayed_cells.include?("b3") && @xplayed_cells.include?("c3")) ||
            (@xplayed_cells.include?("a1") && @xplayed_cells.include?("b2") && @xplayed_cells.include?("c3")) ||
            (@xplayed_cells.include?("a3") && @xplayed_cells.include?("b2") && @xplayed_cells.include?("c1"))
        )
            puts "X wins!"
        end
    end
    def xturn(str)
        changecell(str, "X")
        @xplayed_cells.push(str)
        p @xplayed_cells
    end
    def oturn(str)
        changecell(str, "O")
    end
    private
    def changecell(key, value)
        self.ttt_board[key] = value
    end
end
def new_game
    testboard = TicTacToe.new
    puts testboard.show_board
    winner = false
    while (winner == false)
        puts "Player 1: Where do you want to play an X?"
        xplay = gets.chomp.downcase
        testboard.xturn(xplay)
        testboard.show_board
        testboard.xwin
        puts "Player 2: Where do you want to play an O?"
        oplay = gets.chomp.downcase
        testboard.oturn(oplay)
        testboard.show_board
        puts "Continue? y/n"
        cont = gets.chomp
        if (cont == "n")
            winner = true
        end
    end
end
new_game()
