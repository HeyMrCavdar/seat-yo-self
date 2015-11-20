class ReservationsController < ApplicationController
  def index
  	@reservations = Reservation.all
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = Reservation.new(reservation_params)

    unless @reservation.restaurant.available?(@reservation.party_size, @reservation.time)
      redirect_to restaurants_url, notice: "Part size is over restaurant capacity."
      return
    end

    @reservation.user = current_user

  	if @reservation.save
  		redirect_to restaurants_url, notice: "Your reservation has been made."
  	else
  		render restaurant_url(@reservation.restaurant), notice: "Sorry, this reservation is unavailable."
  	end
  end

  def update
  end

 private
 	def reservation_params
 		params.require(:reservation).permit(:user_id, :time, :party_size, :restaurant_id)
 	end
end
