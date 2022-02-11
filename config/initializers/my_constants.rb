# frozen_string_literal: true

ORDER_STATUS = ["Waiting for processing", "In delivery", "Delivered", "Canceled"].freeze
DELIVERY = {
  self: %w[0 Self-Delivery! Whenever],
  today: ["28.50", "Delivery Today!", "1 days"],
  week: ["20.00", "Delivery During The Week!", "3 to 7 days"],
  month: ["10.75", "Delivery From A Week To A Month!", "7 to 30 days"]
}.freeze
