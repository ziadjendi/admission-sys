require 'test_helper'

class ParentsControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get parents_indexshow_url
    assert_response :success
  end

  test "should get new" do
    get parents_new_url
    assert_response :success
  end

  test "should get edit" do
    get parents_edit_url
    assert_response :success
  end

  test "should get delete" do
    get parents_delete_url
    assert_response :success
  end

end
