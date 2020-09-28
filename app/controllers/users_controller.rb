class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_user, only:[:edit, :update]


  def show
    @user = User.find(params[:id])
    @menu = @user.menus
    @bookmark_menus = @user.bookmark_menus
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def bookmarks
    @user = User.find(current_user.id)
    @bookmark_menus = @user.bookmark_menus
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def guest_user
    if current_user.email = "test@condate.com"
      redirect_to user_path(current_user)
    end
  end
end
