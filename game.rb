class Game
require 'colorize'
require './logic.rb'
	@@colors = ["R", "G", "B", "Y", "P", "C"]
	

	def initialize(mode)
		play(mode)
	end

	private
	
	def play(mode)
		puts "\nColors : " + "Red".colorize(:red) + " Green".colorize(:green) + " Blue".colorize(:blue) + " Yellow".colorize(:yellow) + " Purple".colorize(:magenta) + " Cyan".colorize(:cyan)
		mode === 1 ? mode_text = "guess" : mode_text = "enter"
		puts "#{mode_text} a 4-color combination\nFor example, to #{mode_text} red, green, blue, yellow enter RGBY\n".capitalize!
		@code = set_code(mode)
		@guess = []

		i = 1
		catch :success do	
			12.times{
				loop do
					case mode
					when 1
						@guess = gets.chomp.upcase!
						if(Logic.check_entry(@guess)) then
							result = Logic.compare_guess(@guess, @code)
							puts "\nThe codebreaker guessed " + @guess + "\nColors correct: " + result[0].to_s + "\nPosition correct: " + result[1].to_s + "\nGuesses remaining: " + (12 - i).to_s
							throw :success if result[1] == 4
							i += 1
							break
						else input_error
						end
					when 2
						i === 1 ? @guess = Logic.get_random_code(@@colors).join : @guess = Logic.ai_guess(@guess, @@colors, result)
						result = Logic.compare_guess(@guess, @code)
						puts "\n\nColors correct: " + result[0].to_s + "\nPosition correct: " + result[1].to_s + "\nGuesses remaining: " + (12 - i).to_s
						throw :success if result[1] == 4
						i += 1
						#break
					end
					
				end
			}
			puts "\n**The codebreaker failed!**"
			return nil
		end
		puts "\n**The codebreaker won!**"

	end

	def set_code(mode)
		if(mode === 1) then
			return Logic.get_random_code(@@colors)
		else
			loop do
				code = gets.chomp.upcase!
				if(Logic.check_entry(code)) then
					return code.split("")
					break
				else input_error
				end
			end
		end
	end

	def input_error
		puts "\nPlease enter your code in the format RGBY using the available colors: "+ "R".colorize(:red) + " G".colorize(:green) + " B".colorize(:blue) + " Y".colorize(:yellow) + " P".colorize(:light_magenta) + " C".colorize(:cyan) 
	end

end

=begin
	def play_ai()
		guess = Logic.get_random_code(@@colors).to_s
		puts "\nEnter a 4-color combination\nFor example, to use red, green, blue, yellow enter RGBY\n"
		loop do
			@code = gets.chomp.upcase!
			if(Logic.check_entry(@code)) then
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
					if(Logic.check_entry(guess)) then
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

=end

