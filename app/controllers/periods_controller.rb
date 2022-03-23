class PeriodsController < ApplicationController
  before_action :set_period, only: [:show ,:update, :delete]
  before_action :verify_authenticated_user_director

  def index
    @periods = Period.all
    render json: @periods
  end

  def show
    render json: @period
  end

  def create
    @period = Period.new(params_period.permit(:year, :status, :semester, :user_id))
    if @period.save
      render json: @period, status: :created
    else 
      render json: @period.errors, status: :unprocessable_entity
    end
  end

  def update  
    if @period.update(params_period.permit(:status, :user_id))
      render json: @period, status: :ok
    else 
      render json: @period.errors, status: :not_found
    end
  end

  def delete
    if @period.destroy
      render json: @period, status: :ok
    else
      errors.add("id not found")
      render json: @period.errors, status: :not_found
    end
  end

  private

  def params_period
    params.require(:period)
  end

  def set_period
    @period = Period.find(params[:id])
  end
end
