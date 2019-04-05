require 'test_helper'

class InterestsRelationshipsToEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get interests_relationships_to_events_create_url
    assert_response :success
  end

  test "should get destroy" do
    get interests_relationships_to_events_destroy_url
    assert_response :success
  end

end
