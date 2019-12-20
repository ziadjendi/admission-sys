require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get candidates_indexshow_url
    assert_response :success
  end

  test "should get new" do
    get candidates_new_url
    assert_response :success
  end

  test "should get edit" do
    get candidates_edit_url
    assert_response :success
  end

  test "should get delete" do
    get candidates_delete_url
    assert_response :success
  end

end
