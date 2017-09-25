require "gosu/all"
require_relative "iconcell"
require_relative "grid"
require_relative "cursor"
require_relative "numberbutton"
require_relative "number"
require_relative "graphic"

class BinaryGame_2 < Gosu::Window

	def initialize()
		super(1600,900,false, update_interval = 110)
		@grid = CustomGrid.new(self)
		@background_image = Gosu::Image.new("assets/clouds.jpg", {})
		@cursor = Cursor.new
		@dashes = Array.new
		@letter_dashes = Array.new
		for i in 0...5
			@dashes.push(Graphic.new(575 + (i*200) , 600, "assets/dash1.png"))
		end
		@buttons = Array.new
		@buttons.push(NumberButton.new(900,750, "assets/0_100_blue.png", 0))
		@buttons.push(NumberButton.new(1075,750, "assets/1_100_blue.png", 1))
	end

	def update
		cursor_movement
	end

	def draw
	  draw_dash
      @grid.draw
      draw_button
      @cursor.draw
      @background_image.draw(0,0,0)
	end

	def cursor_movement
      @cursor.click
      @cursor.change_x(mouse_x)
      @cursor.change_y(mouse_y)
    end

     def draw_dash
	    for dash in @dashes
	      dash.draw
	    end
    end
      def draw_button
        for button in @buttons
          button.draw
        end
    end
end 

meep = BinaryGame_2.new
meep.show