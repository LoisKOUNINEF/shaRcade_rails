class SharcadesController < ApplicationController
  # before_action :set_score, only: %i[ eat_score ]

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
    puts "you're IN !"

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
