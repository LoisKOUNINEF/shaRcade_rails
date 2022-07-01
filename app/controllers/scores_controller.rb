class ScoresController < ApplicationController
  before_action :set_score, only: %i[ show update destroy ]

  # GET /scores
  def index
    @scores = Score.all

    render json: @scores
  end

  # GET /scores/1
  def show
    render json: @score
  end

  # POST /scores
  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score, status: :created, location: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.update(score_params)
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  def destroy
    @score.destroy
  end

  # Tests if a receive score is a valid number
  def self.valid_score?(test_value)
    test_value.is_a?(Integer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:score, :game_id, :user_id)
    end
end
