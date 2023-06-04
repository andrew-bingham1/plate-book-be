class Api::V1::UserPlatesController < ApplicationController
  def create
    user_plate = UserPlate.new(user_id: params[:user_id], plate_id: params[:plate_id])
    if user_plate.save
      render json: {message: "UserPlate successfully created"}, status: 201
    else
      render json: { errors: user_plate.errors.full_messages }, status: 400
    end
  end

  def destroy
    
  end
end