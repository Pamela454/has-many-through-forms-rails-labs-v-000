class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    post = Post.find_by(comment_params[:user_id])
    #comment.build_user
    post.comments << @comment
    redirect_to @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
