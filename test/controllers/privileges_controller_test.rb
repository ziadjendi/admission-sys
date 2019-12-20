require 'test_helper'

class PrivilegesControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get privileges_indexshow_url
    assert_response :success
  end

  test "should get new" do
    get privileges_new_url
    assert_response :success
  end

  test "should get edit" do
    get privileges_edit_url
    assert_response :success
  end

  test "should get delete" do
    get privileges_delete_url
    assert_response :success
  end

end
