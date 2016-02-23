require 'test_helper'

class ReeksControllerTest < ActionController::TestCase
  setup do
    @reek = reeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reek" do
    assert_difference('Reek.count') do
      post :create, reek: { lantern: @reek.lantern, reek_id: @reek.reek_id }
    end

    assert_redirected_to reek_path(assigns(:reek))
  end

  test "should show reek" do
    get :show, id: @reek
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reek
    assert_response :success
  end

  test "should update reek" do
    patch :update, id: @reek, reek: { lantern: @reek.lantern, reek_id: @reek.reek_id }
    assert_redirected_to reek_path(assigns(:reek))
  end

  test "should remove reek" do
    assert_difference('Reek.count', -1) do
      delete :remove, id: @reek
    end

    assert_redirected_to reeks_path
  end
end
