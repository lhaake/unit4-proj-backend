require "test_helper"

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout = workouts(:one)
  end

  test "should get index" do
    get workouts_url, as: :json
    assert_response :success
  end

  test "should create workout" do
    assert_difference('Workout.count') do
      post workouts_url, params: { workout: { date: @workout.date, description: @workout.description, distance: @workout.distance, exertion: @workout.exertion, isFavorite: @workout.isFavorite, sport: @workout.sport, time: @workout.time, title: @workout.title, url: @workout.url } }, as: :json
    end

    assert_response 201
  end

  test "should show workout" do
    get workout_url(@workout), as: :json
    assert_response :success
  end

  test "should update workout" do
    patch workout_url(@workout), params: { workout: { date: @workout.date, description: @workout.description, distance: @workout.distance, exertion: @workout.exertion, isFavorite: @workout.isFavorite, sport: @workout.sport, time: @workout.time, title: @workout.title, url: @workout.url } }, as: :json
    assert_response 200
  end

  test "should destroy workout" do
    assert_difference('Workout.count', -1) do
      delete workout_url(@workout), as: :json
    end

    assert_response 204
  end
end
