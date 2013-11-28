class RestaurantsController < ApplicationController
  
  before_filter :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :confirm_ownership, only: [:edit, :update, :destroy]
	
	def new
	  @restaurant=Restaurant.new
    @owner=current_owner
	end

	def create
		@restaurant = current_owner.restaurants.build(restaurant_params)
		@owner=current_owner

		if @restaurant.save
			redirect_to @restaurant, notice: "#{@restaurant.name} was successfully created!"
		else
			render :new
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@owner=current_owner
	end

	def index
		@restaurants = Restaurant.all
	
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@owner=current_owner

    if @restaurant.update_attributes(params[:restaurant])
     redirect_to @restaurant, notice: "#{@restaurant.name} was successfully updated."
		else
			render :edit		
		end
	end

	def destroy
	  @owner=current_owner
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		redirect_to restaurants_path, alert: "#{@restaurant.name} was successfully deleted!"
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address1, :address2, :city, :state, :zip, :phone, :image, :menu, :owner_id)
	end		


  def confirm_ownership
   @restaurant = Restaurant.find(params[:id])
   if @restaurant.owner != current_owner
     redirect_to @restaurant, notice: "You don't own #{@restaurant.name}!"
   end
  end
  

end


