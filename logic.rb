module Logic

	def Logic.check_guess(guess)
		if((guess =~ /^(?!.*(.).*\1)[RGBYPC]{4}$/) != nil) then 
			return true
		else return false
		end
	end

	def Logic.get_random_code(colors)
		code = Array.new(4, -1)

		code.each_with_index{ |v, i| 
			assigning = true
			while(assigning)
				num = rand(0..5)
				if(!code.include?(colors[num])) then code[i] = colors[num]; assigning = false; end
			end
		}

		return code
	end

	def Logic.compare_guess(guess, code)
		chars = guess.split('')
		color_correct = 0
		index_correct = 0

		code.each {|v| if(chars.include?(v)) then
										color_correct += 1;
										if(chars.index(v) == code.index(v)) then
											index_correct += 1;
										end
								end
							 }

		return "Colors correct: " + color_correct.to_s + "\nPosition correct: " + index_correct.to_s
	end

end