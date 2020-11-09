FactoryBot.define do
    factory :friendship do
        user { FactoryBot.create(:user) }
        friend { FactoryBot.create(:second_user) }
        confirmed { true }
      end
end
