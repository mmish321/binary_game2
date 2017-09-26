require 'gosu/all'
require_relative "iconcell"
require_relative "grid"
require_relative "cursor"
require_relative "numberbutton"
require_relative "number"
require_relative "graphic"

class BinaryGame_2 < Gosu::Window

	def initialize()
		super(1600,800,false, update_interval = 101)
		@grid = CustomGrid.new(self)
		@background_image = Gosu::Image.new("assets/clouds.jpg", {})
		self.caption = "Simple Binary Game"
		@cursor = Cursor.new
		@dashes = Array.new
		@letter_dashes = Array.new
		@letters = Array.new
		for i in 0...5
			@dashes.push(Graphic.new(575 + (i*200) , 550, "assets/dash1.png"))
		end
		@buttons = Array.new
		@buttons.push(NumberButton.new(900,675, "assets/0_100_blue.png", 0))
		@buttons.push(NumberButton.new(1075,675, "assets/1_100_blue.png", 1))
		@binarycode = @grid.code
		@draw_input = Array.new
		@input = Array.new
		@word = @grid.word
		@correct = false
		@goal_image = Gosu::Image.new("assets/400x400.png")
		for i in 0...@word.length()
			x_pos = 600 + (i*120)
			y_pos = 100
			@letter_dashes.push(Graphic.new(x_pos,y_pos, "assets/tiny_dash.png"))
		end
	end

	def update
		cursor_movement
		check_input
		refresh
	end

	def draw
	  draw_dash
      @grid.draw
      draw_buttons
      draw_binary
      draw_letters
      @cursor.draw
      @background_image.draw(0,0,0)
      if @correct 
   		@goal_image.draw(650,150,1)
   	end
	end
  private

	def cursor_movement
      @cursor.click
      @cursor.change_x(mouse_x)
      @cursor.change_y(mouse_y)
    end

     def draw_dash
	    for dash in @dashes
	      dash.draw
	    end
	    for dash in @letter_dashes
	    	dash.draw
	    end
    end
    def draw_buttons
        for button in @buttons
          button.draw
        end
    end
    def draw_binary
    	for number in @draw_input
    		number.draw
    	end
    end
    def draw_letters
    	for letter in @letters
    		letter.draw
    	end
    end

    def check_input
       for button in @buttons
       	if (@input.length() < 5) && button.click_on?(@cursor) && @cursor.click
       		x_pos = (200* @input.length()) + 600
       		y_pos = 510
       		@draw_input.push(Graphic.new(x_pos,y_pos, "assets/#{button.value}_gold_plain.png"))
       		@input.push(button.value)
       	elsif  @input.length() == 5 &&  @letters.length() < @word.length()
       		equal = true
            for i in 0...5
              if (@input[i] != @binarycode[@letters.length()][i])
                equal = false
              end
            end
       		if equal
       			x_pos = 600 + (120 * @letters.length())
       			y_pos = 80
       			@letters.push(Graphic.new(x_pos, y_pos, "assets/letter.png"))
       		end
       	    if @draw_input[4].drawn 
       	    	@input.clear
       	    	@draw_input.clear
       	    end
       	elsif @letters.length() == @word.length()
       		@buttons.clear
       		@input.clear
       		@draw_input.clear
       		@correct = true
       	end
       end
   end
    def refresh
      if  @correct &&(Gosu::button_down? Gosu::KbReturn)
        initialize
      end
      if  (Gosu::button_down? Gosu::KbEscape)
        close
      end
   end
end 

meep = BinaryGame_2.new
meep.show