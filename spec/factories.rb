# This will guess the User class
FactoryGirl.define do  factory :tab do
    name "MyString"
status "MyString"
paid false
  end

  sequence :email do |n|
    "person#{n}@felixcohen.co.uk"
  end

  sequence :admin_email do |n|
    "admin#{n}@felixcohen.co.uk"
  end

  factory :admin do
    email
    password "password"
    password_confirmation "password"
    admin true
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
    date { 2.days.ago }
    business
  end

  factory :business do
    name "Test Business"
  end

  factory :sale do
    product
  end

  factory :discount do
    amount 2
    business
  end

end