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
    user_plate = UserPlate.find_by(user_id: params[:user_id], plate_id: params[:id])
    if user_plate
      user_plate.destroy
      render json: {}, status: 204
    else
      render json: { errors: "Not found" }, status: 404
    end
  end
end