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

  # POST /users/actions
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user/actions/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/actions/1
  def destroy
    @user.destroy
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :nickname, :firstname, :lastname, :role, :birthdate, :gender, :user_key)
    end

end