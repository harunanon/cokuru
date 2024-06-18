class ReservationsController < ApplicationController
  before_action :set_coworking_space
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

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

  def set_coworking_space
    @coworking_space = CoworkingSpace.find(params[:coworking_space_id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :start_time, :end_time)
  end
end