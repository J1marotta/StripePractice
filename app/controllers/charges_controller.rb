class ChargesController < ApplicationController
# Set amount before everything else
	before_action :amount_charged, only: [:new]
	before_action :set_description


	# Empty new fuction
	def new
	end


	# Create uses our StripeTool module to make customers and charges
	def create
  customer = StripeTool.create_customer(email: params[:stripeEmail], stripe_token: params[:stripeToken])

	charge = StripeTool.create_charge(customer_id: customer.id, amount: @amount, description: @description)

  current_user.stripe_id = customer.id

	receipt = Charge.new charge_stripe_token: charge.id, price: @amount, description: @description)

	if Charge.save

	else

	end
	# rescue in case of error
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end


	private


	# Set variable for amount to be charged
	def amount_charged
		@amount = 6000
	end


	# Set description for charge
	def set_description
		@description = "Sales by Rails"
	end

end
