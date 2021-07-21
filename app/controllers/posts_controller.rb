class PostsController < ApplicationController
	# before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	
	def index
		@posts = Post.includes(:user).all
	end
	def new
		@posts = Post.new
	end
	def create
		Post.create(posts_params)
		redirect_to "/"
	end
	def show
		@post = Post.find(params[:id])
		@user = User.all
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		post = Post.find(params[:id])
		post.update(posts_params)
		redirect_to "/"
	end
	
	private 
	def posts_params
		params.require(:post).permit(:title, :image, :introduction, :production_period,
									:material, :tool, :budget,:important).merge(user_id: current_user.id)
  end
	
end
