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
		catch :success do
			12.times{ #TODO CHANGE THIS LATER
				puts "\nGuess a 4-color combination\nFor example, to guess red, green, blue, yellow enter RGBY\n"
				print @code #TODO And this
				loop do
					guess = gets.chomp.upcase!
					if(Logic.check_guess(guess)) then
						result = Logic.compare_guess(guess, @code)
						throw :success if result[1] == 4
						puts "\nColors correct: " + result[0].to_s + "\nPosition correct: " + result[1].to_s
						break
					else puts "\nPlease enter your guess in the format RGBY using the available colors: "+ "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan) 
					end
				end
			}
			puts "\n**You failed to break the code!**"
			return nil
		end
		puts "\n**You broke the code!**"
	end

end