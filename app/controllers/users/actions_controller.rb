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

  # Check for user email format validity using a quite comprehensive RegEx
  def self.valid_email?(test_email)
    !!(test_email =~ /^[a-zA-Z0-9\-\_\.]{2,63}@([\w\-]{2,63}\.)+[a-z]{2,63}$/)
  end

  # Check in ShaRcade DB if any User has this email registered
  def self.exists_email?(test_email)
    !User.find_by(email: test_email).nil?
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