class Api::V1::SearchController < ApplicationController
  def index
    if params[:category] == "posts"
      render json: PostSerializer.new(Post.search(params[:query])), status: 200
    end
  end
end