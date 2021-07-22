class UsersController < ApplicationController
	def show
	@name = current_user.name
    @posts = current_user.posts
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		current_user.update(update_params)
	end
	
	
	private
	def update_params
		params.require(:user).permit(:name, :image)
	end
 
end
