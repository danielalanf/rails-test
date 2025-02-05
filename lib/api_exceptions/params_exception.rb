# frozen_string_literal: true

module ApiExceptions
  class ParamsException < ApiExceptions::BaseException
    def http_status_code
      :bad_request
    end
  end
end
