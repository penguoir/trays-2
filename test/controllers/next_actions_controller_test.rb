require "test_helper"

class NextActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @next_action = next_actions(:one)
  end

  test "should get index" do
    get next_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_next_action_url
    assert_response :success
  end

  test "should create next_action" do
    assert_difference("NextAction.count") do
      post next_actions_url, params: { next_action: { body: @next_action.body, done: @next_action.done, project_id: @next_action.project_id, user_id: @next_action.user_id } }
    end

    assert_redirected_to next_action_url(NextAction.last)
  end

  test "should show next_action" do
    get next_action_url(@next_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_next_action_url(@next_action)
    assert_response :success
  end

  test "should update next_action" do
    patch next_action_url(@next_action), params: { next_action: { body: @next_action.body, done: @next_action.done, project_id: @next_action.project_id, user_id: @next_action.user_id } }
    assert_redirected_to next_action_url(@next_action)
  end

  test "should destroy next_action" do
    assert_difference("NextAction.count", -1) do
      delete next_action_url(@next_action)
    end

    assert_redirected_to next_actions_url
  end
end
