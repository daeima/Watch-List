class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save

    flash[:notice] = @bookmark.errors.full_messages.to_sentence unless @bookmark.save

    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
