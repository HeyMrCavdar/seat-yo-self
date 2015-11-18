class ReservationsController < ApplicationController
  def index
  	@reservation = Reservation.all
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = Reservation.new(reservation_params)

  	if @reservation.save
  		redirect_to reservations_url, notice: "Your reservation has been made."
  	else
  		render '/restaurants/show', notice "Sorry, this reservation is unavailable."
  	end
  end

  def update
  end
end
