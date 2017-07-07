require 'faker'

Product.destroy_all

50.times do |index|
  product = Product.create!(
    name: Faker::Lorem.word + " fish",
    date_caught: Faker::Date.between(8.days.ago, Date.today),
    origin: Faker::LordOfTheRings.location,
    price: Faker::Number.decimal(2, 2)
  )
  Faker::Number.between(0, 7).times do |index|
    product.reviews.create!(
      comment: Faker::TwinPeaks.quote,
      rating: Faker::Number.between(1, 5),
    )
  end
end
