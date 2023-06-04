class Api::V1::SearchController < ApplicationController
  def index
    if params[:category] == "posts"
      render json: PostSerializer.new(Post.search(params[:query])), status: 200
    elsif params[:category] == "plates"
      render json: PlateSerializer.new(Plate.search(params[:query])), status: 200
    else
      render json: {errors: "That category does not exist."}, status: 404
    end
  end
end