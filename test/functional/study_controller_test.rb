require 'test_helper'

class StudyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get topic" do
    get :topic
    assert_response :success
  end

  test "should get essay" do
    get :essay
    assert_response :success
  end

  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get read" do
    get :read
    assert_response :success
  end

  test "should get comment" do
    get :comment
    assert_response :success
  end

end
