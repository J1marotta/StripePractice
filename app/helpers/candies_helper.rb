module CandiesHelper

	def pretify(amount_in_cents)
		number_to_currency(amount_in_cents.to_f / 100, :precision => 2)
	end

end
