class RestaurantsController < ApplicationController
  
  before_filter :authenticate_owner!, only: [:new, :create]
  before_filter :confirm_ownership, only: [:edit, :update, :destroy]
  
	def new
	  @restaurant=Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_param)

		if @restaurant.save
			redirect_to @restaurant, notice: "Restaurant was successfully created"
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def index
		@restaurants = Restaurant.all
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
    @restaurant=Restaurant.find(params[:id])
    if @restaurant.update_attributes(params[:restaurant])
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render action: "edit"
    end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		redirect_to restaurants_path
	end




	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address1, :address2, :city, :state, :zip, :phone, :image, :menu)
	end	
	
	  def confirm_ownership
      restaurant = Restaurant.find(params[:id])
      if restaurant.owner != current_owner
        redirect_to :back, flash: {:alert =>"You don't own this restaurant."}
      end
    end
	
end

