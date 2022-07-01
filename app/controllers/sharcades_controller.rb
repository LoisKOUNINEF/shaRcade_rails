class SharcadesController < ApplicationController
  # before_action :set_score, only: %i[ eat_score ]
  respond_to :json

  def eat_score

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
    my_api_call = {id: 666, api_key: shaRcadekeygen(16), game_id: 1, user_id: 1}
    puts "Received request on ShaRcade API entry point"
    render json: {
      message: "Got your request",
      api_call: my_api_call
    }, status: :ok
    puts "Treated request. Goodbye!"

  end

  # API key generator for api_calls.api_key and users.api_key
  def shaRcadekeygen(my_num_char)
    charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
    Array.new(my_num_char) { charset.sample }.join
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    # def set_score
    #   @score = Score.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def sharcade_params
      params.require(:score).permit(:score, :game_id, :user_id)
    end

end
