require 'test_helper'

class Internal::WishlistItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get internal_wishlist_items_index_url
    assert_response :success
  end

  test "should get new" do
    get internal_wishlist_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get internal_wishlist_items_edit_url
    assert_response :success
  end

end
