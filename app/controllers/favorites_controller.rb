class FavoritesController < ApplicationController
  def create
  	Favorite.create(user_id: current_user.id, item_id: params[:item_id])
  	@item = Item.find(params[:item_id])
  end

  def destroy
  	Favorite.find_by(user_id: current_user.id, item_id: params[:item_id]).destroy
  	@item = Item.find(params[:item_id])
  end
end
