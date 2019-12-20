require 'test_helper'

class InterviewsStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get interviews_students_indexshow_url
    assert_response :success
  end

  test "should get new" do
    get interviews_students_new_url
    assert_response :success
  end

  test "should get edit" do
    get interviews_students_edit_url
    assert_response :success
  end

  test "should get delete" do
    get interviews_students_delete_url
    assert_response :success
  end

end
