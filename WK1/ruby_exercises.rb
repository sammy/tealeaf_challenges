# Exercise 1

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |v| puts v }

#Exercise 2

arr.each { |v| puts v if v > 5 }

#Exercise 3

arr.select { |v| puts v if v.odd? }

#Exercise 4

arr << 11
arr.unshift 0

#Exercise 5

arr.pop 
arr << 3

#Exercise 6

arr.uniq

#Exercise 7

# An Array is a collection of indexed objects , a Hash is a collection of key/value pairs.

#Exercise 8

h = {a: 1, b: 2, c: 3, d: 4}
h = {:a => 1, :b => 2, :c => 3, :d => 4}

#Exercise 9

puts h[:b]

#Exercise 10

h[:e] = 5

#Exercise 11

h.delete_if { |k,v| v < 3.5 }

#Exercise 12

# For Ruby I seem to prefer ruby-doc.org as it has clear explanations with text and examples
# For Rails I like api.rubyonrails.org for the search functionality but also http://guides.rubyonrails.org/ seems quite helpful as it explains rails at a higher level. 