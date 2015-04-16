class SingleCell
	$arr = [0,0,0,0]
	def print_cell
		puts "#{$arr[0]} #{$arr[1]} \n#{$arr[2]} #{$arr[3]}"
	end

	def cell(n1, n2, n3, n4)
		for i in 1..4
			if n1 == i
				$arr[0] = i
			elsif n2 == i
				$arr[1] = i
			elsif n3 == i
				$arr[2] = i
			elsif n4 == i
				$arr[3] = i
			end
		end
	print_cell
	end
end


run = SingleCell.new
run.cell(1,2,3,4)
