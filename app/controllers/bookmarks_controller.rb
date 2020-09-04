class BookmarksController < ApplicationController

  def create
    @menu = Menu.find(params[:menu_id])
    bookmark = current_user.bookmarks.new(menu_id: params[:menu_id])
    bookmark.save
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    bookmark = Bookmark.find_by(menu_id: params[:menu_id], user_id: current_user.id)
    bookmark.destroy
  end

end
