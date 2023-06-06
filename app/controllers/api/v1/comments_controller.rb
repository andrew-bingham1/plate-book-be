class Api::V1::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment)
    else
      render json: {errors: comment.errors.full_messages}
    end
  end

  private

  def comment_params
    params.require(:params).permit(:body, :post_id, :user_id)
  end
end