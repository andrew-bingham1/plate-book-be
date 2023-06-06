class Api::V1::CommentsController < ApplicationController
  def create
    comment = Comment.new(body: params[:params][:body], post_id: params[:params][:post_id], user_id: params[:params][:user_id])
    if comment.save
      render json: CommentSerializer.new(comment)
    else
      render json: {errors: comment.errors.full_messages}
    end
  end

  private

  def comment_params
    params.permit(:body, :post_id, :user_id)
  end
end