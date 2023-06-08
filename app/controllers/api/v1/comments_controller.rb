class Api::V1::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment)
    else
      render json: {errors: comment.errors.full_messages}, status: 400
    end
  end

  def update
    Comment.find(params[:comment_id]).update(body: params[:body])
    require 'pry'; binding.pry
  end

  private

  def comment_params
    params.require(:params).permit(:body, :post_id, :user_id)
  end
end