# encoding: utf-8

# require 'pry'

def prepare_deck(deck=[],i=2,fig_aces=['J', 'Q', 'K', 'A'])

  while i<11
    deck.push i.to_s + '♠'
    deck.push i.to_s + '♣'
    deck.push i.to_s + '♥'
    deck.push i.to_s + '♦'
    i = i + 1
  end

  fig_aces.each do |figure| 
    deck.push << figure + '♠'
    deck.push << figure + '♣'
    deck.push << figure + '♥'
    deck.push << figure + '♦'
  end

  deck

end

def calculate_total(hand,player,numeric_hand=[],sum=0)

  # hand.each  { |card| numeric_hand << card.chop.to_i }

  hand.each_with_index do |card, index|
    
    suit = card[-1]
    card = card.chop
    
    if ['J', 'Q', 'K'].include? card
      numeric_hand << 10
    
    elsif card == 'A' && player == 'p'
      while card == 'A'
        puts 'Would you like your ACE to count for (1) or (11)?'
        selection = gets.chomp
      
        if selection == '1'
          numeric_hand << selection.to_i
          hand[index] = '1' + suit
          card = '1'
      
        elsif selection == '11'
          numeric_hand << selection.to_i
          hand[index] = '11' + suit
          card = '11'
      
        else 
          puts 'Not a valid selection!'
        end

      end

    else
      numeric_hand << card.to_i
    end

  end

  numeric_hand.each { |num| sum+=num }

  sum

end


puts 'Welcome to BlackJack'
puts '--------------------'
print 'What is your name? :'
player = gets.chomp

game = 'on'
game_state = 'start'

while game == 'on'

  deck = prepare_deck.shuffle!

  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end

  #

  puts "Hi #{player}, you have been dealt #{player_hand.first}  #{player_hand.last} "
  
  sum_player = calculate_total(player_hand,'p')
  sum_dealer = calculate_total(dealer_hand,'d')

  game_state = 'player_round'

  while game_state == 'player_round'

    player_hand.each { |card| print card + ' ' }
    puts ''
    puts "#{player} would you like to (h)it or (s)tay ?"
    
    input = gets.chomp
    
    if input.downcase == 'h'
      player_hand << deck.pop
      sum_player = calculate_total(player_hand,'p')
      puts "#{player}, you have been dealt #{player_hand.last}"

      if sum_player > 21 
        puts "#{sum_player} Busted!!. Dealer wins"
        game_state = 'end_of_game'
      elsif sum_player == 21
        puts "#{sum_player} BlackJack!! You ve won!"
        game_state = 'end_of_game'
      end

    elsif input.downcase == 's'
      print "Your sum now is: #{sum_player} and your hand is "
      player_hand.each { |card| print card + ' ' }
      game_state = 'dealer_round'
      # binding.pry
    end
  end
      
  while game_state == 'dealer_round'

    sum_dealer = calculate_total(dealer_hand,'d')

        
    while sum_dealer < 18
      puts "Dealer Draws"
      dealer_hand << deck.pop
      sum_dealer = calculate_total(dealer_hand,'d')
      print "Dealer hand:"
      dealer_hand.each { |card| print card + ' ' }
    end

    while rand(10).odd? && sum_dealer < 21
      puts "Dealer Draws"
      dealer_hand << deck.pop
      sum_dealer = calculate_total(dealer_hand,'d')
      print "Dealer hand:"
      dealer_hand.each { |card| print card + ' ' }
    end

    if sum_dealer > 21
      puts "Dealer busted. #{player} wins"
      game_state = 'end_of_game'
      print "Dealer hand:"
      dealer_hand.each { |card| print card + ' ' }
    elsif sum_dealer == 21
      puts "BlackJack for the dealer. Dealer wins!!"
      dealer_hand.each { |card| print card }
      game_state = 'end_of_game'
      print "Dealer hand:"
      dealer_hand.each { |card| print card + ' ' }
    elsif sum_dealer < 21
      if sum_dealer > sum_player
        puts "Dealer with #{sum_dealer} wins #{player} with #{sum_player}"
        game_state = 'end_of_game'
      else 
        puts "#{player} with #{sum_player} wins Dealer with #{sum_dealer}"
        game_state = 'end_of_game'
      end
    end

  end

  while game_state == 'end_of_game'

    puts "Type start for another game or quit to exit"

    if gets.chomp.downcase == 'start'
      game_state = 'start'
    else game = 'off'
    end

  end
    
end

puts "Hope you enjoyed the game #{player}"

