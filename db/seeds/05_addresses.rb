# frozen_string_literal: true

User.all.each do |user|
  user.billing_address.create!(first_name: ::FFaker::Name.first_name,
                               last_name: ::FFaker::Name.last_name,
                               address: "#{::FFaker::Address.street_address}, #{::FFaker::Address.building_number}",
                               city: ::FFaker::Address.city,
                               country: ::FFaker::Address.country,
                               zip: ::FFaker::AddressUS.zip_code,
                               phone: "#{::FFaker::PhoneNumber.phone_calling_code} #{::FFaker::PhoneNumber.short_phone_number}")
  user.shipping_address.create!(first_name: ::FFaker::Name.first_name,
                                last_name: ::FFaker::Name.last_name,
                                address: "#{::FFaker::Address.street_address}, #{::FFaker::Address.building_number}",
                                city: ::FFaker::Address.city,
                                country: ::FFaker::Address.country,
                                zip: ::FFaker::AddressUS.zip_code,
                                phone: "#{::FFaker::PhoneNumber.phone_calling_code} #{::FFaker::PhoneNumber.short_phone_number}")
end
