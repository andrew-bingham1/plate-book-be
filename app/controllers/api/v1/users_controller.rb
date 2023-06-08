class Api::V1::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index 
    render json: UserSerializer.new(User.all), status: 200
  end

  def show 
    render json: UserSerializer.new(User.find(params[:id])), status: 200
  end

  def create
    new_params = JSON.parse(params.to_json, symbolize_names: true)
    user = User.find_or_create_by(email: new_params[:email])
    user.update(uid: new_params[:uid], token: new_params[:token], username: new_params[:uid])
    render json: UserSerializer.new(user), status: 201
  end

  def options
    headers['Allow'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    render json: { status: "OK" }, status: 200
  end

  private 

  def record_not_found
    render json: {"error":"User not found"}, status: 404
  end
end