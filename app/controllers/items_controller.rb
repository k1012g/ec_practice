class ItemsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	@item.user_id = current_user.id
  	if @item.save!
  		redirect_to user_path(current_user.id)
  	else
  		render :new
  	end
  end

  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  	@item_brand = @item.brand.name
  	@item_category = @item.category.name
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update!(item_params)
  		redirect_to item_path(@item.id)
  	else
  		render :edit
  	end
  end

  def destroy
  	Item.find(params[:id]).destroy
  	redirect_to user_path(current_user.id)
  end

  def buy
    Item.find(params[:id]).update(sales_status: 1)
    redirect_to root_path
  end

  private
  def item_params
  	params.require(:item).permit(:price, :item_image, :body, :title, :user_id, :size, :brand_id, :category_id, :sales_status)
  end
end
