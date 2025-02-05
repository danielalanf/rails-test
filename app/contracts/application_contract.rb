# frozen_string_literal: true

require "dry-validation"

class ApplicationContract < Dry::Validation::Contract
  config.messages.default_locale = "pt-BR"
end
