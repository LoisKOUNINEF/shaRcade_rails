class SharcadesController < ApplicationController
  respond_to :json

  def eat_score

    ## REMINDER : request agreed format
    # {"score_token" : { 
    #   "hi-score" : 9999, 
    #   "api_key" : "fds4554FDS45fdsf", 
    #   "user_email" : "player_01@yopmail.com"}
    # }

    ## REMINDER - Curl command line for tests (Careful with the single and double quote!)
    # curl -X POST -H 'Content-Type: application/json' -d '{"score_token":{"user_email":"player_01@yopmail.com","api_key":"D4b92SXc0j1SdxW","hi_score":999999}}' 'http://localhost:3000/sharcade_api'
    # curl -X POST -H 'Content-Type: application/json' -d '{"score_token":{"user_email":"player_01@yopmail.com","api_key":"0TtLHvGVHLtWLoNX","hi_score":27031978}}' 'http://localhost:3000/sharcade_api'
    
    ## REMINDER - Generating a 16-bit API key
    # my_api_key = ApiCallsController.shaRcadekeygen(16)

    my_filtered_params = sharcade_params
    @sc_email = my_filtered_params[:user_email]
    @sc_score = my_filtered_params[:hi_score]
    @sc_key = my_filtered_params[:api_key]

    if (Users::ActionsController.valid_email?(@sc_email))
      if (ScoresController.valid_score?(@sc_score))
        if (ApiCallsController.valid_key?(@sc_key))
          if (Users::ActionsController.exists_email?(@sc_email))
            if (ApiCallsController.exists_key?(@sc_key))
              sc_new_score = Score.new(game_id: ApiCall.find_by(api_key: @sc_key).game_id, 
                                       user_id: User.find_by(email: @sc_email).id, 
                                       score: @sc_score)
              if sc_new_score.save
                # IDEA 1 - What about sending a mail to the PLAYER with the hi-score registration confirmation ?
                # IDEA 2 - Why not informing the editor of this new hi-score (with the e-mail of the related player enclosed... Sales leads are money) ?
                # IDEA 2 - WOuld it be better to refine returned error codes below (kept to 422), even though related JSON messages have been customized already ?
                render json: {message: "If you see this, 'means we got your hi-score in! [Status: entity created / 201]", status: :created}
              else 
                render json: {message: "Sorry, your hi-score could not be processed. [Validated all received info but new hi-score recording into ShaRcade failed]", status: :unprocessable_entity}
              end
            else
              render json: {message: "Sorry, your hi-score could not be processed. [Received API key does not match any ShaRcade registered game]", status: :unprocessable_entity}
            end
          else
            render json: {message: "Sorry, your hi-score could not be processed. [Provided e-mail does not match any ShaRcade member]", status: :unprocessable_entity}
          end
        else
          render json: {message: "Sorry, your hi-score could not be processed. [Invalid API key format / length]", status: :unprocessable_entity}
        end
      else
        render json: {message: "Sorry, your hi-score could not be processed. [Invalid score format]", status: :unprocessable_entity}
      end
    else
      render json: {message: "Sorry, your hi-score could not be processed. [Invalid e-mail format]", status: :unprocessable_entity}
    end
    
    ## REMINDER - Debug data set
    # puts "** BEGIN DEBUG **"
    # print "  > user_email: "
    # puts @sc_email
    # print "  > hi_score"
    # puts @sc_score
    # print "  > api_key:"
    # puts @sc_key
    # puts "** END DEBUG **"
    
  end

  private

    # Only allow the very specific list of trusted parameters through
    def sharcade_params
      params.require(:score_token).permit(:hi_score, :api_key, :user_email)
    end

end
