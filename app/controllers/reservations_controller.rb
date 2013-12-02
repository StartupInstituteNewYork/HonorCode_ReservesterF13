class ReservationsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find_by(id: params[:id])
    if @reservation.destroy
      redirect_to @restaurant, notice: 'Reservation successfully deleted'
    else
      redirect_to @restaurant, notice: 'There was an error deleting the reservation'
    end
  end
  
  def show
  end
  
  def index
  end
  
  def new
  end
  
  def edit
  end
  
  def update
  end
  
  private

  def reservation_params
    params.require(:reservation).permit(:email, :requested_date)
  end
end
