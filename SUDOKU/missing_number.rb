arr = [1,2,3]
arrdiff = [1,0,3]

puts "available numbers are: #{arr}"
puts "arrdiff (zero means missing digit): #{arrdiff}"

$found_number = (arr-arrdiff)
$found_number = $found_number[0]

arrdiff.map! { |x| x == 0 ? $found_number : x }


puts "the missing number is: #{$found_number}"
puts "here\'s updated arrdiff array: #{arrdiff}"