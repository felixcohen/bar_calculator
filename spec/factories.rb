# This will guess the User class
FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@felixcohen.co.uk"
  end

  factory :user do
    email
    password "password"
    password_confirmation "password"
    business
  end

  factory :product do
    name "Test Product"
    cost 6
    date { 3.days.ago }
  end

  factory :business do
    name "Test Business"
  end

  factory :sale do
    product
  end

  factory :discount do
    amount 2
  end

end