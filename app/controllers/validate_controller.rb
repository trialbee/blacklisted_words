class ValidateController < ApplicationController
  def validate_string
    render json: Word.blacklisted_words_in(params[:string], params[:type])
  end
end
