class SharcadesController < ApplicationController
  # before_action :set_score, only: %i[ eat_score ]
  respond_to :json

  def eat_score

    # REMINDER : request agreed format
    # {"score_token" : { 
    #   "hi-score" : "9999", 
    #   "api_key" : "fds4554FDS45fdsf", 
    #   "user_email" : "player_01@yopmail.com"}
    # }

    # REMINDER - Curl command line for test
    # curl -X POST -d "{hiscore:9999,api_key:'fds4554FDS45fdsf',user_email:'player_01@yopmail.com'}" -H "Content-Type: application/json" http://localhost:3000/sharcade_api

    # if ()
    #   render json: {
    #     message: "If you see this, you're in!",
    #     status: OK
    #   }
    # else
    #   render json: {
    #     message: "If you see this, you're in!",
    #     status: :
    #   }
    # end

    my_received_params = sharcade_params
    puts "***"
    puts my_received_params
    puts "***"

    keygen_1 = ApiCallsController.shaRcadekeygen(16)
    keygen_2 = ApiCallsController.shaRcadekeygen(16)
    @my_api_response_1 = {id: 666, api_key: keygen_1, game_id: 1, user_id: 1}
    @my_api_response_2 = {user_id: 7, game_id: 1, user_key: keygen_2, user_id: 1}
    
    # response = { :message =>,
    #              :object1 => @my_api_response_1, 
    #              :object2 => @my_api_response_2 }
    # render :json => response
    
    puts "*** Received request on ShaRcade API entry point"
    render json: {
      message: "Got your request and here is the result, Dude!",
      game: @my_api_response_1,
      apicall: @my_api_response_2
    }, status: :ok
    puts "*** Treated request. Goodbye!"

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    # def set_score
    #   @score = Score.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def sharcade_params
      params.permit(:hiscore, :api_key, :user_email)
    end

end
