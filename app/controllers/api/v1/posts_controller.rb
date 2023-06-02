class Api::V1::PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def index
    render json: PostSerializer.new(Post.all)
  end

  def show 
    render json: PostSerializer.new(Post.find(params[:id]))
  end

  private

  def record_not_found
    render json: {"error":"Post not found"}, status: :not_found
  end
end