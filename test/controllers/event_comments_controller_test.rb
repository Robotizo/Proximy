require 'test_helper'

class EventCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_comment = event_comments(:one)
  end

  test "should get index" do
    get event_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_event_comment_url
    assert_response :success
  end

  test "should create event_comment" do
    assert_difference('EventComment.count') do
      post event_comments_url, params: { event_comment: { content: @event_comment.content, event_post_id: @event_comment.event_post_id, user_id: @event_comment.user_id } }
    end

    assert_redirected_to event_comment_url(EventComment.last)
  end

  test "should show event_comment" do
    get event_comment_url(@event_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_comment_url(@event_comment)
    assert_response :success
  end

  test "should update event_comment" do
    patch event_comment_url(@event_comment), params: { event_comment: { content: @event_comment.content, event_post_id: @event_comment.event_post_id, user_id: @event_comment.user_id } }
    assert_redirected_to event_comment_url(@event_comment)
  end

  test "should destroy event_comment" do
    assert_difference('EventComment.count', -1) do
      delete event_comment_url(@event_comment)
    end

    assert_redirected_to event_comments_url
  end
end
