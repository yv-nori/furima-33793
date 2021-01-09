FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, max_length: 18, mix_case: true) + "1a"}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    birth_date            {Faker::Date.backward}
 end
end
