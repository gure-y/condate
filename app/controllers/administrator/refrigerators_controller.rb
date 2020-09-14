class Administrator::RefrigeratorsController < ApplicationController
  before_action :admin_user

  def index
    @refrigerators = Refrigerator.all
  end

  def new
    @refrigerator = Refrigerator.new
  end

  def create
    @refrigerator = Refrigerator.new(refrigerator_params)
    if @refrigerator.save
      redirect_to administrator_refrigerators_path
    else
      render :new
    end
  end

  def edit
    @refrigerator = Refrigerator.find(params[:id])
  end

  def update
    @refrigerator = Refrigerator.find(params[:id])
    if @refrigerator.valid?
      @refrigerator.update(refrigerator_params)
      redirect_to administrator_refrigerators_path
    else
      render :new
    end
  end

  def destroy
    @refrigerator = Refrigerator.find(params[:id])
    if @refrigerator.destroy
      redirect_to administrator_refrigerators_path
    else
      render :new
    end
  end

  private
  def admin_user
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def refrigerator_params
    params.require(:refrigerator).permit(:image, :cooking, :main, :meat, :fish, :egg, :tofu, :begetable)
  end
end
