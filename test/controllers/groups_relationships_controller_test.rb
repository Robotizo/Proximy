require 'test_helper'

class GroupsRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get groups_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get groups_relationships_destroy_url
    assert_response :success
  end

end
