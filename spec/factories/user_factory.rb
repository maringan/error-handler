FactoryGirl.define do
  sequence(:iden)   { |n| n }
  sequence(:email)  { |n| "email#{n}@email.com" }

  factory :user do
    iden
    email
  end
end