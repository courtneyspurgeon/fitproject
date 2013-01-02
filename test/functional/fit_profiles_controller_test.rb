require 'test_helper'

class FitProfilesControllerTest < ActionController::TestCase
  setup do
    @fit_profile = fit_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fit_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fit_profile" do
    assert_difference('FitProfile.count') do
      post :create, :fit_profile => @fit_profile.attributes
    end

    assert_redirected_to fit_profile_path(assigns(:fit_profile))
  end

  test "should show fit_profile" do
    get :show, :id => @fit_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fit_profile
    assert_response :success
  end

  test "should update fit_profile" do
    put :update, :id => @fit_profile, :fit_profile => @fit_profile.attributes
    assert_redirected_to fit_profile_path(assigns(:fit_profile))
  end

  test "should destroy fit_profile" do
    assert_difference('FitProfile.count', -1) do
      delete :destroy, :id => @fit_profile
    end

    assert_redirected_to fit_profiles_path
  end
end
