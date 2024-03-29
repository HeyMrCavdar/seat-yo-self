class ReservationsController < ApplicationController
  def index
  	@reservations = Reservation.all
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = Reservation.new(reservation_params)
    @reservation.user = current_user

    #Save the reservation to the database and redirect
  	if @reservation.save
  		redirect_to restaurants_url, notice: "Your reservation has been made."
  	else
  		redirect_to restaurant_url(@reservation.restaurant), notice: "Sorry, this reservation is unavailable."
  	end
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.present?
      @reservation.destroy
    end
      redirect_to restaurants_url, notice: 'Reservation was successfully destroyed.'
    end

 private
 	def reservation_params
 		params.require(:reservation).permit(:user_id, :time, :party_size, :restaurant_id)
 	end
end

