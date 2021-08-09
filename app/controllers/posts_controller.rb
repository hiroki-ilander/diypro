class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	before_action :set_post, only: [:show, :edit]
	
	def index
		@posts = Post.includes(:user).order("created_at DESC")
	end
	def new
		@post = Post.new
	end
	def create
		Post.create(posts_params)
		redirect_to "/"
	end
	def show
		@user = User.all
		@comment = Comment.new
		@comments = @post.comments.includes(:user)
		@like = Like.new
	end
	def edit
	end
	def update
		post = Post.find(params[:id])
		post.update(posts_params)
		redirect_to "/"
	end
	def destroy
		Post.destroy(params[:id])
		redirect_to "/"
	end
	private 
	def posts_params
		params.require(:post).permit(:title, :image, :introduction, :production_period,
									:material, :tool, :budget,:important).merge(user_id: current_user.id)
  end
	def set_post
		@post = Post.find(params[:id])
	end
end
