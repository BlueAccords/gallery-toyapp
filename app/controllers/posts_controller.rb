class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, only: [:new, :create, :edit, 
											:update, :destroy]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post, notice: "Successfully created a new Post"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post was successfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def upvote
		
		if current_user.nil?
			redirect_to new_user_registration_path
		else
			@post.upvote_by current_user
			redirect_to :back
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
