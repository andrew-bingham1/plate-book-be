class Api::V1::SearchController < ApplicationController
  def index

    if params[:category] == "posts" && params[:emotion] != "None"
      render json: PostSerializer.new(Post.search_with_emotion(params)), status: 200
    elsif params[:category] == "posts"
      render json: PostSerializer.new(Post.search(params[:query])), status: 200
    elsif params[:category] == "plates"
      render json: PlateSerializer.new(Plate.search(params[:query])), status: 200
    else
      render json: {errors: "That category does not exist."}, status: 404
    end
  end

  def hot_plates
    render json: PlateSerializer.new(Plate.hot)
  end

  def options
    headers['Allow'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    render json: { status: "OK" }, status: 200
  end

end