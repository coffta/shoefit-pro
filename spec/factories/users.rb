FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" } # ユニークなメールアドレスを生成する
    nickname              {'test'}
    password              {'password123'}
    password_confirmation {'password123'}
    name                  {'ＡＡＡＡＡ'}
    address               {'123 Main Sts'}
    phone_number          {'12345678901'}
  end
end






