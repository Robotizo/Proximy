require 'test_helper'

class EventPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_post = event_posts(:one)
  end

  test "should get index" do
    get event_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_event_post_url
    assert_response :success
  end

  test "should create event_post" do
    assert_difference('EventPost.count') do
      post event_posts_url, params: { event_post: { content: @event_post.content, event_id: @event_post.event_id, image: @event_post.image, user_id: @event_post.user_id } }
    end

    assert_redirected_to event_post_url(EventPost.last)
  end

  test "should show event_post" do
    get event_post_url(@event_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_post_url(@event_post)
    assert_response :success
  end

  test "should update event_post" do
    patch event_post_url(@event_post), params: { event_post: { content: @event_post.content, event_id: @event_post.event_id, image: @event_post.image, user_id: @event_post.user_id } }
    assert_redirected_to event_post_url(@event_post)
  end

  test "should destroy event_post" do
    assert_difference('EventPost.count', -1) do
      delete event_post_url(@event_post)
    end

    assert_redirected_to event_posts_url
  end
end
