class Game
require 'colorize'
require './logic.rb'
	@@colors = ["R", "G", "B", "Y", "P", "C"]
	

	def initialize()
		@code = Logic.get_random_code
		puts @code
		play
	end

	private

	def play()
		puts "\nColors : " + "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan)
		12.times{
			puts "\nGuess a 4-color combination\nFor example, to guess red, green, blue, yellow enter RGBY\n"
			loop do
				guess = gets.chomp.upcase!
				if(Logic.check_guess(guess)) then 
					break
				else puts "\nPlease enter your guess in the format RGBY using the available colors: "+ "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan) 
				end
			end
		}
	end

end