require 'test_helper'

class EventsRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get events_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get events_relationships_destroy_url
    assert_response :success
  end

end
