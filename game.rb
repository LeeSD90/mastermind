class Game
require 'colorize'
require './logic.rb'
	@@colors = ["R", "G", "B", "Y", "P", "C"]
	

	def initialize(mode)
		if(mode === 1) then @code = Logic.get_random_code(@@colors) end
		play(mode)
	end

	private

#One play method instead?
	
	def play(mode)
		puts "\nColors : " + "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan)
		mode === 1 ? mode_text = "guess" : mode_text = "enter"
		puts "#{mode_text} a 4-color combination\nFor example, to #{mode_text} red, green, blue, yellow enter RGBY\n".capitalize!
		i = 1
		catch :success do	
			12.times{
				print @code #TODO And this
				loop do
					case mode
					when 1
						guess = gets.chomp.upcase!
						if(Logic.check_guess(guess)) then
							result = Logic.compare_guess(guess, @code)
							throw :success if result[1] == 4
							puts "\nColors correct: " + result[0].to_s + "\nPosition correct: " + result[1].to_s + "\nGuesses remaining: " + (12 - i).to_s
							i += 1
							break
						else input_error
						end
					when 2
					end
					
				end
			}
			puts "\n**The codebreaker failed!**"
			return nil
		end
		puts "\n**The codebreaker won!**"
	end

	def play_ai()
		guess = Logic.get_random_code(@@colors).to_s
		puts "\nEnter a 4-color combination\nFor example, to use red, green, blue, yellow enter RGBY\n"
		loop do
			@code = gets.chomp.upcase!
			if(Logic.check_guess(@code)) then
				result = Logic.compare_guess(guess, @code.split(""))
				puts result
				break
			else input_error
			end
		end
	end

	def play_no_ai()
		puts "\nColors : " + "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan)
		puts "\nGuess a 4-color combination\nFor example, to guess red, green, blue, yellow enter RGBY\n"
		i = 1
		catch :success do	
			12.times{
				print @code #TODO And this
				loop do
					guess = gets.chomp.upcase!
					if(Logic.check_guess(guess)) then
						result = Logic.compare_guess(guess, @code)
						throw :success if result[1] == 4
						puts "\nColors correct: " + result[0].to_s + "\nPosition correct: " + result[1].to_s + "\nGuesses remaining: " + (12 - i).to_s
						i += 1
						break
					else input_error
					end
				end
			}
			puts "\n**You failed to break the code!**"
			return nil
		end
		puts "\n**You broke the code!**"
	end

	def input_error
		puts "\nPlease enter your guess in the format RGBY using the available colors: "+ "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan) 
	end

end