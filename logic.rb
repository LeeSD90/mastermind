module Logic

	def Logic.check_entry(guess)
		if((guess =~ /^[RGBYPC]{4}$/) != nil) then 
			return true
		else return false
		end
	end

	def Logic.get_random_code(colors)
		code = Array.new(4, -1)

		code.each_with_index{|v, i|
			code[i] = colors[rand(0..5)]
		}

		return code
	end

	def Logic.compare_guess(guess, code)
		chars = guess.split('')
		color_correct = 0
		index_correct = 0

		code.uniq.each {|v| color_correct += chars.count(v)}
		
		chars.each_with_index{ |v, i| if(chars[i] === code[i]) then index_correct += 1 end}

		return color_correct, index_correct
	end

	def Logic.ai_guess(guess, colors, result)
		return Logic.get_random_code(colors).join
	end

end