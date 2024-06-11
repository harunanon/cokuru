class ReservationsController < ApplicationController
  before_action :set_coworking_space

  def new
    @reservation = @coworking_space.reservations.new
  end

  def create
    @reservation = @coworking_space.reservations.new(reservation_params)
    if @reservation.save
      redirect_to root_path, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  private

  def set_coworking_space
    @coworking_space = CoworkingSpace.find(params[:coworking_space_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time)
  end
end
