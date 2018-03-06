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

		return code
	end

	def Logic.compare_guess(guess, code)
		if guess.is_a?(String) then chars = guess.split('') else chars = guess end
		color_correct = 0
		index_correct = 0

		chars.uniq.each {|v| color_correct += code.count(v)}
		
		chars.each_with_index{ |v, i| if(chars[i] === code[i]) then index_correct += 1 end}

		return color_correct, index_correct
	end

	def Logic.map_colors_to_index(my_colors)
		my_colors = my_colors.split("")
		
		my_colors.each_with_index{|v,i|

			my_colors[i] = $colors.index(v)
		}
		return my_colors
	end

	def Logic.map_index_to_colors(my_index)

		my_index.each_with_index{|v, i|
			my_index[i] = $colors[v]
		}

		return my_index
	end

end