require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url, as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { game_descr: @game.game_descr, game_title: @game.game_title, game_type_id: @game.game_type_id, game_url: @game.game_url, image_url: @game.image_url } }, as: :json
    end

    assert_response :created
  end

  test "should show game" do
    get game_url(@game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { game_descr: @game.game_descr, game_title: @game.game_title, game_type_id: @game.game_type_id, game_url: @game.game_url, image_url: @game.image_url } }, as: :json
    assert_response :success
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game), as: :json
    end

    assert_response :no_content
  end
end
