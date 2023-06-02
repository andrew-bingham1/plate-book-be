class Api::V1::UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index 
    render json: UserSerializer.new(User.all)
  end

  def show 
    render json: UserSerializer.new(User.find(params[:id]))
  end

  private 

  def record_not_found
    render json: {"error":"User not found"}, status: :not_found
  end
end