class Game
require 'colorize'
require './logic.rb'
require './ai.rb'
require './code.rb'
	$colors = ["R", "G", "B", "Y", "P", "C"]

	def initialize(mode)
		play(mode)
	end

	private
	
	def play(mode)
		puts "\nColors : " + "Red".colorize(:red) + " Green".colorize(:green) + " Blue".colorize(:blue) + " Yellow".colorize(:yellow) + " Purple".colorize(:magenta) + " Cyan".colorize(:cyan)
		mode === 1 ? mode_text = "guess" : (mode_text = "enter"; ai = Ai.new)
		puts "#{mode_text} a 4-color combination\nFor example, to #{mode_text} red, green, blue, yellow enter RGBY\n".capitalize!
		@code = set_code(mode)
		@guess = []
		result = []

		i = 1
		catch :success do	
			12.times{
				loop do
					case mode
					when 1
						@guess = gets.chomp.upcase!
						if(Logic.check_entry(@guess)) then
							@guess = Code.new(@guess)
							break
						else input_error
						end
					when 2
						@guess = ai.guess(@guess, result) #return a code object here
						break
					end
				end
				result = Logic.compare_guess(@guess, @code)
				puts "\n"
				puts "\nThe codebreaker guessed " + @guess.combination + "\nColors correct: " + result[0].to_s + "\nPosition correct: " + result[1].to_s + "\nGuesses remaining: " + (12 - i).to_s
				throw :success if result[1] == 4
				i += 1
			}
			puts "\n**The codebreaker failed!**"
			return nil
		end
		puts "\n**The codebreaker won!**"

	end

	def set_code(mode)
		if(mode === 1) then
			return Code.new()
		else
			loop do
				code = gets.chomp.upcase!
				if(Logic.check_entry(code)) then
					return Code.new(code)
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
