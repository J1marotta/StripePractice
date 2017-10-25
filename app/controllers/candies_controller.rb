class CandiesController < ApplicationController
  before_action :set_candy, only: [:create,  :show, :edit, :update, :destroy, :purchased]

  # GET /candies
  # GET /candies.json
  def index
    @candies = Candy.all
  end

  # GET /candies/1
  # GET /candies/1.json
  def show
    @amount = @candy.price
  end

  # GET /candies/new
  def new
    @candy = Candy.new
  end

  #
  #
  # # create for using STRIPE
  # def create
	#   # Amount in cents
	#   @amount = 500
  #
	#   customer = Stripe::Customer.create(
	#     :email => params[:stripeEmail],
	#     :source  => params[:stripeToken]
	#   )
  #
	#   charge = Stripe::Charge.create(
	#     :customer    => customer.id,
	#     :amount      => @amount,
	#     :description => 'Rails Stripe customer',
	#     :currency    => 'aud'
	#   )
  #
  #
	# 	rescue Stripe::CardError => e
	# 	  flash[:error] = e.message
	# 	  redirect_to candies_purchased
	# end
  #


  # GET /candies/1/edit
  def edit
  end

  # POST /candies
  # POST /candies.json
  def create
    @candy = Candy.new(candy_params)
    @candy.user = current_user
    respond_to do |format|
      if @candy.save
        format.html { redirect_to @candy, notice: 'Candy was successfully created.' }
        format.json { render :show, status: :created, location: @candy }
      else
        format.html { render :new }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candies/1
  # PATCH/PUT /candies/1.json
  def update
    respond_to do |format|
      if @candy.update(candy_params)
        format.html { redirect_to @candy, notice: 'Candy was successfully updated.' }
        format.json { render :show, status: :ok, location: @candy }
      else
        format.html { render :edit }
        format.json { render json: @candy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candies/1
  # DELETE /candies/1.json
  def destroy
    @candy.destroy
    respond_to do |format|
      format.html { redirect_to candies_url, notice: 'Candy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchased
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candy
      @candy = Candy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candy_params
      params.require(:candy).permit(:image, :price, :name, :Caption)
    end
end
