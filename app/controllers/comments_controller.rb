class CommentsController < ApplicationController
	def create
		puts params.inspect
		# @comment = Comment.create ({body: params[:body]})
		@comment = Comment.create({ body: params[:comment][:body], user_id: session[:user_id], post_id: params[:post_id]})
		redirect_to post_path(params[:post_id])
		#need to pass in the id of the post it is in response to, and the id of the user who made the comment
	end



	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		#ADD IF ELSE SO THAT ONLY USER WHO WROTE COMMENT CAN DELETE IT
		redirect_to post_path(@comment.post.id)
	end
end
