# frozen_string_literal: true

50.times do
  Book.create!(title: ::FFaker::Book.title,
               author_id: Author.all.sample.id,
               category_id: Category.all.sample.id,
               price: rand(10.0..90.0),
               count: rand(5..30),
               year: rand(1980..2022),
               description: ::FFaker::Book.description,
               height: rand(10.0..30.0),
               weight: rand(10.0..30.0),
               depth: rand(0.4..2.0),
               created_at: DateTime.now,
               updated_at: DateTime.now,
               materials: "#{%w[Hard Soft].sample}cover, #{%w[Glossy Mate Offset Coated Design].sample}paper",
               cover: ::FFaker::Book.orly_cover)
end
