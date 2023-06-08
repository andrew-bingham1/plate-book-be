class Api::V1::PlatesController < ApplicationController 
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def index
    render json: PlateSerializer.new(Plate.all)
  end
  
  def show
    render json: PlateSerializer.new(Plate.find(params[:id]))
  end

  def options
    headers['Allow'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS'
    render json: { status: "OK" }, status: 200
  end


  private 

  def record_not_found
    render json: {"error":"Plate not found"}, status: :not_found
  end
end