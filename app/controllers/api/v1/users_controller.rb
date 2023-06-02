class Api::V1::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index 
    render json: UserSerializer.new(User.all)
  end

  def show 
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    new_params = JSON.parse(params.to_json, symbolize_names: true)
    user = User.find_or_create_by(email: new_params[:email])
    user.update(uid: new_params[:uid], token: new_params[:token])
    render json: UserSerializer.new(user)
  end

  private 

  def record_not_found
    render json: {"error":"User not found"}, status: :not_found
  end
end