class DisciplineController < ApplicationController
  #Controller da Disciplina
  before_action :set_discipline, only: [:show, :update, :destroy]

  def index
    render json: Discipline.all
  end

  def show
    render json: @discipline
  end

  def create
    @discipline = Discipline.new(discipline_params)
    
    if(@discipline.save)
      render json: @discipline, status: :ok
    else
      render json: @discipline.errors, status: 422
    end
  end

  def update    
    if(@discipline.update(discipline_params))
      render json: @discipline, status: :ok
    else
      render json: @discipline.errors, status: 422
    end
  end

  def destroy
    @discipline.destroy
  end

  private 
  def set_discipline
    @discipline = Discipline.find(params[:id])
  end
  


  def discipline_params
    params.require(:discipline).permit(:name, :hours, :knowledge_area, :department_id)
  end
  
end
