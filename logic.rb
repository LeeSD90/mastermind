module Logic

	def Logic.check_entry(guess)
		if((guess =~ /^[RGBYPC]{4}$/) != nil) then 
			return true
		else return false
		end
	end

	def Logic.get_random_code()
		code = Array.new(4, -1)

		code.each_with_index{|v, i|
			code[i] = $colors[rand(0..5)]
		}

		return Code.new(code)
	end

	def Logic.compare_guess(guess, code)
		color_correct = 0
		index_correct = 0

		guess = guess.combination.split("")
		code = code.combination.split("")

		color_correct = ((guess & code).flat_map{|x| [x]*[guess.count(x), code.count(x)].min}).count

		guess.each_with_index{ |v, i| if(guess[i] === code[i]) then index_correct += 1 end}

		return color_correct, index_correct
	end

end