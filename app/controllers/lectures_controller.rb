class LecturesController < ApplicationController
  #Controller da relacão entre professor e disciplina
  before_action :set_lecture, only: [:show, :destroy]

  def index
    render json: Lecture.all
  end

  def show
    render json: @lecture
  end

  def create
    @lecture = Lecture.new(lecture_params)
    
    if(@lecture.save)
      render json: @lecture, status: :ok
    else
      render json: @lecture.errors, status: 422
    end
  end

  def destroy
    @lecture.destroy
  end

  private 
  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
  
  def lecture_params
    params.require(:lecture).permit(:user_id, :discipline_id)
  end
end
