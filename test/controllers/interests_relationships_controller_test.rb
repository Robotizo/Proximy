require 'test_helper'

class InterestsRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get interests_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get interests_relationships_destroy_url
    assert_response :success
  end

end
