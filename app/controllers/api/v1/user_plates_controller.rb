class Api::V1::UserPlatesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def show
    user_plate = UserPlate.find_by(user_id: params[:params][:user_id], plate_id: params[:params][:plate_id])
    if user_plate
      render json: UserPlateSerializer.new(user_plate)
    else
      render json: { errors: "Not found" }, status: 404
    end
  end

  def create
    if UserPlate.find_by(user_id: params[:params][:user_id], plate_id: params[:params][:plate_id])
      render json: {message: "Already Following"}
    else
      user_plate = UserPlate.new(user_id: params[:params][:user_id], plate_id: params[:params][:plate_id])
      if user_plate.save
        render json: {message: "UserPlate successfully created"}, status: 201
      else
        render json: { errors: user_plate.errors.full_messages }, status: 400
      end
    end
  end

  def destroy
    user_plate = UserPlate.find(params[:id])

    if user_plate
      user_plate.destroy
      render json: { message: "UserPlate deleted"}, status: 200
    end
  end

  private
  def record_not_found
    render json: { errors: "Not found" }, status: 404
  end
end