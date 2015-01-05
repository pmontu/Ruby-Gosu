
class Player

	attr_reader :x,:y

	def initialize(window)
		@window = window
		@img = Gosu::Image.new(@window,'media/fireboy.png',true)
		@x = 100
		@y = 360
	end

	def go_right
		@x += 10
	end

	def go_left
		@x -= 10
	end

	def draw
		@img.draw(@x,@y,0)
	end
end

