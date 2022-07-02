class ApiCallsController < ApplicationController
  before_action :set_api_call, only: %i[ show update destroy ]

  # GET /api_calls
  def index
    @api_calls = ApiCall.all

    render json: @api_calls
  end

  # GET /api_calls/1
  def show
    render json: @api_call
  end

  # POST /api_calls
  def create
    @api_call = ApiCall.new(api_call_params)

    if @api_call.save
      render json: @api_call, status: :created, location: @api_call
    else
      render json: @api_call.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api_calls/1
  def update
    if @api_call.update(api_call_params)
      render json: @api_call
    else
      render json: @api_call.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api_calls/1
  def destroy
    @api_call.destroy
  end

  # API key generator for api_calls.api_key and users.api_key
  def self.shaRcadekeygen(my_num_char)
    charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
    Array.new(my_num_char) { charset.sample }.join
  end

  # Checks if the given 'key' already exists (false) or is unique (true) in DB
  def self.isAPIkeyunique?(api_call_key)
    return ApiCall.find_by(api_key: api_call_key).nil?
  end

  def self.valid_key?(test_key)
    (test_key.length == 16) && !!(test_key =~ /^[a-zA-Z0-9]{16}$/)
  end

  def self.exists_key?(test_key)
    !ApiCall.find_by(api_key: test_key).nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_call
      @api_call = ApiCall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_call_params
      params.require(:api_call).permit(:api_key, :game_id, :user_id)
    end
end
