require 'curses'
Curses.curs_set(0)		#the cursor is invisible.
Curses.noecho			#does not show input of getch


class Game
	#set start position of a square
	def initialize
		$x = 20
		$y = 20
		$food_x = Random.rand((100)/3)*2
		$food_y = Random.rand((33)/3)*2
		@food_icon = "X"
	end

	def square_set_pos
		Curses.clear
		Curses.setpos($y,$x)
	    Curses.addstr("\u2588\u2588")
	end


	def hit?	##########sets borders of a screen
		if $x < 0
		$x = 0
		
		elsif $y > 23
		$y = 23
	
		elsif $x > 78
		$x = 78

		elsif $y < 0
		$y = 0
			# # 
		elsif $food_x == $x && $food_y == $y
		Curses.setpos($food_y,$food_x)
		@food_icon = ""
		Curses.addstr(@food_icon)
		$food_x = Random.rand((100)/3)*2
		$food_y = Random.rand((33)/3)*2
		@food_icon = "X"
		end
		square_set_pos
	end

	def put_food
		Curses.setpos($food_y,$food_x)
		Curses.addstr(@food_icon)
	end

end

##################### RUN GAME SECTION ##########################################
@run = Game.new
@run.square_set_pos

	loop do
	  case Curses.getch
		when ?d
	   		$x = $x + 2
	    	@run.hit?
		when ?s
		  	$y = $y + 1
		  	@run.hit?
		when ?a
		  	$x = $x - 2
			@run.hit?
		when ?w
		  	$y = $y - 1
		  	@run.hit?			  	
	  end
	  @run.put_food
	end
