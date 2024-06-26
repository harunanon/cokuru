class ReservationsController < ApplicationController

  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :charge] # ログインが必要なアクション名を適宜追加

  def index
    @reservations = Reservation.all.where('day >= ?', Date.current).where('day < ?', Date.current >> 3).order(day: :desc)
  end

  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
  end

  def show
    @date = params[:day]
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @time = reservation_params[:time]
    if @time.present?
      begin
        parsed_time = Time.parse(@time)
        @reservation.start_time = DateTime.new(@reservation.day.year, @reservation.day.month, @reservation.day.day, parsed_time.hour, parsed_time.min)
      rescue ArgumentError
        flash[:error] = "Invalid time format"
      end
    end

    if @reservation.seat_type_id == 0
      flash[:notice] = '席のタイプを選択してください。'
    else
      if @reservation.save!
        redirect_to coworking_spaces_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if user_signed_in? && current_user.id == @reservation.user.id
      @reservation.destroy

      respond_to do |format|
        format.html { redirect_to user_path(current_user.id), notice: 'Reservation was successfully deleted.' }
        format.json { render json: { message: "Reservation deleted successfully" }, status: :ok }
        format.js   { render js: "window.location.href = '#{user_path(current_user.id)}'" }
      end
    else
      respond_to do |format|
        format.html { redirect_to user_path(current_user.id), alert: 'Unauthorized action.' }
        format.json { render json: { error: "Unauthorized action" }, status: :unauthorized }
        format.js { render js: "alert('Unauthorized action.'); window.location = '#{user_path(current_user.id)}';" }
      end
    end
  end

    def charge
      token = params[:payjpToken]
      begin
        charge = Payjp::Charge.create(
          amount: 1000, # 金額（ここでは1000円を仮定）
          card: token,
          currency: 'jpy'
        )
        flash[:notice] = "決済が成功しました。"
      rescue Payjp::PayjpError => e
        flash[:alert] = e.message
      end
      redirect_to reservations_path
    end

  private

  def reservation_params
    params.require(:reservation).permit(:day, :time, :user_id, :start_time, :seat_type_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end