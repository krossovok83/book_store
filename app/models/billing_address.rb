# frozen_string_literal: true

class BillingAddress < Address
  validates :first_name, length: { minimum: 3 }
end
