class MenusController < ApplicationController

  before_action :authenticate_user!, except: [:top, :praise]

    
  def top
    @menus = Menu.includes(:user).order("RAND()").limit(3)
  end

  def index
    @menus = Menu.includes(:user).order("created_at DESC")
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.valid?
      @menu.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.valid?
      @menu.update(menu_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    if @menu.destroy
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def praise
  end

  private
  def menu_params
    params.require(:menu).permit(:title, :image, :url, :recipe).merge(user_id: current_user.id)
  end

end
