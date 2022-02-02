# frozen_string_literal: true

if User.where(admin: true).empty?
  User.create!(email: "admin@example.com", password: "password", password_confirmation: "password", admin: true)
end
