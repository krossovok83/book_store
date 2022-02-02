# frozen_string_literal: true

20.times do
  Author.create!(first_name: ::FFaker::Name.unique.first_name, last_name: ::FFaker::Name.unique.last_name)
end
