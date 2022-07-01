class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: %i[ show update destroy ]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    # # Creating the sibling "API Call" object
    #
    # # ApiCallsController.apikeygen() - Method to generate an API Key
    # # ApiCallsController.apikeyisunique?() - Method to check it is unique in the DB (i.e. in the ApiCall model)
    #
    # loop do
    #   my_api_key = apikeygen()
    # break if my_api_key.apikeyisunique?
    # end 
    #
    # @apicall = ApiCall.new(api_key: my_api_key, game_id: @game.id, user_id: current_user)
    #
    # if @apicall.save
    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
    # else
    #   render json: @apicall.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:game_title, :game_url, :game_descr, :game_type_id, :image_url)
    end
end
