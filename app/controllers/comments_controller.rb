class CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content)
  end
end
