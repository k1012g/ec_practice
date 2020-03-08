class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@buy_item = Item.where(sales_status: params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if params[:delete] == "yes"
			user.profile_image = nil
		end

		if user.update(user_params)
			redirect_to user_path(user.id)
		end
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
