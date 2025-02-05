# frozen_string_literal: true

class ApiController < ActionController::API
  rescue_from ::ApiExceptions::BaseException, with: :render_error_response

  def validate_params(contract, params)
    validation_result = contract.call(params)
    return validation_result.to_h if validation_result.success?

    message = validation_result.errors(full: true).messages.to_sentence

    raise ::ApiExceptions::ParamsException.new(message)
  end

  def render_error_response(exception)
    render json: exception.error, status: exception.http_status_code
  end
end
