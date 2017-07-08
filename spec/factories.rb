FactoryGirl.define do
  factory :user do
    username 'K'
    email 'k@email.com'
    password 'password'
    admin false
    id 2
  end

  factory :admin, class: User do
    username 'admin'
    email 'admin2@email.com'
    password 'password'
    password_confirmation 'password'
    admin true
    id 1
  end

  factory :product do
    name Faker::Lorem.word + " fish"
    date_caught Faker::Date.between(8.days.ago, Date.today)
    origin Faker::LordOfTheRings.location
    price Faker::Number.decimal(2, 2)
    description Faker::Lorem.sentence
    image Faker::LoremPixel.image
    id 1
  end

  factory :review do
    comment Faker::TwinPeaks.quote
    rating Faker::Number.between(1, 5)
    user_id 2
  end
end
