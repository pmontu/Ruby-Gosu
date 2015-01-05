require 'gosu'
class Map
	def initialize(window)
		@brick_img = Gosu::Image.new(window,"media/green-brick.png",true)
		@flower_img = Gosu::Image.new(window,"media/flower-tile.png",true)
		@bricks = []
		@flower_bricks = []

		File.open("media/map.txt","r") do |file|
			col=0 
			file.readlines.each do |line|
				row=0
				line.split("").each do |block|
					if block == "#"
						@bricks.push([row,col])
					elsif block == "@"
						@flower_bricks.push([row,col])
					end
					row+=50
				end
				col+=50
			end
		end


		
	end
	def draw
		@bricks.each do |i|
				x,y=i[0],i[1]
				@brick_img.draw(x,y,0)
			end
		@flower_bricks.each do |i|
				x,y=i[0],i[1]
				@flower_img.draw(x,y,0)
			end
	end
end

class Player
	
	attr_reader :x

	def initialize(window)
		@animation = Gosu::Image::load_tiles(window, 'media/captain.png', -4, -1, false)
		@x = 100
		@y = 100
		
	end
	def draw
		img = @animation[Gosu::milliseconds / 10 % @animation.size]
		img.draw(@x,@y,0,0.2,0.2)
	end
	def move_up
		@y -= 1
	end
	def move_right
		@x += 1
	end
	def move_left
		@x -= 1
	end
	def move_down
		@y += 1
	end
end

class MyWindow < Gosu::Window
	def initialize
		super(640,350,false)
		self.caption = "bricks"
		@map = Map.new(self)
		@window_x = 0
		@window_y = 0
		@player = Player.new(self)
	end
	def update
		if button_down? Gosu::KbLeft

			@window_x += 1
			#@player.move_left
		elsif button_down? Gosu::KbRight
			
			@window_x -= 1
			#@player.move_right
		end
	end
	def draw
		translate(@window_x,@window_y) do
			@map.draw
		end
		@player.draw
	end

end

mywindow = MyWindow.new
mywindow.show