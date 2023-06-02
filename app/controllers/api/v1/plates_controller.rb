class Api::V1::PlatesController < ApplicationController 
  def index
    render json: PlateSerializer.new(Plate.all)
  end
end