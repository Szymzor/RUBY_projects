require 'curses'
Curses.curs_set(0)		#the cursor is invisible.
Curses.noecho			#does not show input of getch


class Game
	#set start position of a square
	def initialize
		$x = 20
		$y = 20
		$lines = 24
		$cols = 80
		$food_x = Random.rand((95)/3)*2
		$food_y = Random.rand((30)/3)*2
		@food_icon = "X"
		@win = Curses::Window.new($lines, $cols, 0, 0) 
		@title = "A Stupid game"
	end

	def refresh_window	
		@win.refresh
		@win.clear
	end

	

	def setup_window(border_wall, border_roof)
		@win.box(border_wall, border_roof)				# border
		@win.setpos(0,$cols/2-@title.length/2)
		@win.addstr(@title)
		@win.setpos(0,$cols-12)
		@win.addstr("Ticks ")
	end

	def square_set_pos
		refresh_window
		Curses.setpos($y,$x)
	    Curses.addstr("\u2588\u2588")
	    setup_window("|","=")
	end


	def hit?	##########sets borders of a screen
		if $x < 1
		$x = 1
		
		elsif $y > 22
		$y = 22
	
		elsif $x > 77
		$x = 77

		elsif $y < 1
		$y = 1
			# # 
		elsif ($food_x == $x) and ($food_y == $y)

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
@run.put_food

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

