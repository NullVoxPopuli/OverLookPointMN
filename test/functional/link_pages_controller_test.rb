require 'test_helper'

class LinkPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_page" do
    assert_difference('LinkPage.count') do
      post :create, :link_page => { }
    end

    assert_redirected_to link_page_path(assigns(:link_page))
  end

  test "should show link_page" do
    get :show, :id => link_pages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => link_pages(:one).to_param
    assert_response :success
  end

  test "should update link_page" do
    put :update, :id => link_pages(:one).to_param, :link_page => { }
    assert_redirected_to link_page_path(assigns(:link_page))
  end

  test "should destroy link_page" do
    assert_difference('LinkPage.count', -1) do
      delete :destroy, :id => link_pages(:one).to_param
    end

    assert_redirected_to link_pages_path
  end
end
