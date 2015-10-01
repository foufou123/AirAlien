class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservations_params)

    redirect_to @reservation.room, notice: "Your reservation has been created"
  end

# why no User_id? because we're passing the user_id as a current_user
  private
   def reservations_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)
  end
end
