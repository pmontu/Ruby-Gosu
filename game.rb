require 'gosu'

class MyWindow < Gosu::Window
	def initialize
		super(640,480,false)
		self.caption = "Walk"
		@background_image = Gosu::Image.new(self, "media/background.png", true)
		@wood_bamboo_image = Gosu::Image.new(self, "media/woodbamboo.png", true)
		@grass = Gosu::Image.new(self, "media/grass.png", true)
		@player = Player.new(self)
	end

	def draw
		@background_image.draw(0,0,0)
		@wood_bamboo_image.draw(0,0,0)
		@grass.draw(0,0,0)
		@player.draw
	end
end

class Player

	def initialize(window)
		@window = window
		@img = Gosu::Image.new(@window,'media/fireboy.png',true)
		@x = 100
		@y = 360
	end

	def draw
		@img.draw(@x,@y,0)
	end
end

window = MyWindow.new
window.show