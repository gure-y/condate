class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :menu_find

  def create
    bookmark = current_user.bookmarks.new(menu_id: params[:menu_id])
    bookmark.save
  end

  def destroy
    bookmark = Bookmark.find_by(menu_id: params[:menu_id], user_id: current_user.id)
    bookmark.destroy
  end

  private
  def menu_find
    @menu = Menu.find(params[:menu_id])
  end

end
