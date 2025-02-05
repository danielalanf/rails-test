# frozen_string_literal: true

module ApiExceptions
  class BaseException < StandardError
    include ActiveModel::Serialization
    attr_reader :error

    def initialize(message)
      @error = ErrorStruct.new(message)
    end

    def http_status_code; end
  end
end
