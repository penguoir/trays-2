require "application_system_test_case"

class InboxItemsTest < ApplicationSystemTestCase
  setup do
    @inbox_item = inbox_items(:one)
  end

  test "visiting the index" do
    visit inbox_items_url
    assert_selector "h1", text: "Inbox items"
  end

  test "should create inbox item" do
    visit inbox_items_url
    click_on "New inbox item"

    fill_in "Body", with: @inbox_item.body
    fill_in "Status", with: @inbox_item.status
    click_on "Create Inbox item"

    assert_text "Inbox item was successfully created"
    click_on "Back"
  end

  test "should update Inbox item" do
    visit inbox_item_url(@inbox_item)
    click_on "Edit this inbox item", match: :first

    fill_in "Body", with: @inbox_item.body
    fill_in "Status", with: @inbox_item.status
    click_on "Update Inbox item"

    assert_text "Inbox item was successfully updated"
    click_on "Back"
  end

  test "should destroy Inbox item" do
    visit inbox_item_url(@inbox_item)
    click_on "Destroy this inbox item", match: :first

    assert_text "Inbox item was successfully destroyed"
  end
end
