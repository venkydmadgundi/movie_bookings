module MoviesHelper
	def price_helper(fee)
		if current_user.present?
			return (current_user.gender == "female")? (fee- (5.0/fee)*100 ) : fee
		end
		fee
	end
end
