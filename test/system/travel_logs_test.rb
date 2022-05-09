require "application_system_test_case"

class TravelLogsTest < ApplicationSystemTestCase
  setup do
    @travel_log = travel_logs(:one)
  end

  test "visiting the index" do
    visit travel_logs_url
    assert_selector "h1", text: "Travel logs"
  end

  test "should create travel log" do
    visit travel_logs_url
    click_on "New travel log"

    fill_in "Date", with: @travel_log.date
    fill_in "Travel log", with: @travel_log.travel_log
    fill_in "Trip name", with: @travel_log.trip_name
    click_on "Create Travel log"

    assert_text "Travel log was successfully created"
    click_on "Back"
  end

  test "should update Travel log" do
    visit travel_log_url(@travel_log)
    click_on "Edit this travel log", match: :first

    fill_in "Date", with: @travel_log.date
    fill_in "Travel log", with: @travel_log.travel_log
    fill_in "Trip name", with: @travel_log.trip_name
    click_on "Update Travel log"

    assert_text "Travel log was successfully updated"
    click_on "Back"
  end

  test "should destroy Travel log" do
    visit travel_log_url(@travel_log)
    click_on "Destroy this travel log", match: :first

    assert_text "Travel log was successfully destroyed"
  end
end
