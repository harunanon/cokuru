class CoworkingSpacesController < ApplicationController
  def index
    @coworking_spaces = CoworkingSpace.all
    @user = current_user
    @coworking_space = CoworkingSpace.first # 必要に応じて適切に設定
    @reservations = Reservation.all
    if @coworking_spaces.empty?
      flash[:alert] = "No coworking spaces available."
      redirect_to new_coworking_space_path
    end
  end

  def show
    @coworking_space = CoworkingSpace.find(params[:id])
  end

  def new
    @coworking_space = CoworkingSpace.new
  end

  def create
    @coworking_space = CoworkingSpace.new(coworking_space_params)
    if @coworking_space.save
      redirect_to @coworking_space, notice: 'Coworking space was successfully created.'
    else
      render :new
    end
  end

  private

  def coworking_space_params
    params.require(:coworking_space).permit(:name, :address, :description, :price, :amenities, :admin_id)
  end
end
def set_coworking_space
  @coworking_space = CoworkingSpace.first
  if @coworking_space.nil?
    flash[:alert] = "No coworking spaces available."
    redirect_to new_coworking_space_path
  end
end
