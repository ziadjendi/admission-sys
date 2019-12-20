require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get interviews_indexshow_url
    assert_response :success
  end

  test "should get new" do
    get interviews_new_url
    assert_response :success
  end

  test "should get edit" do
    get interviews_edit_url
    assert_response :success
  end

  test "should get delete" do
    get interviews_delete_url
    assert_response :success
  end

end
