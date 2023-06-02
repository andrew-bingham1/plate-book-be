class Api::V1::PostsController < ApplicationController
  def index
    render json: PostSerializer.new(Post.all)
  end

  def create
    require 'pry'; binding.pry
  end
end