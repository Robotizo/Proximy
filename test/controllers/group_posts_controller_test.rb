require 'test_helper'

class GroupPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_post = group_posts(:one)
  end

  test "should get index" do
    get group_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_group_post_url
    assert_response :success
  end

  test "should create group_post" do
    assert_difference('GroupPost.count') do
      post group_posts_url, params: { group_post: { content: @group_post.content, image: @group_post.image } }
    end

    assert_redirected_to group_post_url(GroupPost.last)
  end

  test "should show group_post" do
    get group_post_url(@group_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_post_url(@group_post)
    assert_response :success
  end

  test "should update group_post" do
    patch group_post_url(@group_post), params: { group_post: { content: @group_post.content, image: @group_post.image } }
    assert_redirected_to group_post_url(@group_post)
  end

  test "should destroy group_post" do
    assert_difference('GroupPost.count', -1) do
      delete group_post_url(@group_post)
    end

    assert_redirected_to group_posts_url
  end
end
