class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /workouts
  def index
    @workouts = Workout.where(user_id: @user.id)

    render json: @workouts
  end

  # GET /workouts/1
  def show
    render json: @workout
  end

  # POST /workouts
  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = @user.id

    if @workout.save
      render json: @workout, status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workouts/1
  def update
    if @workout.update(workout_params)
      render json: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workouts/1
  def destroy
    @workout.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:date, :title, :time, :sport, :description, :distance, :exertion, :url, :isFavorite, :user_id)
    end
end
