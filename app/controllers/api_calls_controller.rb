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