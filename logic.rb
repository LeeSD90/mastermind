module Logic

	def Logic.check_guess(guess)
		if((guess =~ /^(?!.*(.).*\1)[RGBYPC]{4}$/) != nil) then 
			return true
		else return false
		end
	end

	def Logic.get_random_code()
		code = Array.new(4, -1)

		code.each_with_index{ |v, i| 
			assigning = true
			while(assigning)
				num = rand(0..5)
				if(!code.include?(num)) then code[i] = num; assigning = false; end
			end
		}

		return code
	end

end