require 'faker'

Product.destroy_all
User.destroy_all
Review.destroy_all

User.create!(
  email: "admin2@email.com",
  username: "admin",
  password: "password",
  password_confirmation: "password",
  admin: true,
)

10.times do |index|
  User.create!(
    email: Faker::Name.first_name + "@email.com",
    username: Faker::Name.first_name,
    password: "password",
    password_confirmation: "password",
  )
end

20.times do |index|
  product = Product.create!(
    name: Faker::Lorem.word + " fish",
    date_caught: Faker::Date.between(8.days.ago, Date.today),
    origin: Faker::LordOfTheRings.location,
    price: Faker::Number.decimal(2, 2),
    description: Faker::Lorem.sentence,
    image: Faker::LoremPixel.image,
  )
  Faker::Number.between(0, 7).times do |index|
    product.reviews.create!(
      comment: Faker::TwinPeaks.quote,
      rating: Faker::Number.between(1, 5),
      user_id: Faker::Number.between(1, 10),
    )
  end
end
