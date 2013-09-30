puts 'Simple calculator. Gimme a number:'
num1 = gets.chomp
puts 'Gimme another number'
num2 = gets.chomp
puts 'Select what do you want to perform: 1) Addition 2)Subtraction 3)Multiplication 4)Division'
selection = gets.chomp

if selection == '1'
  puts num1.to_i + num2.to_i
elsif selection == '2'
  puts num1.to_i - num2.to_i
elsif selection == '3'
  puts num1.to_i * num2.to_i
elsif selection == '4'
  puts num1.to_f / num2.to_f
else 
  puts 'Dunno what you\'re asking'
end

