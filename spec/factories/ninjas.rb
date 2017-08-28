FactoryGirl.define do
  factory :ninja do
    name do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name

      "#{first_name} #{last_name}"
    end

    guardian_name do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name

      "#{first_name} #{last_name}"
    end

    guardian_contact { Faker::Internet.free_email(name) }
    additional_information { Faker::RickAndMorty.quote }
  end
end
