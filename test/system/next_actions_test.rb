require "application_system_test_case"

class NextActionsTest < ApplicationSystemTestCase
  setup do
    @next_action = next_actions(:one)
  end

  test "visiting the index" do
    visit next_actions_url
    assert_selector "h1", text: "Next actions"
  end

  test "should create next action" do
    visit next_actions_url
    click_on "New next action"

    fill_in "Body", with: @next_action.body
    check "Done" if @next_action.done
    fill_in "Project", with: @next_action.project_id
    fill_in "User", with: @next_action.user_id
    click_on "Create Next action"

    assert_text "Next action was successfully created"
    click_on "Back"
  end

  test "should update Next action" do
    visit next_action_url(@next_action)
    click_on "Edit this next action", match: :first

    fill_in "Body", with: @next_action.body
    check "Done" if @next_action.done
    fill_in "Project", with: @next_action.project_id
    fill_in "User", with: @next_action.user_id
    click_on "Update Next action"

    assert_text "Next action was successfully updated"
    click_on "Back"
  end

  test "should destroy Next action" do
    visit next_action_url(@next_action)
    click_on "Destroy this next action", match: :first

    assert_text "Next action was successfully destroyed"
  end
end
