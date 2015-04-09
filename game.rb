require 'curses'
Curses.curs_set(0)		#the cursor is invisible.
Curses.noecho			#does not show input of getch


class Game
	#set start position of a square
	def initialize
		set_user_interface
		$x = 20
		$y = 20
		$food_x = Random.rand((94)/3)*2
		$food_x = $food_x + 6
		$food_y = Random.rand((27)/3)*2
		$food_y = $food_y + 6
		@food_icon = "X"
		$score = 0
		$time = 0
	end

	def set_user_interface
		Curses.init_screen()
		height = Curses.lines
		width = Curses.cols
		Curses.setpos(0,0)
		up_bottom = "="*width
		Curses.addstr(up_bottom)
		Curses.setpos(height-1,0)
		Curses.addstr(up_bottom)
		for first_col in 1..height-2
			Curses.setpos(first_col,0)
			Curses.addstr("|")
		end

		for last_col in 1..height-2
			Curses.setpos(last_col,width-1)
			Curses.addstr("|")
		end
		
		title = " STUPID GAME BRO "					####### SETTING GAME'S TITLE #########
		Curses.setpos(0,(width/2)-title.length/2)
		Curses.addstr(title)

		score_str = "Score: #{$score} "
		Curses.setpos(height-1,0)
		Curses.addstr(score_str)

		#For time I'll try making a new thread

	end

	def square_set_pos
		Curses.clear
		Curses.setpos($y,$x)
	    Curses.addstr("\u2588\u2588")
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
		elsif $food_x == $x && $food_y == $y
		Curses.setpos($food_y,$food_x)
		@food_icon = ""
		Curses.addstr(@food_icon)
		$food_x = Random.rand((94)/3)*2
		$food_x = $food_x + 6
		$food_y = Random.rand((27)/3)*2
		$food_y = $food_y + 6
		@food_icon = "X"
		$score += 1

		end
		square_set_pos
		set_user_interface
	end

	def put_food
		Curses.setpos($food_y,$food_x)
		Curses.addstr(@food_icon)
	end

end

##################### RUN GAME SECTION ##########################################
@run = Game.new
@run.square_set_pos
@run.set_user_interface
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
