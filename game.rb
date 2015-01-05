require 'gosu'
require_relative 'player.rb'
require_relative 'fire-stick.rb'

class MyWindow < Gosu::Window
	def initialize
		super(640,480,false)
		self.caption = "Walk"
		@background_image = Gosu::Image.new(self, "media/background.png", true)
		@wood_bamboo_image = Gosu::Image.new(self, "media/woodbamboo.png", true)
		@blackdoor_animation = Gosu::Image::load_tiles(self,"media/black-door2.png", -3, -1, false)
		@grass = Gosu::Image.new(self, "media/grass.png", true)
		@player = Player.new(self)
		@fire = Lamp.new(self,200,0)
		@BLACKDOOR = false
	end

	def update
		if button_down? Gosu::KbRight
			@player.go_right
		elsif button_down? Gosu::KbLeft
			@player.go_left
		elsif button_down? Gosu::KbEscape
			self.exit
		end

		if @player.x>=200
			@BLACKDOOR = true
		end


		if Gosu::distance(@fire.x, @fire.y, @player.x, @player.y) < 361
			@fire.set_glow_on
		end
	end

	def draw
		@background_image.draw(0,0,0)
		@wood_bamboo_image.draw(0,0,0)
		@grass.draw(0,0,0)
		@player.draw
		@fire.draw

		if not @BLACKDOOR
			b_img = @blackdoor_animation[0]
		elsif @BLACKDOOR
			b_img = @blackdoor_animation[Gosu::milliseconds / 500 % @blackdoor_animation.size]
		end
		b_img.draw(500,0,0)
	end

end


window = MyWindow.new
window.show