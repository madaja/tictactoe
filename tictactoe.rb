class TicTacToe
    TOP_LABELS = "    1  2  3"
    attr_reader :ttt_board, :winner, :plays_total
    def initialize
        @ttt_board = {"a1" => "-", "a2" => "-", "a3" => "-", "b1" => "-", "b2" => "-", "b3" => "-", "c1" => "-", "c2" => "-", "c3" => "-"}
        @played_cells = []
        @xplayed_cells = []
        @oplayed_cells = []
        @plays_total = 0
        @winner = "none"
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
            puts "X (Player 1) wins! Game over."
            @winner = "x"
        end
    end
    def owin
        if ((@oplayed_cells.include?("a1") && @oplayed_cells.include?("a2") && @oplayed_cells.include?("a3")) ||
            (@oplayed_cells.include?("b1") && @oplayed_cells.include?("b2") && @oplayed_cells.include?("b3")) ||
            (@oplayed_cells.include?("c1") && @oplayed_cells.include?("c2") && @oplayed_cells.include?("c3")) ||
            (@oplayed_cells.include?("a1") && @oplayed_cells.include?("b1") && @oplayed_cells.include?("c1")) ||
            (@oplayed_cells.include?("a2") && @oplayed_cells.include?("b2") && @oplayed_cells.include?("c2")) ||
            (@oplayed_cells.include?("a3") && @oplayed_cells.include?("b3") && @oplayed_cells.include?("c3")) ||
            (@oplayed_cells.include?("a1") && @oplayed_cells.include?("b2") && @oplayed_cells.include?("c3")) ||
            (@oplayed_cells.include?("a3") && @oplayed_cells.include?("b2") && @oplayed_cells.include?("c1"))
        )
            puts "O (Player 2) wins! Game over."
            @winner = "o"
        end
    end
    def xturn(str)
        while (!@ttt_board.include?(str))
            puts "Invalid play. Please enter a cell between A1 and C3."
            str = gets.chomp.downcase
        end
        while (@played_cells.include?(str))
            puts "Error. That cell has already been claimed. Choose another cell."
            str = gets.chomp.downcase
            while (!@ttt_board.include?(str))
                puts "Invalid play. Please enter a cell between A1 and C3."
                str = gets.chomp.downcase
            end
        end
        changecell(str, "X")
        @played_cells.push(str)
        @xplayed_cells.push(str)
        @plays_total += 1
    end
    def oturn(str)
        while (!@ttt_board.include?(str))
            puts "Invalid play. Please enter a cell between A1 and C3."
            str = gets.chomp.downcase
        end
        while (@played_cells.include?(str))
            puts "Error. That cell has already been claimed. Choose another cell."
            str = gets.chomp.downcase
            while (!@ttt_board.include?(str))
                puts "Invalid play. Please enter a cell between A1 and C3."
                str = gets.chomp.downcase
            end
        end
        changecell(str, "O")
        @played_cells.push(str)
        @oplayed_cells.push(str)
        @plays_total += 1
    end
    private
    def changecell(key, value)
        self.ttt_board[key] = value
    end
end
def new_game
    gameboard = TicTacToe.new
    puts gameboard.show_board
    while (gameboard.winner == "none")
        puts "Player 1: Where do you want to play an X?"
        xplay = gets.chomp.downcase
        gameboard.xturn(xplay)
        gameboard.show_board
        gameboard.xwin
        if gameboard.winner == "x"
            break
        end
        if (gameboard.plays_total == 9 && gameboard.winner == "none")
            puts "It's a draw! Game over."
            break
        end
        puts "Player 2: Where do you want to play an O?"
        oplay = gets.chomp.downcase
        gameboard.oturn(oplay)
        gameboard.show_board
        gameboard.owin
        if gameboard.winner == "o"
            break
        end
        
    end
end
new_game()
