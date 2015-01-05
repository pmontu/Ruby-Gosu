
class Lamp
	attr_reader :x,:y,:State
	module State
		GLOW = 1
		OFF = 0
	end
	def initialize(window, x, y)
		@x, @y = x, y
		@animation = Gosu::Image::load_tiles(window, 'media/lamp_animation.png', -3, -1, false)
		@state = State::OFF
	end

	def draw
		if @state == State::GLOW
			img = @animation[1+(Gosu::milliseconds / 1000) % (@animation.size-1)]
		elsif
			img = @animation[0]
		end
		img.draw(@x,@y,0)
	end
	def set_glow_on
		@state = State::GLOW
	end
end