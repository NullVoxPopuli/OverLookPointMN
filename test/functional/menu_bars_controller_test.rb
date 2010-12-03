require 'test_helper'

class MenuBarsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_bar" do
    assert_difference('MenuBar.count') do
      post :create, :menu_bar => { }
    end

    assert_redirected_to menu_bar_path(assigns(:menu_bar))
  end

  test "should show menu_bar" do
    get :show, :id => menu_bars(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => menu_bars(:one).to_param
    assert_response :success
  end

  test "should update menu_bar" do
    put :update, :id => menu_bars(:one).to_param, :menu_bar => { }
    assert_redirected_to menu_bar_path(assigns(:menu_bar))
  end

  test "should destroy menu_bar" do
    assert_difference('MenuBar.count', -1) do
      delete :destroy, :id => menu_bars(:one).to_param
    end

    assert_redirected_to menu_bars_path
  end
end
