class ReservationsController < ApplicationController
  before_action :set_coworking_space
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def new
    # @reservation = @coworking_space.reservations.build
    @day = params[:day]
    @time = params[:time]
  end
  def create
    @reservation = current_user.reservations.build(reservation_params)
    @time = reservation_params[:time]
    if @reservation.save
      flash[:notice] = '200'
      render :new, status: 200
      # redirect_to @coworking_space, notice: 'Reservation was successfully created.'
    else
      flash[:notice] = '500'
      render :new, status: 500
    end
    if @time.present?
      begin
        parsed_time = Time.parse(@time)
        @reservation.start_time = DateTime.new(2024, 6, 24, parsed_time.hour, parsed_time.min)
      rescue ArgumentError
        flash[:error] = "Invalid time format"
      end
    end
    if @reservation.seat_type_id == 1
      flash[:notice] = '席のタイプを選択してください。'
    else
    end
  end




  private

  def set_coworking_space
    @coworking_space = CoworkingSpace.find(params[:coworking_space_id])
  end

  def reservation_params
    params.permit(:day, :time, :user_id, :start_time, :seat_type_id)
  end
end