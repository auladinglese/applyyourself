require 'test_helper'

class CoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cover = covers(:one)
  end

  test "should get index" do
    get covers_url
    assert_response :success
  end

  test "should get new" do
    get new_cover_url
    assert_response :success
  end

  test "should create cover" do
    assert_difference('Cover.count') do
      post covers_url, params: { cover: { job_id: @cover.job_id, letter: @cover.letter, user_id: @cover.user_id } }
    end

    assert_redirected_to cover_url(Cover.last)
  end

  test "should show cover" do
    get cover_url(@cover)
    assert_response :success
  end

  test "should get edit" do
    get edit_cover_url(@cover)
    assert_response :success
  end

  test "should update cover" do
    patch cover_url(@cover), params: { cover: { job_id: @cover.job_id, letter: @cover.letter, user_id: @cover.user_id } }
    assert_redirected_to cover_url(@cover)
  end

  test "should destroy cover" do
    assert_difference('Cover.count', -1) do
      delete cover_url(@cover)
    end

    assert_redirected_to covers_url
  end
end
