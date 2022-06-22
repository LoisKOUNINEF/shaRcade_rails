require "test_helper"

class ApiCallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_call = api_calls(:one)
  end

  test "should get index" do
    get api_calls_url, as: :json
    assert_response :success
  end

  test "should create api_call" do
    assert_difference("ApiCall.count") do
      post api_calls_url, params: { api_call: { api_key: @api_call.api_key, game_id: @api_call.game_id, user_id: @api_call.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_call" do
    get api_call_url(@api_call), as: :json
    assert_response :success
  end

  test "should update api_call" do
    patch api_call_url(@api_call), params: { api_call: { api_key: @api_call.api_key, game_id: @api_call.game_id, user_id: @api_call.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_call" do
    assert_difference("ApiCall.count", -1) do
      delete api_call_url(@api_call), as: :json
    end

    assert_response :no_content
  end
end
