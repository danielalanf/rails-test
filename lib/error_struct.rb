# frozen_string_literal: true

class ErrorStruct
  include ActiveModel::Serialization

  attr_reader :message

  def initialize(message)
    @message = message
  end
end
