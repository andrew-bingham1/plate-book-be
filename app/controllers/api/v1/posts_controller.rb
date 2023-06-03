class Api::V1::PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def index
    render json: PostSerializer.new(Post.all)
  end

  def create
    new_params = JSON.parse(params[:params].to_json, symbolize_names: true)
    
    if user = User.find_by_id(new_params[:id])
      post = Post.create(title: new_params[:title], body: new_params[:body], user_id: new_params[:id])
      plate = Plate.find_or_create_by(plate_number: new_params[:plate_number])
      plate.plate_posts.create(post_id: post.id, photo_url: new_params[:photo_url])
      render json: PostSerializer.new(post), status: :created, status: 201
    else ActiveRecord::RecordNotFound
      render json: {errors: "User not found"}, status: 422
    end
  end
  
  def show 
    render json: PostSerializer.new(Post.find(params[:id]))
  end

  private

  def posts_params
    params.permit(:title, :body, :plate_number, :photo_url)
  end

  def record_not_found
    render json: {"error":"Post not found"}, status: :not_found
  end

end