# frozen_string_literal: true

User.all.each do |user|
  rand(5..15).times do
    order = Order.new(number: "R#{rand(11_111_111..99_999_999)}",
                      user_id: user.id,
                      status: ORDER_STATUS.sample,
                      delivery: %w[self today week month].sample,
                      card_number: ::FFaker::Bank.card_number,
                      card_date: ::FFaker::Bank.card_expiry_date,
                      coupon: rand(0..10))
    books = []
    rand(5..15).times do
      books << BooksOrder.new(book_id: Book.all.sample.id)
    end
    order.books_orders << books
    total_item = 0.0
    books.each { |book| total_item += Book.find(book.book_id).price }
    order.subtotal = total_item
    order.order_total = total_item - order.coupon + case order.status
                                                    when "today" then 28.50
                                                    when "week" then 20.00
                                                    when "month" then 10.75
                                                    else 0
                                                    end
    order.save!
  end
end
