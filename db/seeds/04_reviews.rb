# frozen_string_literal: true

300.times do
  Review.create!(title: ::FFaker::Name.html_safe_name,
                 user_id: User.all.sample.id,
                 book_id: Book.all.sample.id,
                 review: ::FFaker::Book.description,
                 rating: rand(0..5),
                 approved: true)
end
