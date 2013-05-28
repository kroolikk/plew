require 'test_helper'

class FrontSectionControllerTest < ActionController::TestCase
  test "should get auth_gallery" do
    get :auth_gallery
    assert_response :success
  end

  test "should get com_gallery" do
    get :com_gallery
    assert_response :success
  end

  test "should get review" do
    get :review
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
