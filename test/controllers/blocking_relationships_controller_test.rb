require 'test_helper'

class BlockingRelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blocking_relationship = blocking_relationships(:one)
  end

  test "should get index" do
    get blocking_relationships_url
    assert_response :success
  end

  test "should get new" do
    get new_blocking_relationship_url
    assert_response :success
  end

  test "should create blocking_relationship" do
    assert_difference('BlockingRelationship.count') do
      post blocking_relationships_url, params: { blocking_relationship: { blocked_id: @blocking_relationship.blocked_id, blocker_id: @blocking_relationship.blocker_id } }
    end

    assert_redirected_to blocking_relationship_url(BlockingRelationship.last)
  end

  test "should show blocking_relationship" do
    get blocking_relationship_url(@blocking_relationship)
    assert_response :success
  end

  test "should get edit" do
    get edit_blocking_relationship_url(@blocking_relationship)
    assert_response :success
  end

  test "should update blocking_relationship" do
    patch blocking_relationship_url(@blocking_relationship), params: { blocking_relationship: { blocked_id: @blocking_relationship.blocked_id, blocker_id: @blocking_relationship.blocker_id } }
    assert_redirected_to blocking_relationship_url(@blocking_relationship)
  end

  test "should destroy blocking_relationship" do
    assert_difference('BlockingRelationship.count', -1) do
      delete blocking_relationship_url(@blocking_relationship)
    end

    assert_redirected_to blocking_relationships_url
  end
end
