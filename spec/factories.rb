FactoryGirl.define do
  factory :user do
    name                            'A User Test'
    email                            'ausertest@test.com'
    login                             'ausertest'
    password                      'test123'
    password_confirmation 'test123'
  end

  factory :player do
  end
end
