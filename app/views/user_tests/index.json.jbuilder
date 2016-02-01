json.array!(@user_tests) do |user_test|
  json.extract! user_test, :id, :email, :password
  json.url user_test_url(user_test, format: :json)
end
