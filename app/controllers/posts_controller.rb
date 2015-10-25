class PostsController < ApplicationController
	def index
		if session[:user_id]
			@posts = Post.all
			# @posts = Post.starts_with_h
		else
			flash[:alert] = "You must be logged in to view posts"
			redirect_to login_path
		end		
	end

	def create
		@post = Post.create({ body: params[:post][:body], user_id: session[:user_id]})
		# @user = User.find(session[:user_id])
			redirect_to posts_path #NECESSARY for response
	end

	def new
		if session[:user_id]
			@post = Post.new
		else
			flash[:alert] = "You must be logged in to create posts"
			redirect_to login_path
		end		
	end

	def show
		if session[:user_id]
			@post = Post.order(created_at: :desc).find params[:id]
			# @post = Post.all
			# @comments = Post.all.comments
		else
			flash[:alert] = "You must be logged in to view posts"
			redirect_to login_path
		end		
	end


	def update
		@post = Post.find(params[:id])
		@post.update_attributes params[:body]
		redirect_to edit_post_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

end
