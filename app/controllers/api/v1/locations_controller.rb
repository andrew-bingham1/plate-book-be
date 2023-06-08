class Api::V1::LocationsController < ApplicationController
  def index
    render json: LocationSerializer.new(Post.all)
  end

  def options
    headers['Allow'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    render json: { status: "OK" }, status: 200
  end

end
