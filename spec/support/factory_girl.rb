FactoryGirl.define do
  factory :university do
    name { "#{Faker::Address.city} #{Faker::Name.name}" }
    sequence :short_name {|n| "#{Fake::name}"}
    
  end
  
end
