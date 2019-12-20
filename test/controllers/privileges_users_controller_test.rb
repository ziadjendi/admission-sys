require 'test_helper'

class PrivilegesUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get privileges_users_indexshow_url
    assert_response :success
  end

  test "should get new" do
    get privileges_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get privileges_users_edit_url
    assert_response :success
  end

  test "should get delete" do
    get privileges_users_delete_url
    assert_response :success
  end

end
