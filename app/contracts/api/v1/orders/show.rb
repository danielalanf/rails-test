# frozen_string_literal: true

module Api
  module V1
    module Orders
      class Show < ApplicationContract
        params do
          required(:id).filled(:string)
        end
      end
    end
  end
end
