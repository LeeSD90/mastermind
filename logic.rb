module Logic

	def Logic.check_guess(guess)
		if((guess =~ /^(?!.*(.).*\1)[RGBYPC]{4}$/) != nil) then 
			return true
		else return false
		end
	end

end