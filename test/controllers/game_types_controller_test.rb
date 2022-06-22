require "test_helper"

class GameTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_type = game_types(:one)
  end

  test "should get index" do
    get game_types_url, as: :json
    assert_response :success
  end

  test "should create game_type" do
    assert_difference("GameType.count") do
      post game_types_url, params: { game_type: { game_type_descr: @game_type.game_type_descr, game_type_title: @game_type.game_type_title } }, as: :json
    end

    assert_response :created
  end

  test "should show game_type" do
    get game_type_url(@game_type), as: :json
    assert_response :success
  end

  test "should update game_type" do
    patch game_type_url(@game_type), params: { game_type: { game_type_descr: @game_type.game_type_descr, game_type_title: @game_type.game_type_title } }, as: :json
    assert_response :success
  end

  test "should destroy game_type" do
    assert_difference("GameType.count", -1) do
      delete game_type_url(@game_type), as: :json
    end

    assert_response :no_content
  end
end
