require 'test_helper'

class Internal::DonationItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get internal_donation_items_show_url
    assert_response :success
  end

  test "should get index" do
    get internal_donation_items_index_url
    assert_response :success
  end

  test "should get new" do
    get internal_donation_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get internal_donation_items_edit_url
    assert_response :success
  end

end
