class MenusController < ApplicationController

  before_action :authenticate_user!, except: [:top]
  before_action :cooking_user, only: [:edit, :update, :destroy]

    
  def top
    @menus = Menu.includes(:user).order("RAND()").limit(4)
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
  end

  def update
    if @menu.valid?
      @menu.update(menu_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    if @menu.destroy
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  private
  def menu_params
    params.require(:menu).permit(:title, :image, :url, :recipe).merge(user_id: current_user.id)
  end

  def cooking_user
    @menu = Menu.find(params[:id])
    redirect_to root_path if @menu.user_id != current_user.id
  end

end
