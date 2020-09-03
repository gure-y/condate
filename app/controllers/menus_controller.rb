class MenusController < ApplicationController
def top
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

private
def menu_params
  params.require(:menu).permit(:title, :image, :url, :recipe).merge(user_id: current_user.id)
end

end
