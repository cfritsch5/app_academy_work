class CommentsController < ApplicationController
  before_filter :require_signed_in

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @comment.save
    flash[:errors] = @comment.errors.full_messages
    redirect_to link_url(params[:comment][:link_id])
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment)
  end

  def comment_params
    params.require(:comment).permit(:body, :link_id)
  end
end
