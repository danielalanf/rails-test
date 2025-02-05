# frozen_string_literal: true

module CartStatusTransitions
  extend ActiveSupport::Concern

  included do
    # Incluindo o módulo AASM no modelo
    include AASM

    aasm column: :status, enum: true do
      state :active, initial: true
      state :abandoned
      state :expired
      state :converted
      state :reserved
      state :failed_payment

      event :abandon do
        transitions from: [ :active, :reserved ], to: :abandoned
      end

      event :expire do
        transitions from: [ :active, :reserved ], to: :expired
      end

      event :convert do
        transitions from: [ :active, :reserved ], to: :converted
      end

      event :reserve do
        transitions from: :active, to: :reserved
      end

      event :fail_payment do
        transitions from: :reserved, to: :failed_payment
      end
    end
  end
end
