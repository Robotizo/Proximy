require 'test_helper'

class InterestsRelationshipsToGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get interests_relationships_to_groups_create_url
    assert_response :success
  end

  test "should get destroy" do
    get interests_relationships_to_groups_destroy_url
    assert_response :success
  end

end
