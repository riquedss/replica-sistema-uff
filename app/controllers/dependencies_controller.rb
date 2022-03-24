class DependenciesController < ApplicationController
  #Controller para as turmas
  before_action :set_dependency, only: [:show, :destroy]

  def index
    render json: Dependency.all
  end

  def show
    render json: @dependencies
  end

  def create
    @dependency = Dependency.new(dependency_params)
    
    if(@dependency.save)
      render json: @dependency, status: :ok
    else
      render json: @dependency.errors, status: 422
    end
  end

  def update    
    if(@dependency.update(dependency_params))
      render json: @dependency, status: :ok
    else
      render json: @dependency.errors, status: 422
    end
  end

  def destroy
    @dependency.destroy
  end

  private 
  def set_dependency
    @dependency = Dependency.find(params[:id])
  end
  


  def dependency_params
    params.require(:dependency).permit(:target_id, :requirement_id)
  end
end
