class Graphic
	def initialize(x, y, image)
		@x = x
		@y = y
		@image = Gosu::Image.new(image, {})
		@drawn = false
	end

	def draw
		@image.draw(@x, @y, 1)
		@drawn = true
	end
	def drawn
		@drawn
	end

end