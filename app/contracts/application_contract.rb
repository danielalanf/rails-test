# frozen_string_literal: true

require "dry-validation"

Dry::Validation.load_extensions(:predicates_as_macros)

class ApplicationContract < Dry::Validation::Contract
  import_predicates_as_macros

  config.messages.top_namespace = "api"
  config.messages.default_locale = "pt-BR"
  config.messages.load_paths << "config/locales/pt-BR.api.yml"
end
