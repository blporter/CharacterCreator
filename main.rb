require_relative 'character'

puts 'Enter your character\'s name:'
name = gets.chomp

scores = []

puts 'Enter your character\'s stats:'
puts 'Strength:'
scores.push(gets.to_i)
puts 'Dexterity:'
scores.push(gets.to_i)
puts 'Constitution:'
scores.push(gets.to_i)
puts 'Intelligence:'
scores.push(gets.to_i)
puts 'Wisdom:'
scores.push(gets.to_i)
puts 'Charisma:'
scores.push(gets.to_i)

puts 'Enter your character\'s race:'
race = gets.chomp

puts 'Enter your character\'s class:'
job = gets.chomp

character = Character.new(name, scores, race, job)

puts 'Your character:'
puts character
