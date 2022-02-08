# frozen_string_literal: true

if User.where(admin: true).empty?
  User.create!(email: "admin@example.com", password: "password", admin: true)
  20.times do
    User.create!(email: ::FFaker::Internet.email, password: ::FFaker::Internet.password)
  end
end
