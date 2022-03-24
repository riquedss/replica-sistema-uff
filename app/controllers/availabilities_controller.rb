class AvailabilitiesController < ApplicationController
  #Controller para as turmas
  before_action :set_availability, only: [:show, :destroy]

  def index
    render json: Availability.all
  end

  def show
    render json: @availability
  end

  def create
    @availability = Availability.new(availability_params)
    
    if(@availability.save)
      render json: @availability, status: :ok
    else
      render json: @availability.errors, status: 422
    end
  end

  def destroy
    @availability.destroy
  end

  private 
  def set_availability
    @availability = Availability.find(params[:id])
  end
  


  def availability_params
    params.require(:availability).permit(:college_class_id, :course_id)
  end
end
