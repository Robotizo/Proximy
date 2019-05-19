require 'test_helper'

class NotificationEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification_event = notification_events(:one)
  end

  test "should get index" do
    get notification_events_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_event_url
    assert_response :success
  end

  test "should create notification_event" do
    assert_difference('NotificationEvent.count') do
      post notification_events_url, params: { notification_event: { event_id: @notification_event.event_id } }
    end

    assert_redirected_to notification_event_url(NotificationEvent.last)
  end

  test "should show notification_event" do
    get notification_event_url(@notification_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_event_url(@notification_event)
    assert_response :success
  end

  test "should update notification_event" do
    patch notification_event_url(@notification_event), params: { notification_event: { event_id: @notification_event.event_id } }
    assert_redirected_to notification_event_url(@notification_event)
  end

  test "should destroy notification_event" do
    assert_difference('NotificationEvent.count', -1) do
      delete notification_event_url(@notification_event)
    end

    assert_redirected_to notification_events_url
  end
end
