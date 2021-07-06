class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end
	def new
	end
	def create
		post = Post.new
		post.create(params_create)
	end
	
	private 
	def params_create
		params.require(post).permit(:title, :finished_img, :introduction, :production_period, 
		:material, :tool, :budget, :flow_caption1, :flow_img1, :flow_description1,
		:flow_caption2, :flow_img2, :flow_description2, :flow_caption3, :flow_img3, :flow_description3, 
		:flow_caption4, :flow_img4, :flow_description4, :flow_caption5, :flow_img5, :flow_description5,)
		.merge(user_id: current_user.id)
  end
	
end
