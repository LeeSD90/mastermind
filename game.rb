class Game
require 'colorize'
require './logic.rb'
	@@colors = ["R", "G", "B", "Y", "P", "C"]
	

	def initialize()
		@code = Logic.get_random_code(@@colors)
		play
	end

	private

	def play()
		puts "\nColors : " + "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan)
		1.times{ #TODO CHANGE THIS LATER
			puts "\nGuess a 4-color combination\nFor example, to guess red, green, blue, yellow enter RGBY\n"
			print @code #TODO And this
			loop do
				guess = gets.chomp.upcase!
				if(Logic.check_guess(guess)) then
					
					puts "\n"
					puts Logic.compare_guess(guess, @code)
					break
				else puts "\nPlease enter your guess in the format RGBY using the available colors: "+ "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan) 
				end
			end
		}
	end

end