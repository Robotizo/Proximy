require 'test_helper'

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_request = friend_requests(:one)
  end

  test "should get index" do
    get friend_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_request_url
    assert_response :success
  end

  test "should create friend_request" do
    assert_difference('FriendRequest.count') do
      post friend_requests_url, params: { friend_request: { friend_id: @friend_request.friend_id, user_id: @friend_request.user_id } }
    end

    assert_redirected_to friend_request_url(FriendRequest.last)
  end

  test "should show friend_request" do
    get friend_request_url(@friend_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_request_url(@friend_request)
    assert_response :success
  end

  test "should update friend_request" do
    patch friend_request_url(@friend_request), params: { friend_request: { friend_id: @friend_request.friend_id, user_id: @friend_request.user_id } }
    assert_redirected_to friend_request_url(@friend_request)
  end

  test "should destroy friend_request" do
    assert_difference('FriendRequest.count', -1) do
      delete friend_request_url(@friend_request)
    end

    assert_redirected_to friend_requests_url
  end
end
