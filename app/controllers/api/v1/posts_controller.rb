class Api::V1::PostsController < ApplicationController
  def index
    render json: PostSerializer.new(Post.all)
  end

  def create
    json = JSON.parse(params.to_json, symbolize_names: true)
    # plate = Plate.find_or_create_by(plate_number: json[:params][:plate_number])
    # post = Post.create(title: json[:params][:title], body: json[:params][:body])
    require 'pry'; binding.pry
  end

  private

  def posts_params
    params.permit(:title, :body, :plate_number, :photo_url)
  end
end