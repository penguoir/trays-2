require "test_helper"

class InboxItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inbox_item = inbox_items(:one)
  end

  test "should get index" do
    get inbox_items_url
    assert_response :success
  end

  test "should get new" do
    get new_inbox_item_url
    assert_response :success
  end

  test "should create inbox_item" do
    assert_difference("InboxItem.count") do
      post inbox_items_url, params: { inbox_item: { body: @inbox_item.body, status: @inbox_item.status } }
    end

    assert_redirected_to inbox_item_url(InboxItem.last)
  end

  test "should show inbox_item" do
    get inbox_item_url(@inbox_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_inbox_item_url(@inbox_item)
    assert_response :success
  end

  test "should update inbox_item" do
    patch inbox_item_url(@inbox_item), params: { inbox_item: { body: @inbox_item.body, status: @inbox_item.status } }
    assert_redirected_to inbox_item_url(@inbox_item)
  end

  test "should destroy inbox_item" do
    assert_difference("InboxItem.count", -1) do
      delete inbox_item_url(@inbox_item)
    end

    assert_redirected_to inbox_items_url
  end
end
