class ValidateController < ApplicationController
  PASSWORD_MAX_LIMIT     = 10_000
  PASSWORDS_MAX_RETURNED = 100

  def validate_string
    render json: Word.blacklisted_words_in(params[:string], params[:type])
  end

  def password
    max_hits = params[:max_hits].blank? ? PASSWORDS_MAX_RETURNED : params[:max_hits].to_i
    password = params[:password]

    ensure_max_hits_conform!(max_hits) or return

    render json: Password.
      where('value like ?', "%#{password}%").
      limit(max_hits).
      map(&:value)
  end

  private 

    def ensure_max_hits_conform!(max_hits)
      if max_hits.zero? || max_hits > PASSWORD_MAX_LIMIT
        error_message = "max_hits must be a number larger than 0 and less than #{PASSWORD_MAX_LIMIT}".freeze
        render text: error_message, status: :bad_request
        false
      else
        true
      end
    end
end
