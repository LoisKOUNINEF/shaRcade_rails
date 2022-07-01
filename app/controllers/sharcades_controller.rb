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

    # REMINDER - Curl command line for tests
    # curl -X POST -H 'Content-Type: application/json' -d '{"user_email":"player_01@yopmail.com","api_key":"D4b92SXc0j1SdxW","hiscore":999999}' 'http://localhost:3000/sharcade_api'

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

    # puts "***"
    # puts my_received_params
    # puts "***"
    my_filtered_params = sharcade_params
    # puts "*** Hi-Score: " + my_filtered_params.dig(:hiscore)
    # puts "*** API Key: " + my_filtered_params.dig(:api_key)
    # puts "*** user_email: " + my_filtered_params.dig(:user_email)
    puts "****"
    puts "  > user_email"
    puts my_filtered_params[:user_email]
    puts "  > hiscore"
    puts my_filtered_params[:hiscore].to_s + "toto"
    puts "  > api_key:"
    puts my_filtered_params[:api_key]
    puts "****"
    # keygen_1 = ApiCallsController.shaRcadekeygen(16)
    # keygen_2 = ApiCallsController.shaRcadekeygen(16)
    # @my_api_response_1 = {id: 666, api_key: keygen_1, game_id: 1, user_id: 1}
    # @my_api_response_2 = {user_id: 7, game_id: 1, user_key: keygen_2, user_id: 1}
    
    # response = { :message =>,
    #              :object1 => @my_api_response_1, 
    #              :object2 => @my_api_response_2 }
    # render :json => response
    
    # puts "*** Received request on ShaRcade API entry point"
    # render json: {
    #   message: "Got your request and here is the result, Dude!",
    #   game: @my_api_response_1,
    #   apicall: @my_api_response_2
    # }, status: :ok
    # puts "*** Treated request. Goodbye!"

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    # def set_score
    #   @score = Score.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def sharcade_params
      # params.permit(:hiscore, :api_key, :user_email)
      #params.permit(:score_token, :hiscore, :api_key, :user_email)
      # params.require(:sharcade).permit(:hiscore, :api_key, :user_email)
      params.require(:score_token).permit(:hiscore, :api_key, :user_email)
    end

end
