require 'test_helper'

class EventNotifsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_notifs_index_url
    assert_response :success
  end

  test "should get create" do
    get event_notifs_create_url
    assert_response :success
  end

end
