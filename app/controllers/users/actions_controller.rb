class Users::ActionsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users/actions
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/actions/1
  def show
    render json: @user
  end

  # # POST /game_types
  # def create
  #   @game_type = GameType.new(game_type_params)

  #   if @game_type.save
  #     render json: @game_type, status: :created, location: @game_type
  #   else
  #     render json: @game_type.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /game_types/1
  # def update
  #   if @game_type.update(game_type_params)
  #     render json: @game_type
  #   else
  #     render json: @game_type.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /game_types/1
  # def destroy
  #   @game_type.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def user_params
    #   params.require(:user).permit(:, :game_type_descr)
    # end

end