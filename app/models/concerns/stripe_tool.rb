# This allows me to separate out stripe into smaller chuncks of logic
module StripeTool

	# create customer take in email and token
	def self.create_customer(email: email, stripe_token: stripe_token)
		Stripe::Customer.create(
		email: email,
		source: stripe_token
	)
	end


	# Create charges using passed params
	def self.create_charge(customer_id: customer_id, amount: amount, description: description)
	Stripe::Charge.create(
		customer: customer_id,
		amount: amount,
		description: description,
		currency: 'aud'
	)
	end

end
