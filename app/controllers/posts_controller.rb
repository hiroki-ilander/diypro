class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :updqte]
	
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
		post = Post.find(params[:id])
	end
	
	private 
	def posts_params
		params.require(:post).permit(:title, :finished_img, :introduction, :production_period,
									:material, :tool, :budget, :flow_caption1, :flow_img1, :flow_description1,
									:flow_caption2, :flow_img2, :flow_description2, :flow_caption3, :flow_img3,
									:flow_description3, :flow_caption4, :flow_img4, :flow_description4, :flow_caption5,
									:flow_img5, :flow_description5, :important).merge(user_id: current_user.id)
  end
	
end
