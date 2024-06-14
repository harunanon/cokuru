class ReservationsController < ApplicationController
  before_action :set_coworking_space

  def new
    @coworking_space = CoworkingSpace.find(params[:coworking_space_id])
    @reservation = @coworking_space.reservations.build
  end

  def create
    @coworking_space = CoworkingSpace.find(params[:coworking_space_id])
    @reservation = @coworking_space.reservations.build(reservation_params)
    if @reservation.save
      redirect_to @coworking_space, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :start_time, :end_time)
  end
end