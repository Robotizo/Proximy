require 'test_helper'

class GroupCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_comment = group_comments(:one)
  end

  test "should get index" do
    get group_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_group_comment_url
    assert_response :success
  end

  test "should create group_comment" do
    assert_difference('GroupComment.count') do
      post group_comments_url, params: { group_comment: { content: @group_comment.content, group_post_id: @group_comment.group_post_id, user_id: @group_comment.user_id } }
    end

    assert_redirected_to group_comment_url(GroupComment.last)
  end

  test "should show group_comment" do
    get group_comment_url(@group_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_comment_url(@group_comment)
    assert_response :success
  end

  test "should update group_comment" do
    patch group_comment_url(@group_comment), params: { group_comment: { content: @group_comment.content, group_post_id: @group_comment.group_post_id, user_id: @group_comment.user_id } }
    assert_redirected_to group_comment_url(@group_comment)
  end

  test "should destroy group_comment" do
    assert_difference('GroupComment.count', -1) do
      delete group_comment_url(@group_comment)
    end

    assert_redirected_to group_comments_url
  end
end
