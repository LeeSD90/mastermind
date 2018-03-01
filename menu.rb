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
The Mastermind selects a 4 colour combination and the codebreaker attempts to guess it within 12 turns


HEREDOC

while(running)
	puts "\n1.New Game\n2.Exit".colorize(:green)
	puts "\n\n--- Select an option ---\n\n".colorize(:red)

	case gets.chomp
	when "1"
		new_game = Game.new()
	when "2"
		running = false
	end
end

 

                                                                                  