require 'colorize'
require './game.rb'

running = true

puts <<-'HEREDOC'




  __  __           _____ _______ ______ _____  __  __ _____ _   _ _____  
 |  \/  |   /\    / ____|__   __|  ____|  __ \|  \/  |_   _| \ | |  __ \ 
 | \  / |  /  \  | (___    | |  | |__  | |__) | \  / | | | |  \| | |  | |
 | |\/| | / /\ \  \___ \   | |  |  __| |  _  /| |\/| | | | | . ` | |  | |
 | |  | |/ ____ \ ____) |  | |  | |____| | \ \| |  | |_| |_| |\  | |__| |
 |_|  |_/_/    \_\_____/   |_|  |______|_|  \_\_|  |_|_____|_| \_|_____/ 

Mastermind is a code-breaking game for two players. 
The Mastermind selects a 4 color combination and the codebreaker attempts to guess it within 12 turns


HEREDOC

while(running)
	puts "\n1.New Game\n2.Exit".colorize(:green)
	puts "\n\n--- Select an option ---\n\n".colorize(:red)
	case gets.chomp
	when "1"
		puts "\nWho will be the codebreaker?\n".colorize(:green)
		puts "\n1.Player\n2.AI".colorize(:green)
		puts "\n\n--- Select an option ---\n\n".colorize(:red)
		loop do
			case gets.chomp
			when "1"
				new_game = Game.new(1)
				break
			when "2"
				new_game = Game.new(2)
				break
			else puts "\nPlease select 1 or 2"
			end
		end
	when "2"
		running = false
	end
end

 

                                                                                  