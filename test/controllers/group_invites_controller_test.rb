require 'test_helper'

class GroupInvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get group_invites_create_url
    assert_response :success
  end

end
