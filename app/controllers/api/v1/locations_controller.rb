class Api::V1::LocationsController < ApplicationController
  def index
    render json: LocationSerializer.new(Post.all)
  end
end
