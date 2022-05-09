require "test_helper"

class TravelLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_log = travel_logs(:one)
  end

  test "should get index" do
    get travel_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_log_url
    assert_response :success
  end

  test "should create travel_log" do
    assert_difference("TravelLog.count") do
      post travel_logs_url, params: { travel_log: { date: @travel_log.date, travel_log: @travel_log.travel_log, trip_name: @travel_log.trip_name } }
    end

    assert_redirected_to travel_log_url(TravelLog.last)
  end

  test "should show travel_log" do
    get travel_log_url(@travel_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_log_url(@travel_log)
    assert_response :success
  end

  test "should update travel_log" do
    patch travel_log_url(@travel_log), params: { travel_log: { date: @travel_log.date, travel_log: @travel_log.travel_log, trip_name: @travel_log.trip_name } }
    assert_redirected_to travel_log_url(@travel_log)
  end

  test "should destroy travel_log" do
    assert_difference("TravelLog.count", -1) do
      delete travel_log_url(@travel_log)
    end

    assert_redirected_to travel_logs_url
  end
end
