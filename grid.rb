
class CustomGrid < Gosu::Grid   

	def initialize(window)
		super(window)
		@words = ["computer", "desktop", "keyboard", "laptop", 
			"modem", "monitor", "mouse", "printer", "scanner", "speakers"]
		@word 
		gridAssembly
	end

	def gridAssembly
      r = rand(0...9)
      main_grid = Array.new
      @word = @words[r]
      sample_word = @word 
      for i in (0...sample_word.length())
      	 main_grid.push(letter_code(sample_word[i]))
      end
      for i in 0..(main_grid.length() -1)
	      for j in 0..(main_grid[i].length() -1)
	        if (main_grid[i][j] == 0)
	          @cells.push(IconCell.new(self,j,i,'assets/empty_cell_100.png'))
	        end
	        if (main_grid[i][j] == 1)
	          @cells.push(IconCell.new(self,j,i,'assets/star100.png'))
	        end
	      end
	    end
    end

    def letter_code(letter)
    	codes = { "a" => [0,0,0,0,0],
    		"b" => [0,1,1,0,0],
    		"c" => [1,1,1,0,0],
    		"d" => [1,0,0,1,0],
    		"e" => [1,1,0,0,0],
    		"l" => [1,1,1,1,1],
    		"m" => [0,1,1,1,1],
    		"k" => [0,0,1,1,1],
    		"n" => [0,1,0,0,0],
    		"i" => [0,1,1,0,1],
    		"o" => [0,1,0,1,1],
    		"p" => [0,0,0,1,1],
    		"r" => [0,1,1,1,0],
    		"s" => [1,1,1,1,0],
    		"t" => [0,1,1,0,1],
    		"u" => [0,0,0,0,1],
    		"y" => [1,0,1,1,1]
    	}
    	return codes[letter]
    end

    def draw
		@cells.each do |cell|
			cell.draw
	    end
	end
	def word
		@word
	end
end
