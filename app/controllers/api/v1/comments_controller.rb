class Api::V1::CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment)
    else
      render json: {errors: comment.errors.full_messages}, status: 400
    end
  end

  def update
    comment = Comment.find(params[:comment_id])
    if comment.update(body: params[:body])
      render json: CommentSerializer.new(comment), status: 200
    else
      render json: {errors: "Failed to update comment"}, status: 400
    end
  end

  def options
    headers['Allow'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    render json: { status: "OK" }, status: 200
  end

  private
  def record_not_found
    render json: { errors: "Not found" }, status: 404
  end

  def comment_params
    params.require(:params).permit(:body, :post_id, :user_id)
  end
end