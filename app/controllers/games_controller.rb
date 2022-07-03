class GamesController < ApplicationController
  # before_action :authenticate_user!, only: %i[ create ]
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

  ## REMINDER - Curl command line for tests (Careful with the single and double quote!)
  # curl -X POST -H 'Content-Type: application/json' -d '{"score_token":{"user_email":"player_01@yopmail.com","api_key":"D4b92SXc0j1SdxW","hi_score":999999}}' 'http://localhost:3000/sharcade_api'
  # curl -X POST -H 'Content-Type: application/json' -d '{"score_token":{"user_email":"player_01@yopmail.com","api_key":"0TtLHvGVHLtWLoNX","hi_score":27031978}}' 'http://localhost:3000/sharcade_api'

  ## REMINDER - Generating a 16-bit API key
  # my_api_key = ApiCallsController.shaRcadekeygen(16)

  ## REMINDER - 2 options to render 2 objects in 1 JSON as a response
  ## Option 1
  # response = { :message =>,
  #              :object1 => @my_api_response_1,
  #              :object2 => @my_api_response_2 }
  # render :json => response
  #
  ## Option 2
  # render json: {
  #   message: "Got your request and here is the result, Dude!",
  #   game: @my_api_response_1,
  #   apicall: @my_api_response_2
  # }, status: :ok

  # POST /games
  def create
    @game = Game.create(game_params)
    current_user = get_user_from_token

    # Creating and fueling the sibling "API Call" object
    # ApiCallsController.apikeygen(n) - Generates a n-symbol-long API Key (16 bytes = 128 bits here below)
    # ApiCallsController.apikeyisunique?(my_key) - Checks if '@my_api_key' does not already exist in the DB (i.e. in the ApiCall model)

    # loop do
      @my_api_key = ApiCallsController.shaRcadekeygen(16)
    # break if ApiCallsController.isAPIkeyunique?(@my_api_key)
    # end

    @apicall = ApiCall.new(api_key: @my_api_key, game_id: @game.id, user_id: current_user.id)

    if @apicall.save
      if @game.save
        render json: {game: @game,  apicall: @apicall}, status: :created
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    else
      render json: @apicall.errors, status: :unprocessable_entity
    end

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
      params.require(:game).permit(:game_title, :game_url, :game_descr, :game_type_id, :image_url, :mobile_ready)
    end

      def get_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],

      Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end

end
