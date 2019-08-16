require 'test_helper'

class CitieControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get citie_index_url
    assert_response :success
  end

  test "should get show" do
    get citie_show_url
    assert_response :success
  end

  test "should get new" do
    get citie_new_url
    assert_response :success
  end

  test "should get create" do
    get citie_create_url
    assert_response :success
  end

  test "should get show" do
    get citie_show_url
    assert_response :success
  end

  test "should get update" do
    get citie_update_url
    assert_response :success
  end

  test "should get destroy" do
    get citie_destroy_url
    assert_response :success
  end

end
