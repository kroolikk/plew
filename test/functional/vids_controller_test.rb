require 'test_helper'

class VidsControllerTest < ActionController::TestCase
  setup do
    @vid = vids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vid" do
    assert_difference('Vid.count') do
      post :create, vid: { description: @vid.description, link_to_vid: @vid.link_to_vid, section: @vid.section, title: @vid.title }
    end

    assert_redirected_to vid_path(assigns(:vid))
  end

  test "should show vid" do
    get :show, id: @vid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vid
    assert_response :success
  end

  test "should update vid" do
    put :update, id: @vid, vid: { description: @vid.description, link_to_vid: @vid.link_to_vid, section: @vid.section, title: @vid.title }
    assert_redirected_to vid_path(assigns(:vid))
  end

  test "should destroy vid" do
    assert_difference('Vid.count', -1) do
      delete :destroy, id: @vid
    end

    assert_redirected_to vids_path
  end
end
