# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.
class Dice
  MAX = 3000
  @@arr_pl = []
  @@arr_s = []
  
  def initialize(players)
    @players = players
  end
  
  def player
    @@arr_pl = @players.times.map{ |i| i = i + 1 }
	@@arr_s = @players.times.map{ |i| i = 0 }
	# puts @@arr_pl
  end


	
  def sum_m(arr)
    s1 = 0
	s2 = 0
	s3 = 0
	s4 = 0
	s5 = 0
	s6 = 0
	sum = 0
	arr.each{ |i| 
	  s1 += 1 if i == 1
	  s2 += 1 if i == 2
	  s3 += 1 if i == 3
	  s4 += 1 if i == 4
	  s5 += 1 if i == 5
	  s6 += 1 if i == 6}
	 # puts "s1=#{s1} s2=#{s2} s3=#{s3} s4=#{s4} s5=#{s5} s6=#{s6}"
   2.times { if s1 >= 3 
	  sum += 1000
	  s1 = s1 - 3
	end  
    if s2 >= 3 
	  sum += 200
	  s2 = s2 - 3
	end
	if s3 >= 3 
	  sum += 300
	  s3 = s3 - 3
	end
	if s4 >= 3 
	  sum += 400
	  s4 = s4 - 3
	end
	if s5 >= 3 
	  sum += 500
	  s5 = s5 - 3
	end
	if s6 >= 3 
	  sum += 600
	  s6 = s6 - 3
	end }
	
	sum += 100 if s1 == 1
    sum += 200 if s1 == 2
    sum += 50 if s5 == 1
    sum += 100 if s5 == 2
    # puts "#{sum}"
	sum
  end
  
  def sum(n) 
    # puts @@arr_pl
	@n = n
	if @@arr_pl.size < @n 
	  puts 'Player is not exist'
	  enter
	else
	  arr_sum = 6.times.map{ |i| i = 1 + Random.rand(5) }
	   
	   puts arr_sum
       # puts "ARR - #{@@arr_pl}" 
       sum_loc = sum_m(arr_sum)
       @@arr_s[@n-1] += sum_loc
	   puts "sum - #{@@arr_s[@n-1]}"
       puts "WINNER - #{@n}" if @@arr_s[@n-1] >= MAX
       enter if @@arr_s[@n-1] < MAX	   
	end
  end

  def enter
      # print 'Введіть номер гравця який кидає кубіки : '
      print 'Enter number of player : '
	  pl_ = gets
	  
	  sum(pl_.to_i)
  end
  
end

# print 'Введіть кількість гравців (від 2 до 6) : '
print 'Enter how many players (from 2 to 6) : '
pl = gets

while !((2..6).include?(pl.to_i)) do
  puts 'ERROR! Try again'
  print 'Enter how many players (from 2 to 6) : '
  pl = gets
end


games = Dice.new(pl.to_i)
games.player
games.enter




