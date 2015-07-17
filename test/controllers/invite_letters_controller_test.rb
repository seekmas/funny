require 'test_helper'

class InviteLettersControllerTest < ActionController::TestCase
  setup do
    @invite_letter = invite_letters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invite_letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invite_letter" do
    assert_difference('InviteLetter.count') do
      post :create, invite_letter: { email_content: @invite_letter.email_content, email_list: @invite_letter.email_list, user_id: @invite_letter.user_id }
    end

    assert_redirected_to invite_letter_path(assigns(:invite_letter))
  end

  test "should show invite_letter" do
    get :show, id: @invite_letter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invite_letter
    assert_response :success
  end

  test "should update invite_letter" do
    patch :update, id: @invite_letter, invite_letter: { email_content: @invite_letter.email_content, email_list: @invite_letter.email_list, user_id: @invite_letter.user_id }
    assert_redirected_to invite_letter_path(assigns(:invite_letter))
  end

  test "should destroy invite_letter" do
    assert_difference('InviteLetter.count', -1) do
      delete :destroy, id: @invite_letter
    end

    assert_redirected_to invite_letters_path
  end
end
