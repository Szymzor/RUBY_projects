col1 = [1,4,7]
col2 = [2,5,8] 
col3 = [3,6,9]

$count = 6


for $i in 1..3
	column = eval("col#{$i}")
	print column
	column.each {|number| if number == $count
		print number

	end
} 
puts
end


=begin
a = [1, 2, 3]
b = [1, 4, 3]

print a.zip(b).map { |x, y| if x == y
print x
else
	print 0
end 
}

=end