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
    if params[:comment_id]
      comment = Comment.find(params[:comment_id])
      if comment.update(body: params[:body])
        render json: {}, status: 204
      else
        render json: {errors: "Failed to update comment"}, status: 400
      end
    else
      render json: {errors: "Missing comment id"}, status: 404
    end

  end

  private

  def comment_params
    params.require(:params).permit(:body, :post_id, :user_id)
  end
end