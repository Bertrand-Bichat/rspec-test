class CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @user = User.last
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = @user
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
