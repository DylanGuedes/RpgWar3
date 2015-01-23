FactoryGirl.define do
  factory :user do
    name                            'AUserTest'
    email                            'ausertest@test.com'
    login                             'ausertest123'
    password                      'test1234'
    password_confirmation 'test1234'
  end

  factory :player do
  end
end
