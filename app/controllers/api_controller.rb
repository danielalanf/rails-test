# frozen_string_literal: true

class ApiController < ActionController::API
  def validate_params(contract, params)
    validation_result = contract.call(params)
    return validation_result.to_h if validation_result.success?

    # message = validation_result.errors(full: full_error_messages?).messages.to_sentence
    message = "Invalid Params"

    raise Exceptions::ApiExceptions::ValidationParamsException.new(message)
  end
end
